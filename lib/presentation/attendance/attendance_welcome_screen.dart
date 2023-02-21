import 'dart:convert';
import 'dart:io';

import 'package:do_an_tot_nghiep/presentation/attendance/controller/attendance_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'attendance_screen.dart';
import 'widget/attendanceBody/atendance_manager_system/atendance_main_screen.dart';

//import 'package:web_socket_channel';

class AttendanceWelcomeScreen extends GetWidget<AttendanceController> {
  @override
  Widget build(BuildContext context) {
    print('TungVD: FaceRegconitionScreen build');
    return Scaffold(body: const UIFaceRecognitionScreen());
  }
}

class UIFaceRecognitionScreen extends StatefulWidget {
  const UIFaceRecognitionScreen({Key? key}) : super(key: key);

  @override
  State<UIFaceRecognitionScreen> createState() => _UIFaceRecognitionScreenState();
}

class _UIFaceRecognitionScreenState extends State<UIFaceRecognitionScreen> {
  final int _indexSegmentSelected = 0;

  List<Widget> listScreen = [];
  bool enableAddList = false;
  int screenNumber = 1;
  int length = 10;

  //TungVD: variable match with library NumberPaginator
  final int _currentPage = 0;

  final faceController = Get.find<AttendanceController>();

  // final _flutterRtspPlugin = FlutterRtsp();

  @override
  void initState() {
    super.initState();
    setState(() {
      screenNumber = length ~/ 6 + 1;
    });
    faceController.getAttendanceFromLocalFile();
    faceController.getDepartmentFromLocalFile();
    faceController.getEmployeeFromLocalFile();
  }

  @override
  void dispose() {
    super.dispose();
    debugPrint('TungVD: dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 150,
          width: 300,
          child: ElevatedButton(
              onPressed: () {
                Get.to(AttendanceScreen());
              },
              child: Center(child: Text('Điểm danh'))),
        ),
      ),
    );
  }
}
