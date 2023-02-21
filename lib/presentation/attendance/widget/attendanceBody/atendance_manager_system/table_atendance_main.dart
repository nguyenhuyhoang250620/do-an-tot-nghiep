import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/controller/attendance_controller.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/models/attendance_and_time_model.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/models/attendance_model1.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

class TableMain extends StatefulWidget {
  TableMain({
    Key? key,
    // required this.data,
    required this.datatime,
    this.dateTimeList,
  }) : super(key: key);
  List<String> datatime = [];
  List<AttendanceAndTimeModel>? dateTimeList;

  @override
  State<TableMain> createState() => _SimpleTableScrollStylePageState();
}

class _SimpleTableScrollStylePageState extends State<TableMain> {
  final controller = Get.find<AttendanceController>();
  // ignore: unused_field
  late ScrollController _verticalScrollController;
  // ignore: unused_field
  late ScrollController _horizontalScrollController;
  List<AttendanceModel1> list = [];
  bool isLTRmode = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 600,
      //width: 1350,
      color: Colors.transparent,
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 150,
        rightHandSideColumnWidth: 1200,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        //itemCount: widget.datatime.length,
        itemCount: widget.dateTimeList!.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Colors.transparent,
        rightHandSideColBackgroundColor: Colors.transparent,
        onScrollControllerReady: (vertical, horizontal) {
          _verticalScrollController = vertical;
          _horizontalScrollController = horizontal;
        },
        verticalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Color.fromARGB(255, 173, 172, 168),
          isAlwaysShown: true,
          thickness: 8.0,
          radius: Radius.circular(5.0),
        ),
        horizontalScrollbarStyle: const ScrollbarStyle(
          thumbColor: Colors.transparent,
          isAlwaysShown: false,
          thickness: 8.0,
          radius: Radius.circular(5.0),
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Ngày', 150),
      _getTitleItemWidget('Vào đầu tiên', 150),
      _getTitleItemWidget('Ra cuối cùng', 150),
      _getTitleItemWidget('Tổng số giờ', 150),
      _getTitleItemWidget('Số giờ được trả lương', 150),
      _getTitleItemWidget('Số giờ làm bù', 150),
      _getTitleItemWidget('Tăng ca/sai lệch', 150),
      _getTitleItemWidget('Trạng thái', 150),
      _getTitleItemWidget('Ca làm việc', 150),
      _getTitleItemWidget('Lập quy tắc', 150),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: 150,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      //child: Text(widget.datatime[index]),
      //child: Text(widget.dateTimeList![index].toString()),
      child: Text(_parse(widget.dateTimeList![index].dateTime!)),
    );
  }

  _parse(DateTime dateTime) {
    return DateFormat('E').format(dateTime) + ' ' + DateFormat('dd-MM-yyyy').format(dateTime);
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    bool enable = false;
    if (widget.dateTimeList![index].attendanceModel != null) {
      enable = true;
    }
    return Row(
      children: <Widget>[
        // Container(
        //   width: 150,
        //   height: 52,
        //   padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        //   child: Row(
        //     children: <Widget>[],
        //   ),
        // ),
        Container(
          width: 150,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.firstIn}') : Text("-"),
        ),
        Container(
          width: 150,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.lastOut}') : Text("-"),
        ),
        Container(
          width: 150,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.totalHours}') : Text("-"),
        ),
        Container(
          width: 150,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.payableHours}') : Text("-"),
        ),
        Container(
          width: 150,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.overtimeDeviation}') : Text("-"),
        ),
        Container(
          width: 150,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text("ahihi") : Text("-"),
        ),
        Container(
          width: 150,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.status}') : Text("-"),
        ),
        Container(
          width: 150,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.shift}') : Text("-"),
        ),
        // Container(
        //   width: 150,
        //   height: 52,
        //   padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
        //   alignment: Alignment.centerLeft,
        //   child: Text("-"),
        // ),
      ],
    );
  }
}
