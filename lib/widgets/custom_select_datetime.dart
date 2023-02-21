import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/controller/attendance_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class CustomSelectDateTime extends StatelessWidget {
  CustomSelectDateTime({Key? key, this.controller, required this.selectedDate, required this.onTap}) : super(key: key);
  AttendanceController? controller;
  DateTime selectedDate;
  final GestureTapCallback? onTap;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2000), lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate) if (controller!.isTime.value) {
      controller!.textEndDate.text = formatDate(picked!, [dd, '-', mm, '-', yyyy]);
      controller!.endDate.value = picked;
    } else {
      controller!.textStartDate.text = formatDate(picked!, [dd, '-', mm, '-', yyyy]);
      controller!.startDate.value = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 500,
      height: 30,
      decoration: BoxDecoration(border: Border.all(width: 1), borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 25,
            child: TextField(
                readOnly: true,
                controller: controller!.textStartDate,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(border: InputBorder.none, labelText: 'Từ', filled: true, fillColor: Colors.white),
                onChanged: (value) {},
                onTap: () {
                  controller!.isTime.value = false;
                  _selectDate(context);
                }),
          ),
          Text(
            '|',
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 200,
            height: 25,
            child: TextField(
                readOnly: true,
                controller: controller!.textEndDate,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    //border: const OutlineInputBorder(),
                    border: InputBorder.none,
                    labelText: 'Đến',
                    filled: true,
                    fillColor: Colors.white),
                onChanged: (value) {
                  //controller.getInputIDNumber.value = value;
                },
                onTap: () {
                  controller!.isTime.value = true;
                  _selectDate(context);
                }),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              height: 40,
              width: 50,
              decoration: BoxDecoration(
                  color: ColorConstant.indigoA400, borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight: Radius.circular(4))),
              child: Center(
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 2), borderRadius: BorderRadius.circular(10)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
