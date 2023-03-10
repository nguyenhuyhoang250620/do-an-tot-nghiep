import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/analytic_cards.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/top_referals.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/users.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/users_by_device.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/viewers.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_widget_action.dart';
import 'discussions.dart';

class DashboardContent extends StatelessWidget {
  const DashboardContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.all(appPadding*2),
        child: Column(
          children: [
            CustomAppbar(),
            Divider(),
            Expanded(
              flex: 2,
              child:  CustomWidgetAction(),
            ),
            Expanded(
              flex: 8,
              child: Container(
                height: Get.height,
                width: Get.width,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        height: Get.height,
                        width: Get.width,
                        padding: EdgeInsets.all(appPadding),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: TopReferals()),
                            Expanded(child: Viewers()),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 5,child: Container(
                      height: Get.height,
                      width: Get.width,
                      padding: EdgeInsets.all(appPadding),
                      child: Users())),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
