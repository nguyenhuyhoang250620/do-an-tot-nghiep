import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

class DashBoardController extends GetxController {

  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
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
}
