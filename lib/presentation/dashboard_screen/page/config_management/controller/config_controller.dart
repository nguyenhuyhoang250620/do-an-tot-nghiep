import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:flutter/material.dart';

class ConfigController extends GetxController{
   final apiClient = ApiClient();
  final dashboardController = Get.find<DashBoardController>();
  TextEditingController ten_cau_hinh = TextEditingController();
  TextEditingController ghi_chu = TextEditingController();
  var ma_giang_vien = "".obs;
  var ma_phong_ban = "".obs;
  var ma_phong_hoc = "".obs;
  var ma_ca = "".obs;
  var ma_hoc_phan = "".obs;
  var ten_hoc_phan = "".obs;
  List<String> danh_sach_sinh_vien = <String>[].obs;


  Future<void> createConfig(
    String ten_cau_hinh,
    String ma_giang_vien,
    String ma_phong_ban,
    String ma_phong_hoc,
    String ma_ca,
    String ma_hoc_phan,
    List<String> danh_sach_sinh_vien,
    String ghi_chu,
  ) async{
    await apiClient.createConfig(ma_giang_vien,ma_phong_hoc,ma_phong_ban,ma_ca,ma_hoc_phan,danh_sach_sinh_vien);
    dashboardController.getConfig();
  }


   Future<void> createAttendance(
      String magv,
      String mahocphan,
      String maphong,
      List<dynamic> diemdanh,
      String tenhocphan,
   ) async{
    apiClient.createAttendance(magv, mahocphan, maphong, diemdanh,tenhocphan);
  }

  Future<void> createAttendanceTeacher(
      String MaGV, 
      String MaHocPhan, 
      String MaPhong,
      String ThoiGian, 
      List DiemDanh,
   ) async{
    apiClient.createAttendanceTeacher(MaGV, MaHocPhan, MaPhong, ThoiGian,DiemDanh);
  }
  

   Future<void> deleteConfig(
      String MaGV,
      String MaHocPhan,
   ) async{
    await apiClient.deleteConfig(MaGV,MaHocPhan);
    dashboardController.getConfig();
  }
}