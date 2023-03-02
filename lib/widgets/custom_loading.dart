import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/app_style.dart';
class CustomLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SpinKitWave(
          color: textColor,
          size: 32.0,
        ),
        Text(
          "Chờ một chút trong khi chúng tôi đang làm việc",
          style: AppStyle.txtInterRegular14.copyWith(color: bgColor),
        )
      ],
    );
  }

}