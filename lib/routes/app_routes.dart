import 'package:do_an_tot_nghiep/presentation/dashboard_screen/dash_board_screen.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/binding/dashboard_binding.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/binding/home_binding.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/home_screen.dart';
import 'package:do_an_tot_nghiep/presentation/login_screen/binding/login_binding.dart';
import 'package:do_an_tot_nghiep/presentation/login_screen/login_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String textStylesScreen = '/text_styles_screen';
  static String appNavigationScreen = '/app_navigation_screen';
  static String initialRoute = '/dashboard_screen';
  static String loginScreen = '/login_screen';
  static String homeScreen = '/home_screen';
  static String dashBoardScreen = '/dashboard_screen';


  static List<GetPage> pages = [
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
      name: dashBoardScreen,
      page: () => DashBoardScreen(),
      bindings: [
        DashBoardBinding(),
      ],
    ),
  ];
}
