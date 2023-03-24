import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/food_screen/food_controller/food_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/food_screen/widget/custom_list.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/food_management/env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class FoodScreen extends GetWidget<FoodController>{
  final clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.all(appPadding*2),
              margin: EdgeInsets.symmetric(vertical: appPadding,horizontal: appPadding*2),
              decoration: BoxDecoration(
                border: Border.all(color: darkTextColor),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Thực đơn món ăn",style: AppStyle.txtInterRegular18.copyWith(fontWeight: FontWeight.bold),)),
                  ),
                  Divider(),
                  Expanded(
                    flex: 9,
                    child: Obx(() => Container(
                      height: Get.height,
                      width: Get.width,
                      child: ListView(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.name_tab.value = mon_ans;
                            },
                            child: Container(
                              padding: EdgeInsets.all(appPadding),
                              height: 50,
                              color: controller.name_tab.value == mon_ans?backgroundTitleTable:null,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(mon_ans.value)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.name_tab.value = nuoc_uong;
                            },
                            child: Container(
                              padding: EdgeInsets.all(appPadding),
                              height: 50,
                              color: controller.name_tab.value == nuoc_uong?backgroundTitleTable:null,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(nuoc_uong.value)),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.name_tab.value = trang_mieng;
                            },
                            child: Container(
                              padding: EdgeInsets.all(appPadding),
                              height: 50,
                              color: controller.name_tab.value == trang_mieng?backgroundTitleTable:null,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text("Tráng miệng")),
                            ),
                          ),
                        ],
                      ),
                    ),)
                  )
                ],
              )
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              height: Get.height,
              width: Get.width,
              padding: EdgeInsets.all(appPadding),
              margin: EdgeInsets.symmetric(vertical: appPadding,horizontal: appPadding*2),
              decoration: BoxDecoration(
                border: Border.all(color: darkTextColor),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Obx(() {
                if(controller.name_tab.value == mon_ans){
                  return CustomList( 
                    data: clientController.getDishList,
                    clientController: clientController,
                  );
                }
                else if(controller.name_tab.value == nuoc_uong){
                  return CustomList(
                    data: clientController.getDrinksList,
                    clientController: clientController,
                  );
                }
                return CustomList(               
                  data: clientController.getDessertList,
                  clientController: clientController,
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}