import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/controller/add_data_controller.dart';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/table_employss_interface/table_employ_interface.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class EmployeeInterface extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_EmployeeInterface();
}
class _EmployeeInterface extends State<EmployeeInterface> {
  final adddataController = Get.find<AddDataController>();

  @override
  void initState() {
    print(adddataController.employeeEventList);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Container(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child:Align(
                  alignment: Alignment.topLeft,
                  child:Container(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Color.fromARGB(255, 59, 127, 237), 
                          ),
                          onPressed: () { 
                            Get.toNamed(AppRoutes.adddataWelcomeScreen);
                          },
                          child: Text('<',style: TextStyle(fontSize: 35),),
                        ),
                      ),
                )
              ),
              Expanded(
                flex: 1,
                child:Align(
                  alignment: Alignment.bottomRight,
                  child:Padding(
                      padding: EdgeInsets.all(5),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            primary: Color.fromARGB(255, 59, 127, 237), 
                          ),
                          onPressed: () { 
                            Get.toNamed(AppRoutes.adddatastaffScreen);
                          },
                          child: Text('Thêm nhân viên'),
                        ),
                      ),
                    ),
                )
              ),
              Expanded(
                flex: 9,
                child: Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black)
                  ),
                  child: TableEmployssInterface()
                ),
              )
            ],
          ),
        )
      );
  }
}