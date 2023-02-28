import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:get/get.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
  }
}
