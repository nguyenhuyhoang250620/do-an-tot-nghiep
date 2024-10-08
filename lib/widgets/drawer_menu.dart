import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/drawer_list_tile.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key,required this.controller}) : super(key: key);
  final DashBoardController controller;
  final apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal:appPadding,vertical: appPadding*2),
      child: Drawer(
        elevation: 2,
        backgroundColor: bgColor,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(appPadding),
              child: Image.asset("assets/images/logo_naem.png",height: 150,),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: appPadding*2,
                left: appPadding*2,
                bottom: appPadding
              ),
              child: Text("QUẢN LÝ CHỨC NĂNG",style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor),)
            ),
            controller.TQ.value?DrawerListTile(
                  color:controller.name_tab.value == tong_quat?ColorConstant.colorBackgroud:bgColor,
                  title: 'Tổng quát',
                  colorText:controller.name_tab.value == tong_quat?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.home,color: controller.name_tab.value == tong_quat?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                      controller.name_tab.value = tong_quat;
                  }):Container(),
            controller.QLSV.value?DrawerListTile(
                  color: controller.name_tab.value == quan_ly_sinh_vien?ColorConstant.colorBackgroud:bgColor,
                  title: 'Quản lý sinh viên',
                  colorText:controller.name_tab.value == quan_ly_sinh_vien?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.people,color: controller.name_tab.value == quan_ly_sinh_vien?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = quan_ly_sinh_vien;      
                  }):Container(),
             controller.QLGV.value?DrawerListTile(
                  color: controller.name_tab.value == quan_ly_giang_vien?ColorConstant.colorBackgroud:bgColor,
                  title: 'Quản lý giảng viên',
                  colorText: controller.name_tab.value == quan_ly_giang_vien?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.person,color: controller.name_tab.value == quan_ly_giang_vien?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = quan_ly_giang_vien;      
                  }):Container(),
            controller.QLPB.value?DrawerListTile(
                  color:  controller.name_tab.value == quan_ly_phong_ban?ColorConstant.colorBackgroud:bgColor,
                  title: 'Quản lý phòng ban',
                  colorText: controller.name_tab.value == quan_ly_phong_ban?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.class_,color: controller.name_tab.value == quan_ly_phong_ban?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = quan_ly_phong_ban;      
                  }):Container(),
            controller.QLVTPH.value?DrawerListTile(
                  color:controller.name_tab.value == quan_ly_vi_tri_phong_hoc?ColorConstant.colorBackgroud:bgColor,
                  title: 'Quản lý vị trí phòng học',
                  colorText: controller.name_tab.value == quan_ly_vi_tri_phong_hoc?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.room,color: controller.name_tab.value == quan_ly_vi_tri_phong_hoc?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = quan_ly_vi_tri_phong_hoc;      
                  }):Container(),
            controller.QLTC.value?DrawerListTile(
                  color:controller.name_tab.value == quan_ly_tin_chi?ColorConstant.colorBackgroud:bgColor,
                  title: 'Quản lý tín chỉ',
                  colorText: controller.name_tab.value == quan_ly_tin_chi?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.subject,color: controller.name_tab.value == quan_ly_tin_chi?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = quan_ly_tin_chi;      
                  }):Container(),
             controller.QLCH.value?DrawerListTile(
                  color: controller.name_tab.value == quan_ly_ca_hoc?ColorConstant.colorBackgroud:bgColor,
                  title: 'Quản lý ca học',
                  colorText: controller.name_tab.value == quan_ly_ca_hoc?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.lock_clock,color:  controller.name_tab.value == quan_ly_ca_hoc?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = quan_ly_ca_hoc;      
                  }):Container(),
            controller.QLTD.value?DrawerListTile(
                  color: controller.name_tab.value == quan_ly_thuc_don?ColorConstant.colorBackgroud:bgColor,
                  title: 'Quản lý thực đơn',
                  colorText: controller.name_tab.value == quan_ly_thuc_don?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.kitchen,color:  controller.name_tab.value == quan_ly_thuc_don?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = quan_ly_thuc_don;      
                  }):Container(),
             controller.QLP.value?DrawerListTile(
                  color:controller.name_tab.value == quan_ly_phieu?ColorConstant.colorBackgroud:bgColor,
                  title: 'Quản lý phiếu',
                  colorText: controller.name_tab.value == quan_ly_phieu?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.note_alt_outlined,color: controller.name_tab.value == quan_ly_phieu?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = quan_ly_phieu;      
                  }):Container(),
            controller.CHDD.value?DrawerListTile(
                  color:controller.name_tab.value == cau_hinh_he_thong_diem_danh?ColorConstant.colorBackgroud:bgColor,
                  title: 'Cấu hình hệ thống điểm danh',
                  colorText:  controller.name_tab.value == cau_hinh_he_thong_diem_danh?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.confirmation_num,color:  controller.name_tab.value == cau_hinh_he_thong_diem_danh?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = cau_hinh_he_thong_diem_danh;      
                  }):Container(),
             controller.DSDM.value?DrawerListTile(
                  color:controller.name_tab.value == order_food?ColorConstant.colorBackgroud:bgColor,
                  title: 'Danh sách đặt món',
                  colorText: controller.name_tab.value == order_food?ColorConstant.colorBackgroud:textColor,
                  icon: Icon(Icons.list_alt,color: controller.name_tab.value == order_food?ColorConstant.colorBackgroud:textColor,),
                  tap: () {
                    controller.name_tab.value = order_food;      
                  }):Container(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding * 2,vertical: appPadding*2),
              child: Text("TÀI KHOẢN",style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor),)
            ),
            DrawerListTile(
                  color: bgColor,
                  title: 'Đăng suất', 
                  colorText: textColor,
                  icon: Icon(Icons.logout,color:textColor),
                  tap: () {
                    apiClient.logout();
                    controller.name_tab.value = "";
                  }),
          ],
        ),
      ),
    ));
  }
}
