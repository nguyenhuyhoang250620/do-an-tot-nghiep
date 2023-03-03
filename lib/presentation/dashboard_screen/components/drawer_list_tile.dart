import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/color_constant.dart';


class DrawerListTile extends StatelessWidget {
  const DrawerListTile({Key? key, required this.title, required this.icon, required this.tap,required this.color,this.colorText}) : super(key: key);

  final String title;
  final VoidCallback tap;
  final Icon icon;
  final Color? color;
  final Color? colorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(left: BorderSide(color: color!,width: 4)),
      ),
      child: ListTile(
        onTap: tap,
        horizontalTitleGap: 0.0,
        leading: icon,
        title: Text(title,style: AppStyle.txtInterRegular14.copyWith(color: colorText),),
      ),
    );
  }
}
