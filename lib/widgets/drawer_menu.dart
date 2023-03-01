import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/drawer_list_tile.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';
class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key,required this.controller}) : super(key: key);
  final DashBoardController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(() => Drawer(
      elevation: 0,
      backgroundColor: ColorConstant.colorDraw.withOpacity(0.5),
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("assets/images/logo_drawer_top.png",height: 70,),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: appPadding*2,
              left: appPadding*2,
              bottom: appPadding
            ),
            child: Text("QUẢN LÝ CHỨC NĂNG",style: AppStyle.txtInterRegular18.copyWith(color: secondaryColor,fontSize: 16),)
          ),
          DrawerListTile(
                color:controller.name_tab.value == tong_quat?ColorConstant.colorBackgroud:null,
                title: 'Tổng quát',
                icon: Icon(Icons.home,color: bgColor,),
                tap: () {
                    controller.name_tab.value = tong_quat;
                }),
          DrawerListTile(
                color: controller.name_tab.value == quan_ly_sinh_vien?ColorConstant.colorBackgroud:null,
                title: 'Quản lý sinh viên',
                icon: Icon(Icons.people,color: bgColor,),
                tap: () {
                  controller.name_tab.value = quan_ly_sinh_vien;      
                }),
           DrawerListTile(
                color: controller.name_tab.value == quan_ly_giang_vien?ColorConstant.colorBackgroud:null,
                title: 'Quản lý giảng viên',
                icon: Icon(Icons.person,color: bgColor,),
                tap: () {
                  controller.name_tab.value = quan_ly_giang_vien;      
                }),
          DrawerListTile(
                color:  controller.name_tab.value == quan_ly_phong_ban?ColorConstant.colorBackgroud:null,
                title: 'Quản lý phòng ban',
                icon: Icon(Icons.class_,color: bgColor,),
                tap: () {
                  controller.name_tab.value = quan_ly_phong_ban;      
                }),
          DrawerListTile(
                color:controller.name_tab.value == quan_ly_vi_tri_phong_hoc?ColorConstant.colorBackgroud:null,
                title: 'Quản lý vị trí phòng học',
                icon: Icon(Icons.room,color: bgColor,),
                tap: () {
                  controller.name_tab.value = quan_ly_vi_tri_phong_hoc;      
                }),
          DrawerListTile(
                color:controller.name_tab.value == quan_ly_tin_chi?ColorConstant.colorBackgroud:null,
                title: 'Quản lý tín chỉ',
                icon: Icon(Icons.subject,color: bgColor,),
                tap: () {
                  controller.name_tab.value = quan_ly_tin_chi;      
                }),
           DrawerListTile(
                color: controller.name_tab.value == quan_ly_ca_hoc?ColorConstant.colorBackgroud:null,
                title: 'Quản lý ca học',
                icon: Icon(Icons.lock_clock,color: bgColor,),
                tap: () {
                  controller.name_tab.value = quan_ly_ca_hoc;      
                }),
          DrawerListTile(
                color:controller.name_tab.value == cau_hinh_he_thong_diem_danh?ColorConstant.colorBackgroud:null,
                title: 'Cấu hình hệ thống điểm danh',
                icon: Icon(Icons.confirmation_num,color: bgColor,),
                tap: () {
                  controller.name_tab.value = cau_hinh_he_thong_diem_danh;      
                }),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: appPadding * 2,vertical: appPadding*2),
          //   child: Text("TÀI KHOẢN",style: AppStyle.txtInterMedium12.copyWith(color: secondaryColor,fontSize: 16),)
          // ),
          // DrawerListTile(
          //       color:controller.name_tab.value == settings?ColorConstant.colorBackgroud:null,
          //       title: 'Cài đặt',
          //       icon: Icon(Icons.settings,color: bgColor,),
          //       tap: () {
          //         controller.name_tab.value = settings;      
          //       }),
          // DrawerListTile(
          //       color: null,
          //       title: 'Đăng suất', 
          //       icon: Icon(Icons.logout,color: bgColor,),
          //       tap: () {
          //         controller.name_tab.value = "";
          //       }),
        ],
      ),
    ));
  }
}
