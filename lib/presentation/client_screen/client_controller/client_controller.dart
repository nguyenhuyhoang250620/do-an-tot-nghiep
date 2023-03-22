import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';

import '../../../data/models/config_models.dart';
import '../../../data/models/food_model.dart';
import '../../dashboard_screen/page/food_management/env/env.dart';
import '../../dashboard_screen/page/student_management/widget/env_student.dart';


class ClientController extends GetxController{

  var name_menu = trang_chu.obs;
  final apiClient = ApiClient();
  var so_luong = 0.obs;

  var isLoadingConfig= false.obs;
  RxList<ConfigModel> getConfigList = <ConfigModel>[].obs;
  RxList<Map<String, dynamic>> getConfigListMap = <Map<String, dynamic>>[].obs;
  RxList<FoodModel> getDishList = <FoodModel>[].obs;

  RxList<FoodModel> getDrinksList = <FoodModel>[].obs;

  RxList<FoodModel> getDessertList = <FoodModel>[].obs;

  @override
  void onInit() {
    getConfig();
    getFood();
    super.onInit();
  }

  Future<void> getConfig() async {
    List<ConfigModel> dataGet = [];
    await apiClient.getConfig().then((value) {
      dataGet = value;
    }).whenComplete(() {
      isLoadingConfig.value = true;
      getConfigList.value = dataGet;
      getConfigList.map((element) {
        getConfigListMap.value =element.danhsach.map((person) => person.toJson()).toList();
      }).toList();
    });
  }



  void search(String query,String options) {
    getConfigList.map((element){
    if(options == TenSV.value){
      var result = element.danhsach.where((product) => product.TenSV!.contains(query)).toList();
      getConfigListMap.value =result.map((person) => person.toJson()).toList();
      getConfigListMap.refresh();
    }
    else if(options == MaSV.value){
      var result = element.danhsach.where((product) => product.MaSV!.contains(query)).toList();
      getConfigListMap.value =result.map((person) => person.toJson()).toList();
      getConfigListMap.refresh();
    }
    }).toList();
  }

  Future<void> logout() async{
   await apiClient.logout();
  }

  Future<void> getFood() async {
    getDishList.clear();
    getDrinksList.clear();
    getDessertList.clear();
    List<FoodModel> dataGet = [];
    await apiClient.getFood().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.forEach((e){
        if(e.type == mon_ans.value){
          FoodModel model = FoodModel(
            id: e.id, 
            maMon: e.maMon, 
            khoiLuong: e.khoiLuong, 
            chiTiet: e.chiTiet, 
            tenMonAn: e.tenMonAn, 
            type: e.type, 
            calo: e.calo,
            url: e.url,
            so_luong: 0.obs
          );
          getDishList.add(model);
        }
        else if(e.type == nuoc_uong.value){
          FoodModel model = FoodModel(
            id: e.id, 
            maMon: e.maMon, 
            khoiLuong: e.khoiLuong, 
            chiTiet: e.chiTiet, 
            tenMonAn: e.tenMonAn, 
            type: e.type, 
            calo: e.calo,
            url: e.url,
            so_luong: 0.obs
          );
          getDrinksList.add(model);
        }
        else{
          FoodModel model = FoodModel(
            id: e.id, 
            maMon: e.maMon, 
            khoiLuong: e.khoiLuong, 
            chiTiet: e.chiTiet, 
            tenMonAn: e.tenMonAn, 
            type: e.type, 
            calo: e.calo,
            url: e.url,
            so_luong: 0.obs
          );
          getDessertList.add(model);
        }
      });
    });
  }
}