import 'package:date_time_picker/date_time_picker.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';


class CustomSelectDateTimeMutil extends StatefulWidget {
  CustomSelectDateTimeMutil({super.key, required this.onChangedStart,this.onChangedEnd});
  void Function(String)? onChangedStart;
  void Function(String)? onChangedEnd;

  @override
  State<CustomSelectDateTimeMutil> createState() => _CustomSelectDateTimeMutilState();
}

class _CustomSelectDateTimeMutilState extends State<CustomSelectDateTimeMutil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 170,
            child: DateTimePicker(
                style: TextStyle(
                  color: darkTextColor,
                  fontSize: (16),
                  fontWeight: FontWeight.w400,
                ),
                dateMask: 'dd-MM-yyyy',
                initialValue:DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                icon: Icon(
                  Icons.event,
                  color: darkTextColor,
                ),
                dateLabelText: 'Từ ngày',
                //cursorColor: Color.fromRGBO(255, 255, 255, 0.1),
                onChanged: widget.onChangedStart),
          ),
          SizedBox(width: 20,),
          Container(
            width: 170,
            child: DateTimePicker(
                //type: DateTimePickerType.dateTimeSeparate,
                style: TextStyle(
                  color: darkTextColor,
                  fontSize: (16),
                  fontWeight: FontWeight.w400,
                ),
                dateMask: 'dd-MM-yyyy',
                initialValue:DateTime.now().toString(),
                firstDate: DateTime.now(),
                lastDate: DateTime(3000),
                icon: Icon(
                  Icons.event,
                  color: darkTextColor,
                ),
                dateLabelText: 'Đến ngày',
                onChanged: widget.onChangedEnd),
          ),
        ],
      ),
    );
  }
}
class CustomSelectDateTimeOnly extends StatefulWidget {
  CustomSelectDateTimeOnly({super.key, required this.onChanged,});
  void Function(String)? onChanged;

  @override
  State<CustomSelectDateTimeOnly> createState() => _CustomSelectDateTimeOnlyState();
}

class _CustomSelectDateTimeOnlyState extends State<CustomSelectDateTimeOnly> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 170,
            child: DateTimePicker(
                style: TextStyle(
                  color: darkTextColor,
                  fontSize: (16),
                  fontWeight: FontWeight.w400,
                ),
                dateMask: 'dd-MM-yyyy',
                initialValue:DateTime.now().toString(),
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
                icon: Icon(
                  Icons.event,
                  color: darkTextColor,
                ),
                dateLabelText: 'Chọn ngày',
                //cursorColor: Color.fromRGBO(255, 255, 255, 0.1),
                onChanged: widget.onChanged),
          ),
          SizedBox(width: 20,),
          Container(
            width: 170,
            child: Container(),
          ),
        ],
      ),
    );
  }
}
