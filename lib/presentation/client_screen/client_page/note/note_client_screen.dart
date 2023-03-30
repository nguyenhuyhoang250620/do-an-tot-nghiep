import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/note/note_client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../widgets/custom_dropdow_button.dart';
import '../../../../widgets/custom_richtext.dart';
import '../../../../widgets/custom_select_datetime.dart';
import '../../../../widgets/custom_textfiled.dart';

class NoteClientScreen extends GetWidget<NoteClientController>{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: appPadding*5),
      child:Column(
        children: [
          Container(
            height: 50,
            width: 150,
            child: CustomButtonCommon(
              color: blue,
              onPressed: () {
                Get.dialog(buildAlertCreateNote());
              },
              size: 15,
              title: 'Tạo phiếu',
              icon: Icon(Icons.add_card_outlined),
            ),
          ),
          Expanded(
            flex: 9,
            child: GridView.builder(
              itemCount: 2,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  mainAxisExtent: 500,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1
                  ),
                  itemBuilder: (context, index) {
                      // final item = clientController.getAttendanceListMap[index];
                      return Container(
                      height: 400,
                      width: 300,
                      margin: EdgeInsets.all(appPadding),
                      padding: EdgeInsets.all(appPadding),
                      decoration: BoxDecoration(
                        border: Border.all(color: darkTextColor),
                        borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset('assets/images/note_icon_image.png',fit: BoxFit.contain,),
                          SizedBox(height: 10,),
                          CustomRichText(
                            textLeft: 'Loại đơn : ',
                            textRight: 'Đơn xin nghỉ có lương',
                          ),
                          SizedBox(height: 10,),
                          CustomRichText(
                            textLeft: 'Nội dung : ',
                            textRight: 'Xin nghỉ về quê ăn tết',
                          ),
                          SizedBox(height: 10,),
                          CustomRichText(
                            textLeft: 'Thời gian : ',
                            textRight: '25-06-2023',
                          ),
                          Expanded(flex: 2,child: Container(),),
                          Expanded(
                           flex: 2,
                           child: Container(
                            height: Get.height,
                            width: Get.width,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed:() {
                                  
                                  }, 
                                  tooltip: 'Gửi',
                                  icon: Icon(Icons.send,color: blue,)),
                                IconButton(
                                  onPressed:() {
                                  
                                  }, 
                                  tooltip: 'Cập nhật',
                                  icon: Icon(Icons.update,color: orange,)),
                                IconButton(
                                  onPressed:() {
                                  
                                  }, 
                                  tooltip: 'Xoá',
                                  icon: Icon(Icons.delete,color: red,))
                              ],
                            ),
                           ), 
                          )
                        ],
                      ),
                    );
              },
            ),
          )
        ],
      )
    );
  }

}

Widget buildAlertCreateNote(){
  final controller = Get.find<NoteClientController>();
  return AlertDialog(
    title: Center(child: Text("Tạo phiếu")),
    content: Container(
      height: Get.height*0.7,
      width: Get.width*0.5,
      child: ListView(
        children: [
          CustomRichText(
            textLeft: 'Số ngày phép còn lại : ',
            textRight: '10',
          ),
           Container(
            margin: EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              border: Border.all(color: darkTextColor.withOpacity(0.2)),
              borderRadius: BorderRadius.circular(4.0)
            ),
             child: CustomDropDownButton(
                icon: Icon(Icons.type_specimen), 
                hintText: 'Lựa chọn loại đơn',
                items: controller.listTypeNote.map((e) => _childDropDownItem(e)).toList(),
                onChangedlistSelect: (p0) {
                  // configController.ma_phong_hoc.value = p0 as String;
                },
                     ),
           ),
           SizedBox(height: 15,),
           Container(
              height: 60,
              width: Get.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Obx(() => Container(
                    height: 60,
                    width: 40,
                    child: Radio(
                      activeColor: darkTextColor,
                      value: '1 Ngày',
                      groupValue: controller.selectDateTime.value,
                      onChanged: (value) {
                        controller.selectDateTime.value = value!;
                      },
                    ),
                  ),),
                  Text('1 Ngày'),
                  SizedBox(width: 40),
                  Obx(() => Container(
                    height: 60,
                    width: 40,
                    child: Radio(
                      activeColor: darkTextColor,
                      value: 'Khoảng thời gian',
                      groupValue: controller.selectDateTime.value,
                      onChanged: (value) {
                          controller.selectDateTime.value = value!;
                      },
                    ),
                  )),
                  Text('Khoảng thời gian'),
                ],
              ),
            ),
           SizedBox(height: 15,),
           Obx(() => controller.selectDateTime.value == '1 Ngày'
            ? CustomSelectDateTimeOnly(
                onTap: () {
                  
                },
              )
            : CustomSelectDateTimeMutil(
              onTap: () {
                
              },
            )
           ,),
           SizedBox(height: 25,),
           Container(
              height: 350,
              padding: EdgeInsets.all(appPadding),
              decoration: BoxDecoration(
                border: Border.all(color: darkTextColor.withOpacity(0.2))
              ),
             child: TextFormField(
              maxLines: 350,
              decoration: InputDecoration(
                border:InputBorder.none,
                hintText: 'Nội dung'
              ),
            ),
           )
           
        ],
      ),
    ),
    actions: [
      CustomButtonAlert(
        titileDisable: 'Huỷ',
        titileEnable: 'Lưu',
        onPressedDisable: () {
          Get.back();
        },
        onPressedEnable: () {
          
        },
      )
    ],
  );
}
DropdownMenuItem _childDropDownItem(String title) {
  return DropdownMenuItem<String>(
    value: title,
    child: Text(
      title,
      style: AppStyle.textData,
    ),
  );
}