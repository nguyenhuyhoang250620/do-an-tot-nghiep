import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/config_models.dart';
class StatisController extends GetxController{
  var isEdit = false.obs;
  TextEditingController diem_chuyen_can = TextEditingController();
  TextEditingController diem_giua_ki = TextEditingController();
  TextEditingController diem_cuoi_ki = TextEditingController();
  TextEditingController diem_trung_binh = TextEditingController();
  final apiClient = ApiClient();
  final clientController = Get.find<ClientController>();


  Future<void> createPoint(
    String ma_giang_vien,
    String ma_sinh_vien,
    String diem_chuyen_can,
    String diem_giua_ki,
    String diem_cuoi_ki,
    String diem_trung_binh,
  ) async{
    await apiClient.createPoint(ma_giang_vien, ma_sinh_vien, diem_chuyen_can, diem_giua_ki, diem_cuoi_ki, diem_trung_binh);
    clientController.getConfig();

  }

  Future<void> averagedFunction(
    String ma_giang_vien
  )async{
   await apiClient.sumAravage(ma_giang_vien);
   clientController.getConfig();
  }

  Future<void> deleteStudent(
    String ma_giang_vien,
    String ma_sinh_vien
  ) async{
    await apiClient.deleteStudent(
      ma_giang_vien,
      ma_sinh_vien
    );
    clientController.getConfig();
  }
}