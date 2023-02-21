import 'package:do_an_tot_nghiep/presentation/home_screen/models/item_widgets.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/absent_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/onduty_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/paidleave_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/present_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/time_attendance_widget.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/widgets/unpaidleave_widget.dart';
import 'package:do_an_tot_nghiep/widgets/menu_drawer.dart';
import 'package:date_format/date_format.dart';
import 'package:play_kit/play_kit.dart';

import 'controller/home_controller.dart';
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';

class HomeScreen extends GetWidget<HomeController> {
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
        actions: [
          Obx(
            () => Padding(
              padding: getPadding(right: 5),
              child: Center(
                  child: Text(
                '${formatDate(controller.dateTimeNow.value, [HH, ':', nn, ' ', dd, '-', mm, '-', yyyy])}',
                style: AppStyle.txtInterMedium20,
              )),
            ),
          )
        ],
      ),
      backgroundColor: ColorConstant.whiteA700,
      // drawer: Drawer(
      //     child: Scaffold(
      //   appBar: AppBar(
      //     title: Text('Hệ thống quản lý điểm danh'),
      //     automaticallyImplyLeading: false,
      //   ),
      //   body: ListView(
      //     shrinkWrap: true,
      //     padding: EdgeInsets.zero,
      //     children: [
      //       ListTile(
      //         title: Text('Trang chủ'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Thời gian làm việc cá nhân'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //           Get.toNamed(AppRoutes.attendanceWelcomeScreen);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Thời gian làm việc của nhân viên'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Thêm dữ liệu'),
      //         onTap: () {
      //           Get.toNamed(AppRoutes.adddataWelcomeScreen);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Cài đặt tài khoản'),
      //         onTap: () {
      //           // Update the state of the app.
      //           // ...
      //         },
      //       ),
      //     ],
      //   ),
      //   bottomNavigationBar: Container(
      //     height: 80,
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         //Nút đăng xuất trong drawer
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Align(
      //             alignment: Alignment.bottomCenter,
      //             child: Text('Đăng xuất'),
      //           ),
      //         ),
      //         //Thông tin phiên bản
      //         Align(
      //           alignment: Alignment.bottomCenter,
      //           child: Text('Cerberus Cyber Security © 2022'),
      //         ),
      //       ],
      //     ),
      //   ),
      // )),
      drawer: MenuDrawer(),
      body: LayoutBuilder(
        builder: (p0, p1) {
          return Stack(
            alignment: Alignment.center,
            children: [
              CommonImageView(
                width: p1.maxWidth,
                height: p1.maxHeight,
                fit: BoxFit.cover,
                imagePath: ImageConstant.background,
              ),
              PlayContainer(
                height: p1.maxHeight,
                width: p1.maxWidth,
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  childAspectRatio: 1.4,
                  children: [
                    ItemWidgets(
                      title: 'Chấm công cá nhân',
                      content: 'Nội dung',
                      widget: TimeAttendance(
                        controller: controller,
                      ),
                    ),
                    ItemWidgets(
                      title: 'Vắng mặt',
                      content: 'Nội dung',
                      widget: AbsentWidget(),
                    ),
                    ItemWidgets(
                      title: 'Đang đi công tác',
                      content: 'Nội dung',
                      widget: OndutyWidget(),
                    ),
                    ItemWidgets(
                      title: 'Có mặt',
                      content: 'Nội dung',
                      widget: PresentWidget(),
                    ),
                    ItemWidgets(
                      title: 'Nghỉ phép',
                      content: 'Nội dung',
                      widget: PaidLeaveWidget(),
                    ),
                    ItemWidgets(
                      title: 'Nghỉ phép không lương',
                      content: 'Nội dung',
                      widget: UnPaidLeaveWidget(),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ));
  }
}
