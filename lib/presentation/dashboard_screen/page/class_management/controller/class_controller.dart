import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

class ClassController extends GetxController {
  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();
  List<UserModel> getUserList = <UserModel>[].obs;
  List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[].obs;
  final dashBoardController = Get.find<DashBoardController>();

  TextEditingController ten_may_quet = TextEditingController();
  TextEditingController mo_ta = TextEditingController();
  TextEditingController ma_phong = TextEditingController();
  TextEditingController ten_phong = TextEditingController();


  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


  @override
  void onClose() {
    super.onClose();
  }

  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
    }
  }

  // Future<void> createClass(
  //   String ten_may_quet,
  //   String mo_ta,
  //   String ma_phong,
  //   String ten_phong,
  // ) async {
  //   await apiClient.createUser(ten_may_quet, mo_ta, ma_phong, ten_phong).whenComplete((){
  //     dashBoardController.getUser();
  //   });
  // }

  // Future<void> updateUser(
  //   String ten_may_quet,
  //   String mo_ta,
  //   String ma_phong,
  //   String ten_phong,
  // ) async {
  //   await apiClient.updateUser(ten_may_quet, mo_ta, ma_phong, ten_phong).whenComplete((){
  //     dashBoardController.getUser();
  //   });
  // }
}
