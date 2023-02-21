import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/add_data_department/add_data_department.dart';
import 'package:do_an_tot_nghiep/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/attendance_screen.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/attendance_welcome_screen.dart';
import 'package:do_an_tot_nghiep/presentation/attendance/binding/attandance_binding.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/binding/home_binding.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/home_screen.dart';
import 'package:do_an_tot_nghiep/presentation/login_screen/binding/login_binding.dart';
import 'package:do_an_tot_nghiep/presentation/login_screen/login_screen.dart';
import 'package:get/get.dart';
import '../presentation/add_data_staff_screen/add_data_department/department_interface.dart';
import '../presentation/add_data_staff_screen/add_data_staff.dart';
import '../presentation/add_data_staff_screen/add_data_welcome_screen.dart';
import '../presentation/add_data_staff_screen/binding/add_data_binding.dart';
import '../presentation/add_data_staff_screen/employee_interface.dart';
import '../presentation/app_navigation_screen/binding/app_navigation_binding.dart';

class AppRoutes {
  static String textStylesScreen = '/text_styles_screen';
  static String appNavigationScreen = '/app_navigation_screen';
  static String initialRoute = '/login_screen';
  static String attendanceScreen = '/attendance_screen';
  static String loginScreen = '/login_screen';
  static String homeScreen = '/home_screen';
  static String attendanceWelcomeScreen = '/attendance_welcome_screen';
  static String adddataWelcomeScreen = '/add_data_welcome_screen';
  static String adddatastaffScreen = '/add_data_staff_screen';
  static String adddatadepartmentScreen = '/add_data_department_screen';
  static String employeeInterface = '/employee_interface';
  static String departmentInterface = '/department_interface';

  static List<GetPage> pages = [
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: attendanceScreen,
      page: () => AttendanceScreen(),
      bindings: [
        AttendanceBinding(),
      ],
    ),
    //TungVD: Them Login Screen
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    //TungVD: Them Home Screen
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      bindings: [
        HomeBinding(),
      ],
    ),
    GetPage(
      name: attendanceWelcomeScreen,
      page: () => AttendanceWelcomeScreen(),
      bindings: [
        AttendanceBinding(),
      ],
    ),
    GetPage(
      name: adddataWelcomeScreen, 
      page: ()=>AddDataWelcomeScreen(),
      bindings: [
        AddDataBinding()
      ]
    ),
    GetPage(
      name: adddatastaffScreen, 
      page: ()=>AddDataStaffScreen(),
      bindings: [
        AddDataBinding()
      ]
      ),
    GetPage(
      name: employeeInterface, 
      page: ()=>EmployeeInterface(),
      bindings: [
        AddDataBinding()
      ]
      ),
    GetPage(
      name: departmentInterface, 
      page: ()=>DepartmentInterface(),
      bindings: [
        AddDataBinding()
      ]
      ),
    GetPage(
      name: adddatadepartmentScreen, 
      page: ()=>AddDataDepartmentScreen(),
      bindings: [
        AddDataBinding()
      ]
      )
  ];
}
