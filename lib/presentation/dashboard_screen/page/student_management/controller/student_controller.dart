import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

class StudentController extends GetxController {
  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();
  List<UserModel> getUserList = <UserModel>[].obs;
  List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[].obs;
  final dashBoardController = Get.find<DashBoardController>();

  TextEditingController ten_sinh_vien = TextEditingController();
  TextEditingController ma_sinh_vien = TextEditingController();
  TextEditingController khoa = TextEditingController();
  TextEditingController ngay_sinh = TextEditingController();
  TextEditingController gioi_tinh = TextEditingController();
  TextEditingController cccd = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController so_dien_thoai = TextEditingController();

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

  Future<void> createUser(
    String ten_sinh_vien,
    String ma_sinh_vien,
    String khoa,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai
  ) async {
    await apiClient.createUser(ten_sinh_vien, ma_sinh_vien, khoa, ngay_sinh, gioi_tinh, cccd, gmail, so_dien_thoai).whenComplete((){
      dashBoardController.getUser();
    });
  }

  Future<void> updateUser(
    String ten_sinh_vien,
    String ma_sinh_vien,
    String khoa,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai
  ) async {
    await apiClient.updateUser(ten_sinh_vien, ma_sinh_vien, khoa, ngay_sinh, gioi_tinh, cccd, gmail, so_dien_thoai).whenComplete((){
      dashBoardController.getUser();
    });
  }
}
