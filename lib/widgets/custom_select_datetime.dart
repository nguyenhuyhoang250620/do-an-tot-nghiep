import 'package:date_time_picker/date_time_picker.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';


class CustomSelectDateTimeMutil extends StatefulWidget {
  const CustomSelectDateTimeMutil({super.key, required this.onTap,});
  final GestureTapCallback? onTap;

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
                lastDate: DateTime(3000),
                icon: Icon(
                  Icons.event,
                  color: darkTextColor,
                ),
                dateLabelText: 'Từ ngày',
                //cursorColor: Color.fromRGBO(255, 255, 255, 0.1),
                onChanged: (val) {
                  // vmsController.startDate.value = DateFormat("yyyy-MM-dd").parse(val);
                  // //print(endDate);
                  // widget.startDateCallback(vmsController.startDate.value);
                }),
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
                firstDate: DateTime(2000),
                lastDate: DateTime(3000),
                icon: Icon(
                  Icons.event,
                  color: darkTextColor,
                ),
                dateLabelText: 'Đến ngày',
                onChanged: (val) {
                  // vmsController.endDate.value = DateFormat("yyyy-MM-dd").parse(val);
                  // widget.endDateCallback(vmsController.endDate.value);
                }),
          ),
        ],
      ),
    );
  }
}
class CustomSelectDateTimeOnly extends StatefulWidget {
  const CustomSelectDateTimeOnly({super.key, required this.onTap,});
  final GestureTapCallback? onTap;

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
                onChanged: (val) {
                  // vmsController.startDate.value = DateFormat("yyyy-MM-dd").parse(val);
                  // //print(endDate);
                  // widget.startDateCallback(vmsController.startDate.value);
                }),
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
