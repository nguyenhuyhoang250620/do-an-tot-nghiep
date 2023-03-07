import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/widget/env_department.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

class DepartmentController extends GetxController {
  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();
  List<UserModel> getUserList = <UserModel>[].obs;
  List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[].obs;
  final dashBoardController = Get.find<DashBoardController>();

  TextEditingController ten_don_vi = TextEditingController();
  TextEditingController ma_don_vi = TextEditingController();
  TextEditingController mo_ta = TextEditingController();

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

  Future<void> createDepartment(
    String ten_don_vi,
    String ma_don_vi,
    String mo_ta,
  ) async {
    await apiClient.createDepartment(ten_don_vi, ma_don_vi, mo_ta).whenComplete((){
      dashBoardController.getDepartment();
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

    void search(String query,String options) {
    if(options == TenDV.value){
      var result = dashBoardController.getDepartmentList.where((product) => product.TenDV!.contains(query)).toList();
      dashBoardController.getDepartmentListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getDepartmentListMap.refresh();
    }
    else if(options == MaDV.value){
      var result = dashBoardController.getDepartmentList.where((product) => product.MaDV!.contains(query)).toList();
      dashBoardController.getDepartmentListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getDepartmentListMap.refresh();
    }
  }
}
