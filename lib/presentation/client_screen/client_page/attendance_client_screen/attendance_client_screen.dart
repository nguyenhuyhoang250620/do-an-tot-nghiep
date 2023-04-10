import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/attendance_client_screen/attendance_client_controller/attendance_client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button_alert.dart';
import 'package:do_an_tot_nghiep/widgets/custom_richtext.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class AttendanceEmployee extends GetWidget<AttendanceClientController>{
  final clientController = Get.find<ClientController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() => clientController.getConfigListMap.isNotEmpty?Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal:appPadding*3),
        child: ListView.builder(
          itemCount: clientController.getConfigListMap.length,
          itemBuilder: (context, index) {
                  return Container(
                  height: 200,
                  width: 100,
                  margin: EdgeInsets.all(appPadding),
                  padding: EdgeInsets.all(appPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: darkTextColor),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 200,
                        child: FadeInImage(
                        placeholder: AssetImage('assets/images/image_not_found.png'),
                        image: NetworkImage(
                          clientController.getConfigListMap.value[index]['url'],
                        ),
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) => Icon(
                          Icons.person,
                          color: darkTextColor,
                        ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: appPadding),
                                child: Text('${clientController.getConfigListMap.value[index]['TenSV']}', style: AppStyle.txtInterRegular18.copyWith(color: darkTextColor,))),
                              SizedBox(height: 7,),
                              CustomRichText(
                                textLeft: 'Mã sinh viên: ',
                                textRight: '${clientController.getConfigListMap.value[index]['MaSV']}',
                              ),
                              CustomRichText(
                                textLeft: 'Gmail: ',
                                textRight: '${clientController.getConfigListMap.value[index]['Email']}',
                              ),
                              CustomRichText(
                                textLeft: 'Chuyên ngành: ',
                                textRight: '${clientController.getConfigListMap.value[index]['Khoa']}',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                backgroundColor: colorButton
                            ),
                            onPressed: () {
                              controller.getAttendance(clientController.MaGV.value,clientController.ma_hoc_phan.value,'${clientController.getConfigListMap.value[index]['MaSV']}');
                              Get.dialog(buildDetailAttendance(controller));
                            },
                            child: Text('Chi tiết',style: AppStyle.txtRobotoRegular16.copyWith(color: bgColor),),
                          ),
                        ),
                    ],
                  )
                );
          },
        ),
      ):Center(child: Text("Chưa có dữ liệu"),),);
}}
Widget buildDetailAttendance(AttendanceClientController controller){
  return AlertDialog(
    title: Center(child: Text('Chi tiết điểm danh')),
    content: Container(
        height: Get.height*0.7,
        width: Get.width*0.5,
        padding: EdgeInsets.symmetric(horizontal:appPadding*3),
        child: Obx(() => 
          controller.isLoading.value?
        controller.getAttendanceListDetail.isNotEmpty
        ?ListView.builder(
          itemCount: controller.getAttendanceListDetail.length,
          itemBuilder: (context, index) {
                  return Container(
                  height: 200,
                  width: 100,
                  margin: EdgeInsets.all(appPadding),
                  padding: EdgeInsets.all(appPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: darkTextColor),
                    borderRadius: BorderRadius.circular(8.0)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Padding(
                      //   padding: EdgeInsets.only(left: appPadding),
                      //   child: Text('${controller.getAttendanceListDetail.value[index].checkIn}', style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor,))),
                      SizedBox(height: 7,),
                      CustomRichText(
                        textLeft: 'Thời gian vào: ',
                        textRight: '${controller.getAttendanceListDetail.value[index].checkOut.substring(10,19)}',
                      ),
                      CustomRichText(
                        textLeft: 'Thời gian ra: ',
                        textRight: '${controller.getAttendanceListDetail.value[index].checkIn.substring(10,19)}',
                      ),
                      // CustomRichText(
                      //   textLeft: 'Mã sinh viên: ',
                      //   textRight: '${controller.getAttendanceListDetail.value[index].time}',
                      // ),
                    ],
                  ),
                );
          },
        ):Center(child: Text("Chưa có dữ liệu"),):Center(child: CircularProgressIndicator()))
      ),
      actions: [
        CustomButtonAlert(
          onPressedDisable: () {
            Get.back();
          },
          onPressedEnable: () {
            Get.back();
          },
          titileDisable: 'Huỷ',
          titileEnable: 'Xong',
        )
      ],
  );
}