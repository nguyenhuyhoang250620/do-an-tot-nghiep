import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/controller/add_data_controller.dart';
import 'package:flutter/material.dart';

import '../table_employss_interface/table_department_interface.dart';


class DepartmentInterface extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_DepartmentInterface();
}
class _DepartmentInterface extends State<DepartmentInterface> {
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
                            Get.toNamed(AppRoutes.adddatadepartmentScreen);
                          },
                          child: Text('Thêm phòng ban'),
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
                  child: TableDepartmentInterface()
                ),
              )
            ],
          ),
        )
      );
  }
}