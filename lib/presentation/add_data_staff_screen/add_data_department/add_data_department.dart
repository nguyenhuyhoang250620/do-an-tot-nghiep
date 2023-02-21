import 'dart:convert';

import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/controller/add_data_controller.dart';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/widget/CustomTextFiled.dart';
import 'package:flutter/material.dart';


class AddDataDepartmentScreen extends GetWidget<AddDataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
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
                child: Text("Tạo mới phòng ban",style: TextStyle(fontSize: 25,color: Colors.black),),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child:Container(
                      decoration: BoxDecoration(
                        color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: CustomTextFiled(title: "Id",myController: controller.idDep)),
                          Expanded(child: CustomTextFiled(title: "Name",myController: controller.nameDep,)),
                          Expanded(child: CustomTextFiled(title: "Mail Alias",myController: controller.mailAliasDep,)),
                          Expanded(child: CustomTextFiled(title: "Department Lead",myController: controller.departmentLeadDep,)),
                          Expanded(child: CustomTextFiled(title: "Parent Department",myController: controller.parentDepartmentDep,)),
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
              color: Colors.white,
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
                                controller.SaveInformationDepartment();
                                Get.toNamed(AppRoutes.departmentInterface);
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
                                Get.toNamed(AppRoutes.departmentInterface);
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
}