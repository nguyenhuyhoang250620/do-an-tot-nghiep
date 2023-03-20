

import 'package:do_an_tot_nghiep/libary/data_table_2/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/food_screen/food_screen.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/note_screen/note_screen.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/statis_screen/statis_screen.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/widget/client_source.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/widget/env_student.dart';
import 'package:do_an_tot_nghiep/widgets/custom_loading.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_style.dart';
import '../dashboard_screen/constants/constants.dart';
import 'client_page/home_screen/home_screen.dart';

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
                alignment: Alignment.topLeft,
                child: Image.asset('assets/images/top_backgrouds.png')),
            ),
            Expanded(
              flex: 1,
              child: Obx(() => Container(
                height: Get.height,
                width: Get.width,
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
                        child: Text("Thống kê",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == thong_ke?darkTextColor:null),))),
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
                          controller.name_menu.value = don_phieu;
                        },  
                        child: Text("Đơn phiếu",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == don_phieu?darkTextColor:null),))),
                    Expanded(
                      flex: 6,
                      child: Container(),
                    ),
                    Text('Xin chào 👋, Phan Văn Tiến',style: AppStyle.txtInterRegular14,),
                    Container(
                      padding: EdgeInsets.all(appPadding*2),
                      child: TextButton(
                        onPressed: () {
                          controller.logout();
                        },  
                      child: Text("Đăng xuất",style: AppStyle.txtRobotoRegular16.copyWith(fontWeight: FontWeight.bold,color: controller.name_menu.value == don_phieu?darkTextColor:null),))),
                  ],
                ),
              ),)
            ),
            Expanded(
              flex: 7,
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
                return NoteScreen();
              },)
            )
          ],
        ),
      ),
    );
  }

}
