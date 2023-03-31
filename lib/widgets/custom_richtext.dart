import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/theme/app_style.dart';
import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget{
  CustomRichText({this.textLeft,this.textRight});
  final String? textLeft;
  final String? textRight;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(appPadding),
      child: RichText(
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        text: TextSpan(
          children: [
            TextSpan(
              text: textLeft,
              style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor.withOpacity(0.8))
            ),
            TextSpan(
              text: textRight,
              style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor,)
            ),
          ],
        ),
      ),
    );
  }

}