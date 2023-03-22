import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FoodManagementController extends GetxController{

  final dashBoardController = Get.find<DashBoardController>();
  final apiClient = ApiClient();
  RxList<Map<String, dynamic>> type_food =[
    {"type":"Món ăn",},
    {"type":"Nước uống"},
    {"type":"Tráng miệng"},
  ].obs;
  var pathImageAfterPickfileFromComputer = "".obs;
  XFile? pickFileFromComputer;
  Rx<bool> enableUpdateAvatar = false.obs;

  TextEditingController ma_mon = TextEditingController();
  TextEditingController ten_mon_an = TextEditingController();
  TextEditingController calo = TextEditingController();
  TextEditingController khoi_luong =TextEditingController();
  TextEditingController chi_tiet=TextEditingController();
  var hinh_anh=''.obs;
  var type=''.obs;


  //thay avatar
    Future<void> pickFileWeb() async {
    var getImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    pickFileFromComputer = getImage;

    pathImageAfterPickfileFromComputer.value = pickFileFromComputer!.path;
    if (pathImageAfterPickfileFromComputer.value != '') {
      enableUpdateAvatar.value = true;
    }
    hinh_anh.value = getImage!.name;
    // debugPrint('TungVD - name - ${name}');
  }

    Future<void> updateImage(String ma_mon) async {
    var getImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    await apiClient.UpdateAvatar(masv: '',files: getImage,magv: '',ma_mon: ma_mon);
    dashBoardController.getFood();
  }

  Future<void> updateFood(
    String ma_mon,
    String ten_mon_an,
    String calo,
    String khoi_luong,
    String chi_tiet,
    String type,
  ) async{
    await apiClient.updateFood(ma_mon, ten_mon_an, calo, khoi_luong, chi_tiet, type);
    dashBoardController.getFood();
  }

  Future<void> createFood(
    String ma_mon,
    String ten_mon_an,
    String calo,
    String khoi_luong,
    String chi_tiet,
    String hinh_anh,
    String type,
  ) async{
    await apiClient.createFood(ma_mon, ten_mon_an, calo, khoi_luong, chi_tiet, hinh_anh, type);
    dashBoardController.getFood();
  }

  Future<void>deleteFood(String ma_mon)async{
    await apiClient.deleteFood(ma_mon);
    dashBoardController.getFood();
  }
}