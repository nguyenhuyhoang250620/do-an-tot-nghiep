import 'dart:convert';

import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/controller/add_data_controller.dart';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/controller/scan_controller.dart';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/widget/CustomTextFiled.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import 'camera_stream/camera_screen.dart';

class AddDataStaffScreen extends GetWidget<AddDataController> {
  final cameraController = Get.find<ScanController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.grey
      ),
      height: Get.height,
      width: Get.width,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
              color: Color.fromARGB(255, 84, 172, 243),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Tạo mới nhân viên",style: TextStyle(fontSize: 25,color: Colors.black),),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      color: Colors.white
                      ),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child:
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                child: Text("Ảnh 3x4 nhân viên",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                              ),
                            ),
                          ),
                          Obx(() => Expanded(
                            flex: 7,
                            child:controller.useface.value==""?
                            Align(
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                                child:  DottedBorder(
                                    color: Colors.black,
                                    strokeWidth: 1,
                                    child: Container(
                                      height: 800,
                                      width: 390,
                                      child: Image.asset('assets/images/image_not_found.png',filterQuality: FilterQuality.high,),
                                    ),
                                )
                              ),
                            ):Image.network(controller.useface.value)
                          ),),
                          Expanded(
                            flex: 2,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                    child: Container(
                                      height: 35,
                                      width: 140,
                                      color: Colors.black,
                                      child: TextButton(
                                        onPressed: () {
                                          controller.pickFileWeb();
                                        },
                                        child: Icon(
                                          Icons.file_upload_outlined,
                                          color: Colors.white,
                                          size: 26.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                 Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                    child: Container(
                                      height: 35,
                                      width: 140,
                                      color: Colors.black,
                                      child: TextButton(
                                        onPressed: () {
                                          cameraController.initCamera();
                                          _resultDialog(context);
                                        },
                                        child: Icon(
                                          Icons.camera_alt_outlined,
                                          color: Colors.white,
                                          size: 26.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ),
                        ],
                      )
                  ),
                  ),
                  Expanded(
                    flex: 2,
                    child:Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "EmployeeID",
                                      myController: controller.employeeID,width: 450,
                                      obscureText: false,)),
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "Fullname",
                                      myController: controller.fullname,width: 450,
                                      obscureText: false,)),
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "Nickname",myController: controller.nickname,
                                      width: 450,obscureText: false,)),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "Password",myController: controller.password,width: 450,
                                      obscureText: true,)),
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "Email",
                                      myController: controller.email,width: 450,
                                      obscureText: false,)),
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "Date of birth",
                                      myController: controller.dateofbirth,width: 450,
                                      obscureText: false,
                                      onTap: ()=> DatePicker.showDatePicker(context,
                                          showTitleActions: true,
                                          minTime: DateTime(1980, 6, 7),
                                          maxTime: DateTime(2005, 6, 7), onChanged: (date) {
                                            print('change $date');
                                          }, 
                                          onConfirm: (date) {
                                            controller.dateofbirth.text = date.toString();
                                          }, 
                                          currentTime: DateTime.now(), locale: LocaleType.vi),)),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "Department",
                                      myController: controller.department,width: 450,
                                      obscureText: false,
                                      inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),])),
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "Employee status",
                                      myController: controller.employessStatus,width: 450,
                                      obscureText: false,)),
                                  Expanded(
                                    child: CustomTextFiled(
                                      title: "Role",
                                      myController: controller.role,width: 450,
                                      obscureText: false,)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                color: Colors.white
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                          child: Container(
                            height: 35,
                            width: 80,
                            color: Color.fromARGB(255, 133, 239, 156),
                            child: TextButton(
                              onPressed: () {
                                controller.SaveInformationStaff();
                                if(controller.check_full_validator == false){
                                  _showDialogEmstydata(context);
                                }
                              },
                              child: Text("Lưu lại",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600),)
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Container(
                            height: 35,
                            width: 80,
                            color:  Color.fromARGB(255, 238, 127, 119),
                            child: TextButton(
                              onPressed: () {
                                Get.toNamed(AppRoutes.employeeInterface);
                              },
                              child: Text("Huỷ bỏ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600))
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          )
        ],
      )
    ),
    );
  }
  void _resultDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30.0))),
          backgroundColor: ColorConstant.gray50,
          content: CameraScreen()
        ),
      );
  }
  void _showDialogEmstydata(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: new Text("Thông báo thiếu dữ liệu"),
          content: new Text("Bạn cần nhập đầy đủ thông tin"),
          actions: <Widget>[
            new TextButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        )
      );
  }
}