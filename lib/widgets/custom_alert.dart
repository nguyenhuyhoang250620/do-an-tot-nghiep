import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button_alert.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/custom_textfiled.dart';
import 'custom_button.dart';

class CustomAlertAvt extends StatelessWidget{
  CustomAlertAvt({
    this.title,
    this.listTextFiled,
    this.onPressedDisable,
    this.onPressedEisable
  });
  final Widget? title;
  final Widget? listTextFiled;
  final VoidCallback? onPressedDisable;
  final VoidCallback? onPressedEisable;
  @override
    Widget build(BuildContext context) {
      return AlertDialog(
        title: title,
        content: Container(
          height: Get.height*0.8,
          width: Get.width*0.5,
          padding: EdgeInsets.all(appPadding*3),
          child: listTextFiled
        ),
        actions: [
          CustomButtonAlert(
            titileDisable: 'Huỷ',
            titileEnable: 'Lưu',
            onPressedDisable: onPressedDisable,
            onPressedEnable: onPressedEisable
          )
        ],
      );
    }
}