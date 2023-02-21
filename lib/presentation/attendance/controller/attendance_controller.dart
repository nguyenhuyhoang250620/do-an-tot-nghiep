import 'dart:convert';

import 'package:do_an_tot_nghiep/presentation/attendance/models/attendance_and_time_model.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/models/attendance_model1.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/models/department_model.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/models/employee_model.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/models/time_attendance_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '/core/app_export.dart';

class AttendanceController extends GetxController {
  int MAX_VIDEO_SCREEN_PER_PAGE = 6;
  int MAX_COLUMN_COUNT_VIDEO_PER_PAGE = 3;
  PageController pageController = PageController(initialPage: 0, viewportFraction: 1);

  int currentPage = 0;
  bool? checkcallback;
  final _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  RxInt textureId = 0.obs;
  final RxList<AttendanceModel1> _attendanceList = <AttendanceModel1>[].obs;
  RxList<AttendanceModel1> get attendanceList => _attendanceList;
  final RxList<DepartmentModel> _departmentList = <DepartmentModel>[].obs;
  RxList<DepartmentModel> get departmentList => _departmentList;
  final RxList<EmployeeModel> _employeesList = <EmployeeModel>[].obs;
  RxList<EmployeeModel> get employeesList => _employeesList;
  Rx<int> _employeeId = 1.obs; //Id cua Admin
  Rx<int> get employeeId => _employeeId;
  RxList<AttendanceModel1> _employeeEventsList = <AttendanceModel1>[].obs;
  RxList<AttendanceModel1> get employeeEventsList => _employeeEventsList;
  //thanhndh
  Rx<TimeAttendanceModel> timeAttendanceModel = TimeAttendanceModel().obs;
  Rx<bool> _isTime = false.obs;
  Rx<bool> get isTime => _isTime;
  TextEditingController textStartDate = TextEditingController();

  TextEditingController textEndDate = TextEditingController();
  Rx<DateTime> _startDate = DateTime.utc(2022, 10, 01).obs;
  Rx<DateTime> get startDate => _startDate;
  Rx<DateTime> _endDate = DateTime.utc(2022, 12, 01).obs;
  Rx<DateTime> get endDate => _endDate;
  RxList<DateTime> _dateTimeList = <DateTime>[DateTime.now()].obs;
  RxList<DateTime> get dateTimeList => _dateTimeList;
  RxList<AttendanceAndTimeModel> _attendance_and_time_model = <AttendanceAndTimeModel>[].obs;
  RxList<AttendanceAndTimeModel> get attendance_and_time_model => _attendance_and_time_model;
  // String datenow = DateFormat("dd-MM-yyyy").format(DateTime.now());
  void getDateTime() {
    final int diff = endDate.value.difference(startDate.value).inDays;
    print(diff);
    _dateTimeList = RxList<DateTime>.generate(diff + 1, (index) {
      final item = startDate.value.add(Duration(days: index));
      return item;
    });
    _dateTimeList.map((e) => print(e.toString())).toList();
  }

  void fiterEmployeeTime(List<AttendanceModel1> list) {
    list.map((e) {
      //print('thanhndh:ahihihi');
      if (e.employeeId == _employeeId.value) {
        _employeeEventsList.value.add(e);
      }
    }).toList();
  }

  Rx<int> numberWeek = 0.obs;
  Rx<int> numberMonth = 0.obs;

  void findLastDateOfNextWeek(DateTime dateTime) {
    final now = DateTime.utc(2022, 12, 01);

    var dateParse = new DateTime(now.year, now.month - 22, 0);

    _dateTimeList.value = [];
    final DateTime sameWeekDayOfNextWeek = dateTime.add(Duration(days: numberWeek.value));
    final last = findLastDateOfTheWeek(sameWeekDayOfNextWeek);
    final first = last.add(Duration(days: -6));
    _dateTimeList = RxList<DateTime>.generate(7, (index) {
      final item = first.add(Duration(days: index));
      return item;
    });
  }

  void findLastDateOfNextMonth(DateTime dateTime) {
    _dateTimeList.value = [];
    DateTime now = DateTime.now();
    int lastday = DateTime(now.year, now.month + numberMonth.value + 1, 0).day;
    DateTime firstday = DateTime(now.year, now.month + numberMonth.value, 1);
    print(lastday);
    _dateTimeList = RxList<DateTime>.generate(lastday, (index) {
      final item = firstday.add(Duration(days: index));
      return item;
    });
  }

  DateTime findLastDateOfTheWeek(DateTime dateTime) {
    final item = dateTime.add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
    return item;
  }

