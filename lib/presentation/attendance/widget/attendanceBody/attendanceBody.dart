import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/controller/attendance_controller.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/widget/attendanceBody/atendance_manager_system/horizontal_data_table_page.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button.dart';
import 'package:do_an_tot_nghiep/widgets/custom_drop_down.dart';
import 'package:do_an_tot_nghiep/widgets/custom_select_datetime.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'atendance_manager_system/table_atendance_main.dart';
import 'package:intl/intl.dart';

class AttendanceBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AttendanceBody();
}

class _AttendanceBody extends State<AttendanceBody> {
  final controller = Get.find<AttendanceController>();
  List<String> datetime = [];
  List<DateTime> datetimeList = [];
  @override
  List<String> time = [];
  void initState() {
    controller.getAttendanceFromLocalFile();
    controller.getDepartmentFromLocalFile();
    controller.getEmployeeFromLocalFile();
    //controller.onSelected(controller.timeAttendanceModel.value.dropdownItemListTime.value[3]);
    super.initState();
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(2000), lastDate: DateTime(2025));
    if (picked != null && picked != selectedDate)
      setState(() {
        if (controller.isTime.value) {
          controller.textEndDate.text = formatDate(picked!, [dd, '-', mm, '-', yyyy]);
          controller.endDate.value = picked;
        } else {
          controller.textStartDate.text = formatDate(picked!, [dd, '-', mm, '-', yyyy]);
          controller.startDate.value = picked;
        }
      });
  }

  Widget UiNextWeek(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              padding: getPadding(all: 1),
              onPressed: () {
                controller.numberWeek.value = controller.numberWeek.value - 7;
                controller.findLastDateOfNextWeek(DateTime.now());
                updateData();
              },
              icon: Icon(Icons.arrow_left)),
          Text("${DateFormat('E').format(controller.dateTimeList.value[0]) + ' ' + DateFormat('dd-MM-yyyy').format(controller.dateTimeList.value[0])}"),
          Text(" : "),
          Text("${DateFormat('E').format(controller.dateTimeList.value[6]) + ' ' + DateFormat('dd-MM-yyyy').format(controller.dateTimeList.value[6])}"),
          IconButton(
              padding: getPadding(all: 1),
              onPressed: () {
                controller.numberWeek.value = controller.numberWeek.value + 7;
                controller.findLastDateOfNextWeek(DateTime.now());
                updateData();
              },
              icon: Icon(Icons.arrow_right)),
        ],
      ),
    );
  }

  Widget UiNextMonth(BuildContext context) {
    return Container(
      height: 30,
      //decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              padding: getPadding(all: 1),
              onPressed: () {
                controller.numberMonth.value = controller.numberMonth.value - 1;
                controller.findLastDateOfNextMonth(DateTime.now());
                updateData();
              },
              icon: Icon(Icons.arrow_left)),
          Text('Tháng ${DateFormat('MM-yyyy').format(controller.dateTimeList.value[0])}'),
          //Text(">"),
          IconButton(
              padding: getPadding(all: 1),
              onPressed: () {
                controller.numberMonth.value = controller.numberMonth.value + 1;
                controller.findLastDateOfNextMonth(DateTime.now());
                updateData();
              },
              icon: Icon(Icons.arrow_right)),
        ],
      ),
    );
  }

  Widget UiRangeTime(BuildContext) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 30,
          child: TextField(
              controller: controller.textStartDate,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.done,
              style: const TextStyle(color: Colors.blue),
              decoration: InputDecoration(border: const OutlineInputBorder(), labelText: 'Từ', filled: true, fillColor: Colors.white),
              onChanged: (value) {},
              onTap: () {
                controller.isTime.value = false;
                _selectDate(context);
              }),
        ),
        Container(
          width: 200,
          height: 30,
          child: TextField(
              controller: controller.textEndDate,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.done,
              style: const TextStyle(color: Colors.blue),
              decoration: InputDecoration(border: const OutlineInputBorder(), labelText: 'Đến', filled: true, fillColor: Colors.white),
              onChanged: (value) {
                //controller.getInputIDNumber.value = value;
              },
              onTap: () {
                controller.isTime.value = true;
                _selectDate(context);
              }),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: getMargin(top: 15),
            //width: 1500,
            //decoration: BoxDecoration(border: Border.all(width: 1)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 10, right: 10),
                  child: Text('Thời gian'),
                ),
                Obx(
                  () => CustomDropDown(
                    width: 200,
                    variant: DropDownVariant.FillWhiteA700,
                    focusNode: FocusNode(),
                    icon: Icon(Icons.arrow_drop_down_sharp),
                    hintText: "",
                    value: controller.timeAttendanceModel.value.dropdownItemListTime[3],
                    padding: DropDownPadding.PaddingAll2,
                    fontStyle: DropDownFontStyle.InterRegular18,
                    items: controller.timeAttendanceModel.value.dropdownItemListTime.value,
                    onChanged: (value) {
                      controller.onSelected(value);
                      updateData();
                    },
                  ),
                ),
                // controller.selectedDropDownValue!.title == '1 Tuần' ? UiNextWeek(context) : UiRangeTime(context),
                // controller.selectedDropDownValue != null
                //     ? controller.selectedDropDownValue!.title == '1 tuần'
                //         ? UiNextWeek(context)
                //         : controller.selectedDropDownValue!.title == '1 tháng'
                //             ? UiNextMonth(context)
                //             : UiRangeTime(context)
                //     : UiRangeTime(context),
                // CustomButton(
                //   height: 30,
                //   width: 30,
                //   text: 'Tìm kiếm',
                //   margin: getMargin(
                //     left: 1,
                //     right: 1,
                //   ),
                //   variant: ButtonVariant.FillIndigoA400,
                //   padding: ButtonPadding.PaddingAll8,
                //   fontStyle: ButtonFontStyle.InterMedium10WhiteA700,
                //   onTap: () {
                //     updateData();
                //   },
                // ),
                controller.selectedDropDownValue != null
                    ? controller.selectedDropDownValue!.title == '1 tuần'
                        ? UiNextWeek(context)
                        : controller.selectedDropDownValue!.title == '1 tháng'
                            ? UiNextMonth(context)
                            : CustomSelectDateTime(
                                controller: controller,
                                selectedDate: DateTime.now(),
                                onTap: () {
                                  updateData();
                                },
                              )
                    : CustomSelectDateTime(
                        controller: controller,
                        selectedDate: DateTime.now(),
                        onTap: () {
                          updateData();
                        },
                      )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 14,
          child: HorizontalDataTablePage(
            datatime: datetime,
            dateTimeList: controller.attendance_and_time_model,
          ),
        ),
      ],
    );
  }

  void updateData() {
    if (controller.selectedDropDownValue!.title == '1 tuần') {
      setState(() {
        datetimeList = controller.dateTimeList.value;
        controller.mapList(datetimeList, controller.employeeEventsList.value);
      });
    } else if (controller.selectedDropDownValue!.title == '1 tháng') {
      setState(() {
        datetimeList = controller.dateTimeList.value;
        controller.mapList(datetimeList, controller.employeeEventsList.value);
      });
    } else {
      controller.getDateTime();
      setState(() {
        datetimeList = controller.dateTimeList.value;
        controller.mapList(datetimeList, controller.employeeEventsList.value);
      });
    }
  }
}
