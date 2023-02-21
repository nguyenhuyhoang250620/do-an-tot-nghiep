import 'controller/app_navigation_controller.dart';
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';

class AppNavigationScreen extends GetWidget<AppNavigationController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.whiteA700,
            body: Container(
                child: Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        onTapDiemdanh();
                      },
                      child: Container(
                          width: size.width,
                          decoration: AppDecoration.fillWhiteA700,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding: getPadding(left: 20, top: 10, right: 20, bottom: 10),
                                        child: Text("lbl_truy_vet".tr,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.center,
                                            ))),
                                Container(
                                    height: getVerticalSize(1.00),
                                    width: size.width,
                                    margin: getMargin(top: 5),
                                    decoration: BoxDecoration(color: ColorConstant.bluegray400))
                                ]
                              )
                            )
                      ),
                    ]
                  )
                )
              )
            );
  }

  onTapDiemdanh() {
    Get.toNamed(AppRoutes.attendanceScreen);
  }

}
