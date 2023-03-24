import 'dart:math';

import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class OrderFoodManagement extends StatefulWidget{
  OrderFoodManagement({this.dashboardController});
  DashBoardController? dashboardController;
  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<OrderFoodManagement>{
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Center(child: Text("Danh sách thực đơn ngày hôm nay",style: AppStyle.txtInterMedium32.copyWith(fontWeight: FontWeight.bold),)),
        ),
        Expanded(
          flex: 9,
          child: Obx(() => AnimationLimiter(
            child: ListView.builder(
              itemCount:widget.dashboardController!.getOrderFoodList.length,
              itemBuilder: (BuildContext context, int index) {
                return AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 1000),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Container(
                        height: 200,
                        width: Get.width,
                        margin: EdgeInsets.symmetric(vertical: appPadding,horizontal: appPadding*5),
                        padding: EdgeInsets.all(appPadding),
                        decoration: BoxDecoration(
                          border: Border.all(color: darkTextColor),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                height: Get.height,
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomRichText(
                                      textLeft: 'Tài khoản đặt món : ',
                                      textRight: '${widget.dashboardController!.getOrderFoodList.value[index].maGV}',
                                    ),
                                    CustomRichText(
                                      textLeft: 'Tên món ăn : ',
                                      textRight: '${widget.dashboardController!.getOrderFoodList.value[index].tenMonAn}',
                                    ),
                                    CustomRichText(
                                      textLeft: 'Số lượng đặt : ',
                                      textRight: '${widget.dashboardController!.getOrderFoodList.value[index].soLuong}',
                                    ),
                                    CustomRichText(
                                      textLeft: 'Thời gian đặt : ',
                                      textRight: '${widget.dashboardController!.getOrderFoodList.value[index].thoiGian.substring(0,16)}',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: Get.height,
                                width: Get.width,
                                child:widget.dashboardController!.getOrderFoodList.value[index].url!=''?Container(
                                      // width: 100,
                                      // height: 100,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        image:DecorationImage(
                                          fit: BoxFit.cover,
                                          onError: (exception, stackTrace) => Icon(
                                            Icons.person,
                                            color: darkTextColor,
                                            size: 40,
                                          ),
                                          image: NetworkImage(
                                            widget.dashboardController!.getOrderFoodList.value[index].url,
                                          ),
                                        )
                                      ),
                                    ):Container(
                                      // height: 100,
                                      child: Image.asset('assets/images/image_not_found.png',
                                      fit: BoxFit.cover,
                                      )
                                    ),
                              ),
                            )
                          ],
                        )
                      ),
                    ),
                  ),
                );
              },
            ),
          ),)
        )
      ],
    );}
}
