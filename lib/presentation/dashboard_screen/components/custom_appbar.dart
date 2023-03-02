import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/profile_info.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/changeNotifier/changeNotifier.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';


class CustomAppbar extends StatelessWidget {
  CustomAppbar({Key? key}) : super(key: key);
  final controller = Get.find<DashBoardController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              onPressed:() {
                controller.controlMenu();
              },
              icon: Icon(Icons.menu,color: textColor.withOpacity(0.5),),
            ),
          Expanded(child: Center(
            child: Text("PHẦN MỀM QUẢN LÝ NHÂN SỰ VÀ CẤU HÌNH ĐIỂM DANH HỌC VIỆN QUẢN LÝ GIÁO DỤC NĂM 2023-2024",
            style: TextStyle(
              fontSize: 15,
              color: colorItem,
              fontWeight: FontWeight.bold,
            ),
            ),
          )),
          ProfileInfo()
        ],
      ),
    );
  }
}
