import 'package:do_an_tot_nghiep/theme/app_style.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget{
  CustomRichText({this.textLeft,this.textRight});
  final String? textLeft;
  final String? textRight;
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: textLeft,
            style: AppStyle.txtInterMedium12
          ),
          TextSpan(
            text: textRight,
            style: AppStyle.txtInterRegular14
          ),
        ],
      ),
    );
  }

}