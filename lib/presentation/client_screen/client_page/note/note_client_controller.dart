import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';

import '../../../../data/models/note_client_model.dart';


class NoteClientController extends GetxController{
  List listTypeNote = [
    'Đơn xin nghỉ có lương',
    'Đơn xin nghỉ chế độ',
    'Đơn xin nghỉ bù'
  ];
  var selectDateTime = '1 Ngày'.obs;

  var leaveDay = ''.obs;
  var dateTimeLeave = ''.obs;
  var typeNote = ''.obs;
  var decription = ''.obs;
  final clientController = Get.find<ClientController>();



  final apiClient = ApiClient();

  Future<void> createNote(
    String status,
    String dateTimeLeave,
    String typeNote,
    String decription
  ) async{
    NoteRequestModel modelClient = NoteRequestModel(
      description: decription,
      time: dateTimeLeave,
      type: typeNote,
      status: status
    );
    clientController.listNoteRequest.add(modelClient);
    clientController.listNoteRequest.refresh();
  }

  Future<void> sendNote(
    String status,
    String type,
    String time,
    String MaGV,
    String description
  ) async{
    await apiClient.createNoteClient(status,type,time,MaGV,description);
    clientController.getNoteRequest(MaGV);
  }
}