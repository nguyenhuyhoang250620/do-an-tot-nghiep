import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/controller/student_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/controller/teacher_controller.dart';
import 'package:get/get.dart';

import '../page/class_management/controller/class_controller.dart';
import '../page/department_management/controller/department_controller.dart';
import '../page/subject_management/controller/subject_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardController());
    Get.lazyPut(() => StudentController());
    Get.lazyPut(() => TeacherController());
    Get.lazyPut(() => DepartmentController());
    Get.lazyPut(() => SubjectController());
    Get.lazyPut(() => ClassController());
  }
}
