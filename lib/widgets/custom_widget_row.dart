import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/widgets.dart';

class CustomWidgetRow extends StatelessWidget{
  CustomWidgetRow({
    this.left,
    this.right,
    this.distance,
    this.paddingLeft
  });
  final Widget? left;
  final Widget? right;
  final double? distance;
  final double? paddingLeft;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: paddingLeft!),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          left!,
          SizedBox(width: distance,),
          right!,
        ],
      ),
    );
  }

}