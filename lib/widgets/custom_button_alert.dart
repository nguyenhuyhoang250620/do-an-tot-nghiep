import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/theme/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CustomButtonAlert extends StatelessWidget{
  CustomButtonAlert({
    this.onPressedDisable,
    this.onPressedEnable,
    this.titileDisable,
    this.titileEnable
  });
  final VoidCallback? onPressedDisable;
  final VoidCallback? onPressedEnable;
  final String? titileDisable;
  final String? titileEnable;
  @override
  Widget build(BuildContext context) {
    return Row(
          children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 150),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: enableColor
                  ),
                onPressed: onPressedDisable,
                child: Text('${titileDisable}',style: AppStyle.txtRobotoRegular16.copyWith(color:textColor)),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              margin: EdgeInsets.symmetric(horizontal: 150),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    backgroundColor: colorButton
                ),
                onPressed: onPressedEnable,
                child: Text('${titileEnable}',style: AppStyle.txtRobotoRegular16.copyWith(color: bgColor),),
              ),
            ),
          )
        ],
      );
  }

}