import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';

class NoteManagementController extends GetxController{
  var isShowAction = true.obs;
  final apiClient = ApiClient();
  final dashboardController = Get.find<DashBoardController>();
  Future<void> noteReview(
    String status,
    String type,
    String time,
    String MaGV,
    String description
  ) async{
    await apiClient.NoteReview(status, type, time, MaGV, description);
    dashboardController.getNoteRequestAdmin();
  }
}