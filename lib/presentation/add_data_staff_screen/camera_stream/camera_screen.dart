import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/controller/scan_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'camera_viewer.dart';
import 'capture_button.dart';

class CameraScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_CameraScreen();

}
class _CameraScreen extends State<CameraScreen> {
  final scanController = Get.find<ScanController>();
  @override
  void dispose() {
   scanController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      width: 600,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CameraViewer(),
          CaptureButton(),
        ],
      ),
    );
  }
}
