import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/dashboard_content.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/changeNotifier/changeNotifier.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/class_management/class_management.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/config_management/config_management.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/deparment_management.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/settings/settings_management.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/shift_management/shift_management.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/subject_management/subject_management.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/teacher_management.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/drawer_menu.dart';
import 'page/student_management/student_management.dart';


class DashBoardScreen extends GetWidget<DashBoardController> {
  DashBoardScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      drawer: DrawerMenu(controller: controller,),
      key: controller.scaffoldKey,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context)) Container(width: 350,child: DrawerMenu(controller: controller,),),
            Obx(() {
              if(controller.name_tab.value == tong_quat){
                return Expanded(
                  flex: 8,
                  child: DashboardContent()
                );
              }
              else if(controller.name_tab.value == quan_ly_sinh_vien){
                return Expanded(
                  flex: 8,
                  child: StudenManagement(
                    dashboardController: controller,
                  )
                );
              }
              else if(controller.name_tab.value == quan_ly_giang_vien){
                return Expanded(
                  flex: 8,
                  child: TeacherManagement(
                    dashboardController: controller,
                  )
                );
              }
               else if(controller.name_tab.value == quan_ly_phong_ban){
                return Expanded(
                  flex: 8,
                  child: DepartmentManagement(
                    dashboardController: controller,
                  )
                );
              }
               else if(controller.name_tab.value == quan_ly_vi_tri_phong_hoc){
                return Expanded(
                  flex: 8,
                  child: ClassManagement(
                    dashboardController: controller,
                  )
                );
              }
               else if(controller.name_tab.value == quan_ly_tin_chi){
                return Expanded(
                  flex: 8,
                  child: SubjectManagement(
                    dashboardController: controller,
                  )
                );
              }
               else if(controller.name_tab.value == quan_ly_ca_hoc){
                return Expanded(
                  flex: 8,
                  child: ShiftManagement(
                    dashboardController: controller,
                  )
                );
              }
               else if(controller.name_tab.value == cau_hinh_he_thong_diem_danh){
                return Expanded(
                  flex: 8,
                  child: ConfigManagement()
                );
              }
               else if(controller.name_tab.value == settings){
                return Expanded(
                  flex: 8,
                  child: SettingsManagement(
                    texts: ["1","2","3","4","5","6"],
                  )
                );
              }
              return Container();
            },)
          ],
        ),
      ),
    );
  }
}
