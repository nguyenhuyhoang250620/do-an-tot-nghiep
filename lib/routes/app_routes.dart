import 'package:do_an_tot_nghiep/presentation/client_screen/client_binding/client_binding.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_screen.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/dash_board_screen.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/binding/dashboard_binding.dart';
import 'package:do_an_tot_nghiep/presentation/login_screen/binding/login_binding.dart';
import 'package:do_an_tot_nghiep/presentation/login_screen/login_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String initialRoute = '/dashboard_screen';
  static String loginScreen = '/login_screen';
  static String dashBoardScreen = '/dashboard_screen';
  static String clientScreen = '/client_screen';


  static List<GetPage> pages = [
    GetPage(
      name: clientScreen,
      page: () => ClientScreen(),
      bindings: [
        ClientBingding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
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
