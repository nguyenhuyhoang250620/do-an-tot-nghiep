import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/scan_controller.dart';

class CaptureButton extends GetView<ScanController> {
  const CaptureButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      child: GestureDetector(
        onTap: () {
          controller.capture();
        },
        child: Container(
          height: 70,
          width: 70,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.transparent, border: Border.all(color: Colors.white, width: 5)),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                Icons.camera,
                size: 50,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
