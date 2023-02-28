import 'dart:convert';import 'package:do_an_tot_nghiep/presentation/home_screen/models/attendance.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/models/department.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/models/employees.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/models/home_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/models/time_attendance_model.dart';

import '/core/app_export.dart';

class HomeController extends GetxController {
  late TextEditingController usernameController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  Rx<TimeAttendanceModel> timeAttendanceModel = TimeAttendanceModel().obs;
  SelectionPopupModel? selectedDropDownHome;
  Rx<DateTime> _dateTimeNow = new DateTime.now().obs;
  Rx<DateTime> _startDate = DateTime.utc(2022, 10, 01).obs;
  Rx<DateTime> get startDate => _startDate;
  Rx<DateTime> _endDate = DateTime.utc(2022, 10, 03).obs;
  Rx<DateTime> get endDate => _endDate;
  SelectionPopupModel? selectedDropDownTime;
  FocusNode usernameFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  Rx<DateTime> get dateTimeNow => _dateTimeNow;
  Rx<HomeModel> homeModelObj = HomeModel().obs;
  RxList<Employee> employees = <Employee>[].obs;
  RxList<Department> departments = <Department>[].obs;
  RxList<Attendance> attendance = <Attendance>[].obs;
  RxBool _isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    importRawDataTestFromLocalFile();
  }

  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onLogin() {
    // Get.to(page)
  }

  //TungVD: Load data import from local file

  Future<void> importRawDataTestFromLocalFile() async {
    _isLoading.value = true;

    final String responseEmployee = await rootBundle.loadString('data/employee.json');
    final dataEmployee = await json.decode(responseEmployee);

    final String responseAttendance = await rootBundle.loadString('data/attendance.json');
    final dataAttendance = await json.decode(responseAttendance);

    final String responseDepartment = await rootBundle.loadString('data/department.json');
    final dataDepartment = await json.decode(responseDepartment);

    employees.value = (dataEmployee as List).map((e) => Employee.fromJson(e)).toList();

    attendance.value = (dataAttendance as List).map((e) => Attendance.fromJson(e)).toList();

    departments.value = (dataDepartment as List).map((e) => Department.fromJson(e)).toList();

    debugPrint('TungVD getCCTVEventListFromLocalFile - employees - ${employees.length}');
    debugPrint('TungVD getCCTVEventListFromLocalFile - attendance - ${attendance.length}');
    debugPrint('TungVD getCCTVEventListFromLocalFile - departments - ${departments.length}');

    _isLoading.value = false;
  }



  onSelectedHome(dynamic value) {
    selectedDropDownHome = value as SelectionPopupModel;
    timeAttendanceModel.value.dropdownHome.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    timeAttendanceModel.value.dropdownHome.refresh();
  }

  onSelectedTime(dynamic value) {
    selectedDropDownTime = value as SelectionPopupModel;
    timeAttendanceModel.value.dropdownItemListTime.forEach((element) {
      element.isSelected = false;
      if (element.id == value.id) {
        element.isSelected = true;
      }
    });
    timeAttendanceModel.value.dropdownItemListTime.refresh();
  }
}
