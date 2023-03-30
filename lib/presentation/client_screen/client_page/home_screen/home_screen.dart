import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/home_screen/home_controller/home_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../widgets/custom_button.dart';

class HomeScreen extends GetWidget<HomeController>{
  final clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: Get.height,
          width: Get.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/banner.jpeg"),
              fit: BoxFit.cover
            )
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: appPadding/4),
          height: Get.height,
          width: Get.width,
          color: darkTextColor.withOpacity(0.5),
        ),
        Container(
          height: Get.height,
          width: Get.width,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(appPadding),
                  height: 400,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Text("Student management",style: AppStyle.txtInterMedium24Gray900.copyWith(color: bgColor),),
                      Text("Quản lý danh sách sinh viên",style:AppStyle.txtInterRegular14.copyWith(color: bgColor),),
                      Expanded(
                      flex: 8,
                      child: Image.asset('assets/images/home_image.png')),
                      InkWell(
                        onTap: () {
                          clientController.name_menu.value = thong_ke;
                        },
                      child: Container(
                        padding: EdgeInsets.all(appPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: blue
                        ),
                        child: Text("Get start",style: AppStyle.txtInterRegular14.copyWith(color: bgColor),)),
                      )
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(appPadding),
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Food management",style: AppStyle.txtInterMedium24Gray900.copyWith(color: bgColor),),
                    Text("Quản lý danh sách thực đơn",style:AppStyle.txtInterRegular14.copyWith(color: bgColor),),
                    Expanded(
                      flex: 8,
                      child: Image.asset('assets/images/foods.png')),
                    InkWell(
                      onTap: () {
                        clientController.name_menu.value = am_thuc;
                      },
                    child: Container(
                      padding: EdgeInsets.all(appPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: blue
                      ),
                      child: Text("Get start",style: AppStyle.txtInterRegular14.copyWith(color: bgColor))),
                    )
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(appPadding),
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Attendance management",style: AppStyle.txtInterMedium24Gray900.copyWith(color: bgColor),),
                    Text("Quản lý danh sách điểm danh",style:AppStyle.txtInterRegular14.copyWith(color: bgColor),),
                    Expanded(
                      flex: 8,
                      child: Image.asset('assets/images/note.png')),
                    InkWell(
                      onTap: () {
                        clientController.name_menu.value = thong_ke_du_lieu;
                      },
                    child: Container(
                      padding: EdgeInsets.all(appPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: blue
                      ),
                      child: Text("Get start",style: AppStyle.txtInterRegular14.copyWith(color: bgColor))),
                    )
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(appPadding),
                  height: 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Attendance management",style: AppStyle.txtInterMedium24Gray900.copyWith(color: bgColor),),
                    Text("Quản lý danh sách điểm danh",style:AppStyle.txtInterRegular14.copyWith(color: bgColor),),
                    Expanded(
                      flex: 8,
                      child: Image.asset('assets/images/note_image.png')),
                    InkWell(
                      onTap: () {
                        clientController.name_menu.value = don_phieu;
                      },
                    child: Container(
                      padding: EdgeInsets.all(appPadding),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: blue
                      ),
                      child: Text("Get start",style: AppStyle.txtInterRegular14.copyWith(color: bgColor))),
                    )
                  ]),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

}