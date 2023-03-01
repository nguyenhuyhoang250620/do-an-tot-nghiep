
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/theme/app_style.dart';
import 'package:flutter/material.dart';

class CustomButtonCommon extends StatelessWidget{
  CustomButtonCommon({
    this.onPressed,
    this.title,
    this.color,
    this.size,
    this.icon
  });
  final VoidCallback? onPressed;
  final String? title;
  final Color? color;
  final double? size;
  final Widget? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: color!.withOpacity(0.8),
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            backgroundColor: color
          ),
        onPressed: onPressed,
        child: Row(
          children: [
            Padding(padding: EdgeInsets.only(right: 3),child: icon!),
            Expanded(flex: 9,child: FittedBox(fit: BoxFit.scaleDown,child: Text('${title}',style:AppStyle.txtInterMedium12.copyWith(fontSize:size,color: Colors.white))))
          ],
        ),
      ),
    );
  }
}