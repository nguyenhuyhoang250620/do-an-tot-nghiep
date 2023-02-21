import 'package:do_an_tot_nghiep/core/utils/color_constant.dart';
import 'package:do_an_tot_nghiep/core/utils/size_utils.dart';
import 'package:do_an_tot_nghiep/routes/app_routes.dart';
import 'package:do_an_tot_nghiep/theme/app_style.dart';
import 'package:do_an_tot_nghiep/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/add_data_controller.dart';

class AddDataWelcomeScreen extends GetWidget<AddDataController> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
              extendBodyBehindAppBar: true,
      //back button
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.gray900),
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title
        title: Text("Trang chủ", style: AppStyle.txtInterRegular18.copyWith(color: ColorConstant.gray900, fontSize: getSize(22), fontWeight: FontWeight.w400)),
      ),
      backgroundColor: ColorConstant.whiteA700,
        drawer: MenuDrawer(),
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 59, 127, 237), 
                    ),
                    onPressed: () { 
                      Get.toNamed(AppRoutes.employeeInterface);
                    },
                    child: Text('Danh sách nhân viên'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      primary: Color.fromARGB(255, 59, 127, 237),
                    ),
                    onPressed: () {
                       Get.toNamed(AppRoutes.departmentInterface);
                     },
                    child: Text('Thêm phòng ban'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}