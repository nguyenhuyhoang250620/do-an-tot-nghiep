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
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(appPadding),
            child: Image.asset("assets/images/image_not_found.png",height: 100,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2,vertical: appPadding * 2),
            child: Text("QUẢN LÝ CHỨC NĂNG",)
          ),
          Container(
            color: controller.name_tab.value == tong_quat?enableColor:null,
            child: DrawerListTile(
                title: 'Tổng quát',
                svgSrc: 'assets/images/use_glass.svg',
                tap: () {
                    controller.name_tab.value = tong_quat;
                }),
          ),
          Container(
            color: controller.name_tab.value == quan_ly_sinh_vien?enableColor:null,
            child: DrawerListTile(
                title: 'Quản lý sinh viên',
                svgSrc: 'assets/images/use_glass.svg',
                tap: () {
                  controller.name_tab.value = quan_ly_sinh_vien;      
                }),
          ),
          Container(
            color: controller.name_tab.value == quan_ly_giang_vien?enableColor:null,
            child: DrawerListTile(
                title: 'Quản lý giảng viên',
                svgSrc: 'assets/images/use_glass.svg',
                tap: () {
                  controller.name_tab.value = quan_ly_giang_vien;      
                }),
          ),
          Container(
            color: controller.name_tab.value == quan_ly_phong_ban?Colors.black:null,
            child: DrawerListTile(
                title: 'Quản lý phòng ban',
                svgSrc: 'assets/images/use_glass.svg',
                tap: () {
                  controller.name_tab.value = quan_ly_phong_ban;      
                }),
          ),
          Container(
            color: controller.name_tab.value == quan_ly_vi_tri_phong_hoc?Colors.black:null,
            child: DrawerListTile(
                title: 'Quản lý vị trí phòng học',
                svgSrc: 'assets/images/use_glass.svg',
                tap: () {
                  controller.name_tab.value = quan_ly_vi_tri_phong_hoc;      
                }),
          ),
          Container(
            color: controller.name_tab.value == quan_ly_tin_chi?Colors.black:null,
            child: DrawerListTile(
                title: 'Quản lý tín nhỉ',
                svgSrc: 'assets/images/use_glass.svg',
                tap: () {
                  controller.name_tab.value = quan_ly_tin_chi;      
                }),
          ),
          Container(
            color: controller.name_tab.value == quan_ly_ca_hoc?Colors.black:null,
            child: DrawerListTile(
                title: 'Quản lý ca học',
                svgSrc:'assets/images/use_glass.svg',
                tap: () {
                  controller.name_tab.value = quan_ly_ca_hoc;      
                }),
          ),
          Container(
            color: controller.name_tab.value == cau_hinh_he_thong_diem_danh?Colors.black:null,
            child: DrawerListTile(
                title: 'Cấu hình hệ thống điểm danh',
                svgSrc: 'assets/images/use_glass.svg',
                tap: () {
                  controller.name_tab.value = cau_hinh_he_thong_diem_danh;      
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: appPadding * 2),
            child: Text("TÀI KHOẢN")
          ),
          Container(
            color: controller.name_tab.value == settings?Colors.black:null,
            child: DrawerListTile(
                title: 'Cài đặt',
                svgSrc: 'assets/images/use_glass.svg',
                tap: () {
                  controller.name_tab.value = settings;      
                }),
          ),
          DrawerListTile(
              title: 'Đăng suất', 
              svgSrc: 'assets/images/use_glass.svg', 
              tap: () {
                controller.name_tab.value = "";
              }),
        ],
      ),
    ));
  }
}
