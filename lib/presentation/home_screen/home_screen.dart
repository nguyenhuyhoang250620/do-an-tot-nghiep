import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/drawer_menu.dart';
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
import 'admin/admin.dart';
import 'controller/home_controller.dart';
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';

class HomeScreen extends GetWidget<HomeController> {


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorConstant.whiteA700,
      body:Container(color: Colors.green,)
    ));
  }
}
