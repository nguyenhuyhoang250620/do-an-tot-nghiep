import 'dart:convert';
import 'dart:html';

import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

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
    clientController.getConfigClient(clientController.MaGV.value);

  }

  Future<void> averagedFunction(
    String ma_giang_vien
  )async{
   await apiClient.sumAravage(ma_giang_vien);
   clientController.getConfigClient(clientController.MaGV.value);
  }

  Future<void> deleteStudent(
    String ma_giang_vien,
    String ma_sinh_vien
  ) async{
    await apiClient.deleteStudent(
      ma_giang_vien,
      ma_sinh_vien
    );
    clientController.getConfigClient(clientController.MaGV.value);
  }


    //xuat file excel
   Future<void> exportData() async {
    final Workbook workbook = Workbook();
    final Worksheet sheet = workbook.worksheets[0];
    final Style globalStyle = workbook.styles.add('globalStyle');
    globalStyle.backColor = '#DDDDDD';
    globalStyle.fontName = 'Times New Roman';
    globalStyle.fontSize = 12;
    globalStyle.fontColor = '#000000';
    globalStyle.italic = true;
    globalStyle.bold = true;
    // globalStyle.underline = true;
    globalStyle.wrapText = true;
    globalStyle.hAlign = HAlignType.center;
    globalStyle.vAlign = VAlignType.center;
    globalStyle.borders.all.lineStyle = LineStyle.medium;
    // globalStyle.borders.all.color = '#FFFFFF';

    final Style globalStyle1 = workbook.styles.add('globalStyle1');
    globalStyle1.fontName = 'Times New Roman';
    globalStyle1.wrapText = true;
    globalStyle1.hAlign = HAlignType.center;
    globalStyle1.vAlign = VAlignType.center;
    final Range range1 = sheet.getRangeByName('A1:G1');
    range1.merge();
    final Range range2 = sheet.getRangeByName('A2:G2');
    range2.merge();
    final Range range3 = sheet.getRangeByName('A3:G3');
    range3.merge();
    sheet.getRangeByName('A4:G4').cellStyle = globalStyle;
    sheet.getRangeByName('A5:G${clientController.getConfigList.length + 5}').cellStyle = globalStyle1;
    sheet.getRangeByIndex(4, 1).setText('STT');
    sheet.getRangeByIndex(4, 2).setText('Họ và tên');
    sheet.getRangeByIndex(4, 3).setText('Mã sinh viên');
    sheet.getRangeByIndex(4, 4).setText('Điểm chuyên cần');
    sheet.getRangeByIndex(4, 5).setText('Điểm giữa kì');
    sheet.getRangeByIndex(4, 6).setText('Điểm cuối kì');
    sheet.getRangeByIndex(4, 7).setText('Điểm trung bình');

    int row = 5;
    for (int j = 0; j < clientController.getConfigList.length; j++) {
      for(int i =0;i<clientController.getConfigList[j].danhsach.length;i++){
        int column = 1;
          sheet.getRangeByIndex(row, column).setValue(i);
          column++;
          sheet.getRangeByIndex(row, column).setText(clientController.getConfigList[j].danhsach[i].TenSV);
          column++;
          sheet.getRangeByIndex(row, column).setText(clientController.getConfigList[j].danhsach[i].MaSV);
          column++;
          sheet.getRangeByIndex(row, column).setText(clientController.getConfigList[j].danhsach[i].dcc);
          column++;
          sheet.getRangeByIndex(row, column).setText(clientController.getConfigList[j].danhsach[i].dgk);
          column++;
          sheet.getRangeByIndex(row, column).setText(clientController.getConfigList[j].danhsach[i].dck);
          column++;
          sheet.getRangeByIndex(row, column).setText(clientController.getConfigList[j].danhsach[i].dtb);
          row++;
          }
    }
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    AnchorElement(href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download",
          "bangketqua__tuan.xlsx")
      ..click();

    // final directory = await getExternalStorageDirectory();
    //
    // final path = directory!.path;
    //
    // File file = File('$path/Output.xlsx');
    //
    // await file.writeAsBytes(bytes, flush: true);
    //
    // OpenFile.open('$path/Output.xlsx');
  }
}