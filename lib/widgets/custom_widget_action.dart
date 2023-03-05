import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/theme/app_style.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../presentation/dashboard_screen/components/analytic_cards.dart';

class CustomWidgetAction extends StatefulWidget{
  CustomWidgetAction({
    this.title,
    this.onPressedLeft,
    this.onPressedRight,
    this.textSearch,
    this.titleButtonLeft,
    this.titleButtonRight
    });
  final String? title;
  final String? titleButtonLeft;
  final String? titleButtonRight;
  final String? textSearch;
  final VoidCallback? onPressedLeft;
  final VoidCallback? onPressedRight;
  @override
  State<StatefulWidget> createState() => CustomWidgetActionState();

}
class CustomWidgetActionState extends State<CustomWidgetAction>{
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: appPadding*2),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0)
        ),
        child: AnalyticCards()
        );
  }

}