import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button_alert.dart';
import 'package:flutter/material.dart';

import '../../../../../widgets/custom_textfiled.dart';
import 'custom_button.dart';

class CustomAlertAvt extends StatelessWidget{
  CustomAlertAvt({
    this.title,
    this.listTextFiled,
    this.onPressedDisable,
    this.onPressedEisable
  });
  final Widget? title;
  final Widget? listTextFiled;
  final VoidCallback? onPressedDisable;
  final VoidCallback? onPressedEisable;
  @override
    Widget build(BuildContext context) {
      return AlertDialog(
        title: title,
        content: Container(
          height: Get.height*0.8,
          width: Get.width*0.5,
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: appPadding*3),
                  child: ListView(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(appPadding),
                          child: Text('Ảnh 3x4', style: AppStyle.txtInterRegular18),
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: textColor,
                            style: BorderStyle.solid,
                          )
                        ),
                        child: Image.asset('assets/images/image_not_found.png')
                        // Obx(
                        //   () {
                        //     // debugPrint('controller.pathImage.value - ${controller.pathImageAfterPickfileFromComputer.value}');
                        //     return ;
                        //     // controller.pathImageAfterPickfileFromComputer.value.isNotEmpty
                        //     //     ? Image.network(
                        //     //         controller.pathImageAfterPickfileFromComputer.value,
                        //     //         headers: controller.getTokenHeaders(),
                        //     //         errorBuilder: (context, error, stackTrace) {
                        //     //           return const Center(child: Image(image: AssetImage(ImageConstant.imageError)));
                        //     //         },
                        //     //       )
                        //     //     : DioImageWidget(url: avatar!);
                        //   },
                        // ),
                      ),
                      Container(
                        padding: EdgeInsets.all(appPadding*2),
                        child: CustomButtonCommon(
                          title: 'Thư viện',
                          color: colorButton,
                          size:16,
                          icon: Icon(Icons.photo_album),
                          onPressed: () {
                            
                          },
                        ))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  height: Get.height,
                  width: Get.width,
                  padding: EdgeInsets.all(appPadding*3),
                  child: listTextFiled
                ),
              )
            ],
          )
        ),
        actions: [
          CustomButtonAlert(
            titileDisable: 'Huỷ',
            titileEnable: 'Lưu',
            onPressedDisable: onPressedDisable,
            onPressedEnable: onPressedEisable
          )
        ],
      );
    }
}