import 'package:do_an_tot_nghiep/presentation/attendance/models/attendance_and_time_model.dart';
import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:intl/intl.dart';

class HorizontalDataTablePage extends StatefulWidget {
  HorizontalDataTablePage({Key? key, required this.datatime, this.dateTimeList}) : super(key: key);
  List<String> datatime = [];
  List<AttendanceAndTimeModel>? dateTimeList;
  @override
  State<HorizontalDataTablePage> createState() => _HorizontalDataTablePageState();
}

class _HorizontalDataTablePageState extends State<HorizontalDataTablePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(title: const Text('Simple Table')),
    //   body: HorizontalDataTable(
    //     leftHandSideColumnWidth: MediaQuery.of(context).size.width / 5,
    //     rightHandSideColumnWidth: MediaQuery.of(context).size.width,
    //     isFixedHeader: true,
    //     headerWidgets: _getTitleWidget(),
    //     isFixedFooter: true,
    //     footerWidgets: _getTitleWidget(),
    //     leftSideItemBuilder: _generateFirstColumnRow,
    //     rightSideItemBuilder: _generateRightHandSideColumnRow,
    //     itemCount: widget.dateTimeList!.length,
    //     rowSeparatorWidget: const Divider(
    //       color: Colors.black38,
    //       height: 1.0,
    //       thickness: 0.0,
    //     ),
    //     leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
    //     rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
    //   ),
    // );
    return HorizontalDataTable(
      leftHandSideColumnWidth: MediaQuery.of(context).size.width / 10,
      rightHandSideColumnWidth: MediaQuery.of(context).size.width,
      isFixedHeader: true,
      headerWidgets: _getTitleWidget(),
      isFixedFooter: true,
      footerWidgets: _getTitleWidget(),
      leftSideItemBuilder: _generateFirstColumnRow,
      rightSideItemBuilder: _generateRightHandSideColumnRow,
      itemCount: widget.dateTimeList!.length,
      rowSeparatorWidget: const Divider(
        color: Colors.black38,
        height: 1.0,
        thickness: 0.0,
      ),
      leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
      rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Ngày', 100),
      _getTitleItemWidget('Vào đầu tiên', 100),
      _getTitleItemWidget('Ra cuối cùng', 200),
      _getTitleItemWidget('Tổng số giờ', 100),
      _getTitleItemWidget('Số giờ được trả lương', 200),
      _getTitleItemWidget('Số giờ làm bù', 150),
      _getTitleItemWidget('Tăng ca/sai lệch', 150),
      _getTitleItemWidget('Trạng thái', 150),
      _getTitleItemWidget('Ca làm việc', 150),
      _getTitleItemWidget('Lập quy tắc', 150),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    //print(MediaQuery.of(context).size.width / 10);
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width / 10,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
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
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.center,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.firstIn}') : Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.lastOut}') : Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.totalHours}') : Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.payableHours}') : Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.overtimeDeviation}') : Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text("ahihi") : Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.status}') : Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: enable ? Text('${widget.dateTimeList![index].attendanceModel!.shift}') : Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("-"),
        ),
        Container(
          width: MediaQuery.of(context).size.width / 10,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text("-"),
        ),
      ],
    );
  }
}
