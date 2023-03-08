import 'dart:convert';
import 'dart:html';

import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/widget/env_department.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../widget/env_subject.dart';
import '/core/app_export.dart';

class SubjectController extends GetxController {
  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();
  List<UserModel> getUserList = <UserModel>[].obs;
  List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[].obs;
  final dashBoardController = Get.find<DashBoardController>();

  TextEditingController khoi_kien_thuc = TextEditingController();
  TextEditingController ma_hoc_phan = TextEditingController();
  TextEditingController ten_hoc_phan = TextEditingController();
  TextEditingController ki_thu = TextEditingController();
  TextEditingController so_tin_chi = TextEditingController();
  TextEditingController tong_so_tiet = TextEditingController();
  TextEditingController dktq = TextEditingController();
  TextEditingController mo_ta = TextEditingController();

  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


  @override
  void onClose() {
    super.onClose();
  }

  void controlMenu() {
    if (!scaffoldKey.currentState!.isDrawerOpen) {
      scaffoldKey.currentState!.openDrawer();
    }
  }
  Future<void> createSubject(
    String khoi_kien_thuc,
    String ma_hoc_phan,
    String ten_hoc_phan,
    String ki_thu,
    String so_tin_chi,
    String tong_so_tiet,
    String dktq,
    String mo_ta,
  ) async {
    await apiClient.createSubject(khoi_kien_thuc, ma_hoc_phan,ten_hoc_phan,ki_thu,so_tin_chi,tong_so_tiet,dktq,mo_ta).whenComplete((){
      dashBoardController.getSubject();
    });
  }

  Future<void> updateSubject(
    String khoi_kien_thuc,
    String ma_hoc_phan,
    String ten_hoc_phan,
    String ki_thu,
    String so_tin_chi,
    String tong_so_tiet,
    String dktq,
    String mo_ta,
  ) async {
    await apiClient.updateSubject(khoi_kien_thuc, ma_hoc_phan,ten_hoc_phan,ki_thu,so_tin_chi,tong_so_tiet,dktq,mo_ta).whenComplete((){
      dashBoardController.getSubject();
    });
  }

    //xoa phong ban
  Future<void> deleterSubject(
    String ma_hoc_phan
  ) async {
    await apiClient.deleteSubject(ma_hoc_phan).whenComplete((){
      dashBoardController.getSubject();
    });
  }

  void search(String query,String options) {
    if(options == KhoiKienThuc.value){
      var result = dashBoardController.getSubjectList.where((product) => product.KhoiKienThuc!.contains(query)).toList();
      dashBoardController.getSubjectListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getSubjectListMap.refresh();
    }
    else if(options == TenHocPhan.value){
      var result = dashBoardController.getSubjectList.where((product) => product.TenHocPhan!.contains(query)).toList();
      dashBoardController.getSubjectListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getSubjectListMap.refresh();
    }
    else if(options == MaHocPhan.value){
      var result = dashBoardController.getSubjectList.where((product) => product.MaHocPhan!.contains(query)).toList();
      dashBoardController.getSubjectListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getSubjectListMap.refresh();
    }
    else if(options == KiThu.value){
      var result = dashBoardController.getSubjectList.where((product) => product.KiThu!.contains(query)).toList();
      dashBoardController.getSubjectListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getSubjectListMap.refresh();
    }
  }

  //xuat file excel
   Future<void> exportData() async {
    print('HoangNH: ');
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
    final Range range1 = sheet.getRangeByName('A1:F1');
    range1.merge();
    final Range range2 = sheet.getRangeByName('A2:F2');
    range2.merge();
    final Range range3 = sheet.getRangeByName('A3:F3');
    range3.merge();
    sheet.getRangeByName('A4:I4').cellStyle = globalStyle;
    sheet.getRangeByName('A5:I${dashBoardController.getSubjectList.length + 4}').cellStyle = globalStyle1;
    sheet.getRangeByIndex(4, 1).setText('STT');
    sheet.getRangeByIndex(4, 2).setText(KhoiKienThuc.value);
    sheet.getRangeByIndex(4, 3).setText(TenHocPhan.value);
    sheet.getRangeByIndex(4, 4).setText(MaHocPhan.value);
    sheet.getRangeByIndex(4, 5).setText(SotinChi.value);
    sheet.getRangeByIndex(4, 6).setText(DKTQ.value);
    sheet.getRangeByIndex(4, 7).setText(KiThu.value);
    sheet.getRangeByIndex(4, 8).setText(TongSoTiet.value);
    sheet.getRangeByIndex(4, 9).setText(Mota.value);

    int row = 5;
    for (int i = 0; i < dashBoardController.getSubjectList.length; i++) {
      int column = 1;
      sheet.getRangeByIndex(row, column).setValue(i);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getSubjectList[i].KhoiKienThuc);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getSubjectList[i].TenHocPhan);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getSubjectList[i].MaHocPhan);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getSubjectList[i].SotinChi);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getSubjectList[i].DKTQ);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getSubjectList[i].KiThu);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getSubjectList[i].TongSoTiet);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getSubjectList[i].MoTa);
      row++;
    }
    final List<int> bytes = workbook.saveAsStream();
    workbook.dispose();

    AnchorElement(href: "data:application/octet-stream;charset=utf-16le;base64,${base64.encode(bytes)}")
      ..setAttribute("download",
          "bangnhansu__tuan.xlsx")
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

//import file excel
    Future<void> importFileExcel() async {
    try{
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
        allowMultiple: false,
      );
      if (pickedFile != null) {
      var bytes = pickedFile.files.single.bytes;
      var excel = Excel.decodeBytes(bytes!);
      excel.tables.values.map(
        (e) {
          print('HoangNH: ${e.sheetName}');
        },
      ).toList();
      Sheet sheetObject = excel[excel.tables.values.first.sheetName];
      print(sheetObject.maxRows);

      var lengthRow = sheetObject.maxRows;
      for(int i =1;i<lengthRow;i++){
        var account = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:0,rowIndex: i)).value.toString();
        var email = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:1,rowIndex: i)).value.toString();
        var fullname = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:2,rowIndex: i)).value.toString();
        print('HoangNH: $account');
        print('HoangNH: $email');
        print('HoangNH: $fullname');
      //   GetAllInformationUser model = GetAllInformationUser(
      //   createdDate: DateTime.now().toString(),
      //   fullname: fullname,
      //   email: email,
      //   username: account,
      //   imageUrl: '',
      //   id: Random().nextInt(1000)
      // );
      // employeesData.add(model);
      // employeesData.refresh();
      }
      // await apiClient.register(username, email, fullname, password)
      Get.snackbar(
        'Import file excel thành công'
        , '',backgroundColor: succes);
    }
    }
    catch(e){
      Get.snackbar(
        'File không đúng định dạng'
        , '',backgroundColor: error);
    }
  }
}
