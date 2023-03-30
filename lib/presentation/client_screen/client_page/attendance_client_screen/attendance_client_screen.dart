import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/attendance_client_screen/attendance_client_controller/attendance_client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AttendanceEmployee extends GetWidget<AttendanceClientController>{
  final clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => clientController.getAttendanceListMap.isNotEmpty?Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal:appPadding*3),
        child: ListView.builder(
          itemCount: clientController.getAttendanceListMap.length,
          itemBuilder: (context, index) {
                  return Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(appPadding),
                  padding: EdgeInsets.all(appPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: index%2==0?red:green,width: 5),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: appPadding),
                        child: Text('${clientController.getAttendanceListMap.value[index]['TenSV']}', style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor,))),
                      SizedBox(height: 7,),
                      CustomRichText(
                        textLeft: 'Mã sinh viên: ',
                        textRight: '${clientController.getAttendanceListMap.value[index]['MaSV']}',
                      ),
                      CustomRichText(
                        textLeft: 'Thời gian CheckIn: ',
                        textRight: '${clientController.getAttendanceListMap.value[index]['ThoiGian'].toString().substring(0,16)}',
                      ),
                    ],
                  ),
                );
          },
        ),
      ):Center(child: Text("Chưa có dữ liệu"),),);
}}