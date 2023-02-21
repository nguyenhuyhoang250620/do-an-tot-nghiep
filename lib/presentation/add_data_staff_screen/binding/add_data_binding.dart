import 'package:get/get.dart';

import '../controller/add_data_controller.dart';
import '../controller/scan_controller.dart';

class AddDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddDataController());
    Get.lazyPut(() => ScanController());
  }
}
