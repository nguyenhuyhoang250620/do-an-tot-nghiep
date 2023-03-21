import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';

import '../../../data/models/config_models.dart';
import '../../dashboard_screen/page/student_management/widget/env_student.dart';

class ClientController extends GetxController{

  var name_menu = trang_chu.obs;
  final apiClient = ApiClient();
  var so_luong = 0.obs;

  var isLoadingConfig= false.obs;
  RxList<ConfigModel> getConfigList = <ConfigModel>[].obs;
  RxList<Map<String, dynamic>> getConfigListMap = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    getConfig();
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
}