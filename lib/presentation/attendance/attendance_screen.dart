import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/controller/attendance_controller.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/widget/attendanceBody/attendanceBody.dart';
import 'package:do_an_tot_nghiep/widgets/menu_drawer.dart';
import 'package:flutter/material.dart';

class AttendanceScreen extends GetWidget<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.gray900),
        backgroundColor: Colors.transparent,
        elevation: 0,
        //title
        title: Text("Thời gian làm việc cá nhân",
            style: AppStyle.txtInterRegular18.copyWith(color: ColorConstant.gray900, fontSize: getSize(22), fontWeight: FontWeight.w400)),
      ),
      backgroundColor: ColorConstant.whiteA700,
      drawer: MenuDrawer(),
      body: AttendanceBody(),
    ));
  }
}
