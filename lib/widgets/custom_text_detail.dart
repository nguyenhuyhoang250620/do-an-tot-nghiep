import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextDetail extends StatelessWidget{
  CustomTextDetail({
    this.title,
    this.content
  });
  final String? title;
  final String? content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(appPadding*2),
      child: Row(
        children: [
          Text('${title!} : ',style: AppStyle.txtInterRegular18.copyWith(fontWeight: FontWeight.bold),),
          Text(content!),
          Expanded(child: Text('............................................................................................................................',maxLines: 1,overflow: TextOverflow.visible,))
        ],
      ),
    );
  }

}