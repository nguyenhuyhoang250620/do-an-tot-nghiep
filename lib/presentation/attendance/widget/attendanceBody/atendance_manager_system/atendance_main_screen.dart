import 'package:do_an_tot_nghiep/presentation/attendance/controller/attendance_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'table_atendance_main.dart';



class AtendanceManagerSystemScreen
    extends GetWidget<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const UIAtendanceManagerSystem());
  }
}
class UIAtendanceManagerSystem extends StatefulWidget {
  const UIAtendanceManagerSystem({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _UIAtendanceManagerSystem();
}
class _UIAtendanceManagerSystem extends State<UIAtendanceManagerSystem> {
  String? datetime;
  String? daterequire;
  String? datelastdb;
  String? tempDate;
  bool checkbool = false;
  final attendanceController = Get.find<AttendanceController>();

  @override
  initState() {
    attendanceController.getAttendanceFromLocalFile();
    print(attendanceController.employeesList);
    
    super.initState();
  }

  @override
  void dispose() {
    // amsController.checkdatenow(false);
    super.dispose();
  }

  void _runFilter(String value) {
    // // late List<InformationModel> foundUsers = [];
    // if (value.isEmpty) {
    //   amsController.getInformation();
    //   // ignore: invalid_use_of_protected_member
    //   // foundUsers = vmsController.employeesList.value;
    // } else {
    //   // ignore: invalid_use_of_protected_member
    //   amsController.informationlist.value.map((e) {
    //     foundUsers = amsController.informationlist
    //         .where((user) =>
    //             user.account!.toLowerCase().contains(value.toLowerCase()))
    //         .toList();
    //   }).toList();
    // }
    // setState(() {
    //   amsController.informationlist.value = foundUsers;
    // });
  }

  void _runFilter_date(String value) {
    // DateTime test;
    // test = DateTime.parse(value);
    // String formattedDate = DateFormat('dd-MM-yyyy').format(test);
    // if (formattedDate != daterequire) {
    //   amsController.callback_time(formattedDate);
    // }
    // print(formattedDate);
    // daterequire = formattedDate;
    // String? date;
    // late List<InformationModel> foundUsers = [];
    // amsController.cctvEventList.map((e) {
    //   date = e.thoiGianXuatHien!;
    // }).toList();
    // amsController.informationlist.map((e) {
    //   foundUsers = amsController.informationlist
    //       .where((user) => user.thoigiantanca!
    //           .toLowerCase()
    //           .contains(formattedDate.toLowerCase()))
    //       .toList();
    // }).toList();
    // setState(() {
    //   amsController.informationlist.value = foundUsers;
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: Get.height,
        width: Get.width,
        child: Obx(() => 
          Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Tên Người dùng:'),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: SizedBox(
                          width: 150,
                          height: 30,
                          child: TextField(
                            onChanged: (value) => _runFilter(value),
                            decoration: const InputDecoration(
                                labelText: '', suffixIcon: Icon(Icons.search)),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.loose,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text('Chọn ngày:',),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0),
                        child: SizedBox(
                          width: 150,
                          height: 30,
                          child:Container() 
                          // DateTimePicker(
                          //   type: DateTimePickerType.date,
                          //   dateMask: 'dd-MM-yyyy',
                          //   initialValue: tempDate,
                          //   firstDate: DateTime(2000),
                          //   lastDate: DateTime(2150),
                          //   icon: const Icon(Icons.event, size: 30),
                          //   onChanged: (val) => _runFilter_date(val),
                          //   validator: (val) {
                          //     print(val);
                          //     _runFilter(val!);
                          //     return null;
                          //   },
                          // ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              attendanceController.employeesList.isNotEmpty
                  ?Container()
                  // TableMain(
                  //     // data: attendanceController.employeesList,
                  //     // daterequire: daterequire,
                  //   )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ],
          )
        ,)
        
        );
  }
}
