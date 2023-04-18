import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/models/referal_info_model.dart';
import 'package:do_an_tot_nghiep/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

import '../../../data/models/teacher_models.dart';
import '../../../theme/app_style.dart';
import '../../../widgets/custom_button_alert.dart';
import '../../../widgets/custom_select_datetime.dart';

class ReferalInfoDetail extends StatelessWidget {
  ReferalInfoDetail({Key? key, required this.info,})
      : super(key: key);

  final TeacherModel info;


  @override
  Widget build(BuildContext context) {
    final dashBoardController = Get.find<DashBoardController>();
    return Container(
      padding: EdgeInsets.all(appPadding),
      margin: EdgeInsets.symmetric(horizontal: appPadding*2,vertical: appPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: appPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 5,
                    child: Container(
                      child: Text(
                        info.TenGV!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      child: Text(
                        '${info.ChuyenNganh!}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            backgroundColor: colorButton),
                        onPressed: () {
                          dashBoardController.getDateinMonth(DateTime.now(),info.MaGV!);
                          Get.dialog(alertDetailLeave(info.MaGV!));
                        },
                        child: Text(
                          'Chi tiết',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget alertDetailLeave(String MaGV) {
  final dashBoardController = Get.find<DashBoardController>();
  return AlertDialog(
    title: Center(child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Chi tiết ngày công",style: AppStyle.txtInterRegular18.copyWith(color: darkTextColor),),
          IconButton(onPressed: () => Get.back(), icon: Icon(Icons.close))
        ],
      )),
    content: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.center,
                  child: CustomSelectDateTimeOnly(
                    onChanged: (p0) {
                      DateTime date = DateTime.parse(p0);
                      String formattedDate =DateFormat('yyyy-MM-dd HH:mm:ss').format(date);
                      DateTime dateFinal = DateTime.parse(formattedDate);
                      dashBoardController.getDateinMonth(dateFinal,MaGV);
                    },
                  )),
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: Get.height,
                width: Get.width,
                child: Obx(() => dashBoardController.getAttendanceTeacherList.value.isNotEmpty? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dashBoardController.getAttendanceTeacherList.value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 20,
                      width: 58,
                      padding: EdgeInsets.all(appPadding / 2),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(color: darkTextColor),
                              bottom: BorderSide(color: darkTextColor))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('${dashBoardController.getAttendanceTeacherList.value[index].date}'),
                          SizedBox(
                            height: 10,
                          ),
                          Checkbox(
                            value: dashBoardController.getAttendanceTeacherList.value[index].isCheck,
                            onChanged: (value) {},
                          )
                        ],
                      ),
                    );
                  },
                ):CustomLoading()),
              ),
            ),
            SizedBox(height: 80,),
            Expanded(
              flex: 2,
              child: Container(
                  height: Get.height,
                  width: Get.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(() => Text("Số ngày công : ${dashBoardController.so_ngay_cong.value}",style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor),),),
                      SizedBox(height: 40,),
                      Obx(() => Text("Số ngày vắng : ${dashBoardController.getAttendanceTeacherList.length-dashBoardController.so_ngay_cong.value}",style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor)),)
                    ],
                  ),
                ),
            ),
          ],
        )),
  );
}
