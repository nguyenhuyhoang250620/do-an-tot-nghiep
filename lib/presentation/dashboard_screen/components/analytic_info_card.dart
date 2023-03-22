import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/models/analytic_info_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AnalyticInfoCard extends StatelessWidget {
  const AnalyticInfoCard({Key? key,
    this.content,
    this.icon,
    this.title,
    this.colors
  }) : super(key: key);
  final String? title;
  final int? content;
  final Widget? icon;
  final Color? colors;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: appPadding,
        vertical: appPadding,
      ),
      decoration: BoxDecoration(
          color: colors, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(appPadding),
              decoration: BoxDecoration(
                  shape: BoxShape.circle),
              child: icon
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${content}",
                  style: TextStyle(
                    color: white,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  "${title}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