  void nextWeek() {
    _dateTimeList.value = [];
    DateTime now = DateTime.now();
    late DateTime lastDayOfMonth;
    lastDayOfMonth = DateTime(now.year, now.month, 7);
    var startFrom = now.subtract(Duration(days: now.weekday));
    List<DateTime> list = List.generate(7, (i) => startFrom.add(Duration(days: i)));
    list.map((e) {
      _dateTimeList.add(e);
    }).toList();
  }

  SelectionPopupModel? selectedDropDownValue;

  @override
  void onInit() {
    selectedDropDownValue = timeAttendanceModel.value.dropdownItemListTime[3];
    super.onInit();
    print('HoangNH: onInit');
  }

  @override
  void onReady() {
    super.onReady();

    //selectedDropDownValue!.title = '1 tháng';
    //onSelected(timeAttendanceModel.value.dropdownItemListTime.value[3]);
    checkcallback = true;
  }

  @override
  void onClose() {
    super.onClose();
    _employeesList.value = [];
    debugPrint('thanhndh onClose');
  }

  Future<void> getAttendanceFromLocalFile() async {
    final String response = await rootBundle.loadString('data/attendance.json');
    final data = await json.decode(response);
    _attendanceList.value = (data as List).map((e) => AttendanceModel1.fromJson(e)).toList();
    _attendanceList.value
        .map(
          (e) => print(e.toJson()),
        )
        .toList();
    fiterEmployeeTime(_attendanceList.value);
    _isLoading.value = false;
  }

  Future<void> getDepartmentFromLocalFile() async {
    final String response = await rootBundle.loadString('data/department.json');
    final data = await json.decode(response);
    _departmentList.value = (data as List).map((e) => DepartmentModel.fromJson(e)).toList();
    _isLoading.value = false;
  }

  Future<void> getEmployeeFromLocalFile() async {
    _employeesList.value = [];
    final String response = await rootBundle.loadString('data/employee.json');
    final data = await json.decode(response);
    _employeesList.value = (data as List).map((e) => EmployeeModel.fromJson(e)).toList();
    _isLoading.value = false;
  }

  void mapList(List<DateTime> listDateTime, List<AttendanceModel1> listAttendanceModel1) {
    _attendance_and_time_model.value = [];
    listDateTime.map((e) {
      bool enable = false;
      AttendanceModel1? attendanceModel1;
      final datetime = DateFormat('dd-MM-yyyy').format(e);
      //print('thanhndh: ${e.toString()}');
      listAttendanceModel1.map((element) {
        if (!enable) {
          if (datetime == element.date) {
            enable = true;
            attendanceModel1 = element;
            //print('thanhndh: ${datetime}');
          } else {}
        }
      }).toList();
      if (enable) {
        _attendance_and_time_model.value.add(AttendanceAndTimeModel(dateTime: e, attendanceModel: attendanceModel1));
      } else {
        _attendance_and_time_model.value.add(AttendanceAndTimeModel(dateTime: e));
      }
    }).toList();
  }

  changePage(int index, {bool animate = true}) async {
    if (animate) {
      await pageController.animateToPage(index, duration: const Duration(milliseconds: 380), curve: Curves.fastOutSlowIn);
      // print('HanhLiuu: _UiVmsScreenState.changePage : Change page');
    }
  }

  String changetodate(String datetime) {
    DateTime tempDate = DateFormat("dd-MM-yyyy").parse(datetime);
    String date = DateFormat("dd-MM-yyyy").format(tempDate);
    return date;
  }

  String? datenow;

  void callback_time(String dateTime) {
    datenow = dateTime;
    checkcallback = false;
    //getInformation();
  }

  void checkdatenow(bool bool) {
    if (bool == false) {
      datenow = "";
      checkcallback = true;
      employeesList.value = [];
    }
  }

  // Future<void> getInformation() async {
  //   employeesList.map((element) {
  //     AttendanceModel modelinfo =
  //         AttendanceModel(cameraId: element.cameraId, id: element.id, image: element.image, soCmt: element.soCmt, thoiGianXuatHien: element.thoiGianXuatHien);
  //     attendanceList.add(modelinfo);
  //   }).toList();
  // }

  onSelected(dynamic value) {
    selectedDropDownValue = value as SelectionPopupModel;
    if (selectedDropDownValue!.title == '1 tuần') {
      numberWeek.value = 0;
      findLastDateOfNextWeek(DateTime.now());
    } else if (selectedDropDownValue!.title == '1 tháng') {
      numberMonth.value = 0;
      findLastDateOfNextMonth(DateTime.now());
    }
    timeAttendanceModel.value.dropdownItemListTime.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });

    timeAttendanceModel.value.dropdownItemListTime.refresh();
  }
}
