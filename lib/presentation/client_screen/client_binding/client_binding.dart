import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/food_screen/food_controller/food_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/attendance_client_screen/attendance_client_controller/attendance_client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/note/note_client_controller.dart';

import '../../dashboard_screen/controller/dashboard_controller.dart';
import '../client_controller/client_controller.dart';
import '../client_page/home_screen/home_controller/home_controller.dart';
import '../client_page/statis_screen/statuis_controller/statis_controller.dart';

class ClientBingding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ClientController());
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => StatisController());
    Get.lazyPut(() => FoodController());
    Get.lazyPut(() => AttendanceClientController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => NoteClientController());
  }

}