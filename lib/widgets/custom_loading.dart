import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../theme/app_style.dart';
class CustomLoading extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Container(
    height: 120,
    width: 350,
    padding: EdgeInsets.all(appPadding),
     child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SpinKitWave(
            color: darkTextColor,
            size: 32.0,
          ),
          SizedBox(height: 5,),
          Text(
            "Chờ một chút trong khi chúng tôi đang xử lý",
            style: AppStyle.txtInterRegular14.copyWith(color: darkTextColor),
          )
        ],
      ),
   );
  }

}