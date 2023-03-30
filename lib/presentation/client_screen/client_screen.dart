

import 'package:do_an_tot_nghiep/libary/data_table_2/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/food_screen/food_screen.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/note/note_client_screen.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/attendance_client_screen/attendance_client_screen.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/statis_screen/statis_screen.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/statis_screen/statis_widget/statis_source.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/widget/env_student.dart';
import 'package:do_an_tot_nghiep/widgets/custom_loading.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_style.dart';
import '../dashboard_screen/constants/constants.dart';
import 'client_page/home_screen/home_screen.dart';

        // Container(
        //   height: Get.height,
        //   width: Get.width,
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage("assets/images/banner.jpeg")
        //     )
        //   ),
        // ),

class ClientScreen extends GetWidget<ClientController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Image.asset('assets/images/top_backgrouds.png'),
                    Expanded(flex: 8,child: Container(),),
                    Obx(() => Text('Xin chào 👋, ${controller.MaGV.value}',style: AppStyle.txtInterRegular14,),),
                    Container(
                      padding: EdgeInsets.all(appPadding*2),
                      child: TextButton(
                        onPressed: () {
                          controller.logout();
                        },  
                      child: Text("Đăng xuất",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == don_phieu?darkTextColor:null),))),
                  ],
                )),
            ),
            Expanded(
              flex: 1,
              child: Obx(() => Container(
                padding: EdgeInsets.symmetric(horizontal: appPadding,vertical: appPadding/2),
                child: Card(
                  // height: Get.height,
                  // width: Get.width,
                  // decoration: BoxDecoration(
                  //   color: bgColor,
                  //   border: Border(top: BorderSide(color: darkTextColor.withOpacity(0.2)))
                  // ),
                  elevation: 4.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(child: Text("𝕬𝖙𝖙𝖊𝖓𝖉𝖆𝖓𝖈𝖊",style: AppStyle.txtInterMedium24.copyWith(color: blue),)),
                      ),
                      Container(
                        padding: EdgeInsets.all(appPadding*2),
                        child: TextButton(
                          onPressed: () {
                            controller.name_menu.value = trang_chu;
                          },
                          child: Text("Trang chủ",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == trang_chu?darkTextColor:null),))),
                      Container(
                        padding: EdgeInsets.all(appPadding*2),
                        child: TextButton(
                          onPressed: () {
                            controller.name_menu.value = thong_ke;
                          },
                          child: Text("Quản lý",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == thong_ke?darkTextColor:null),))),
                      Container(
                        padding: EdgeInsets.all(appPadding*2),
                        child: TextButton(
                          onPressed: () {
                            controller.name_menu.value = am_thuc;
                          },
                          child: Text("Ẩm thực",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == am_thuc?darkTextColor:null),))),
                      Container(
                        padding: EdgeInsets.all(appPadding*2),
                        child: TextButton(
                          onPressed: () {
                            controller.name_menu.value = thong_ke_du_lieu;
                          },  
                          child: Text("Thống kê dữ liệu",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == thong_ke_du_lieu?darkTextColor:null),))),
                      Container(
                        padding: EdgeInsets.all(appPadding*2),
                        child: TextButton(
                          onPressed: () {
                            controller.name_menu.value = don_phieu;
                          },  
                          child: Text("Thống kê phiếu",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == don_phieu?darkTextColor:null),))),
                      Expanded(
                        flex: 5,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
              ),)
            ),
            Expanded(
              flex: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: appPadding,vertical: appPadding/2),
                child: Obx(() {
                  if(controller.name_menu.value == trang_chu){
                    return HomeScreen();
                  }
                  else if(controller.name_menu.value == thong_ke){
                    return StatisScreen();
                  }
                  else if(controller.name_menu.value == am_thuc){
                    return FoodScreen();
                  }
                  else if(controller.name_menu.value == don_phieu){
                    return NoteClientScreen();
                  }
                  return AttendanceEmployee();
                },),
              )
            )
          ],
        ),
      ),
    );
  }

}
