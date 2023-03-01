import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

class DashBoardController extends GetxController {

  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();
  List<UserModel> getUserList = <UserModel>[].obs;
  List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[].obs;
  void onInit() {    
    getUser();
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
  Future<void> getUser() async{
    List<UserModel> dataGet = [];
    List<UserModel> data = [];
    await apiClient.getUser().then((value){
      dataGet = value;
    }).whenComplete((){
      dataGet.map((e){
        UserModel models = UserModel(
          CCCD: e.CCCD,
          Email: e.Email,
          GioiTinh: e.GioiTinh,
          Khoa: e.Khoa,
          MaSV: e.MaSV,
          NamSinh: e.NamSinh,
          SoDT: e.SoDT,
          TenSV: e.TenSV,
          id: e.id
        );
        data.add(models);
      }).toList();
      getUserList = data;
      jsonList = getUserList.map((person) => person.toJson()).toList();
    });
  }
}
