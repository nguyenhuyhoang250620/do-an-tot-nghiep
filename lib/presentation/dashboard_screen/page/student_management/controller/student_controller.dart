

import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';

import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../../../constants/constants.dart';
import '../../../constants/slide_menu.dart';
import '../../../controller/dashboard_controller.dart';
import '../widget/env_student.dart';

class StudentController extends GetxController {
  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();
  List<UserModel> getUserList = <UserModel>[].obs;
  List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[].obs;
  final dashBoardController = Get.find<DashBoardController>();
    
  var pathImageAfterPickfileFromComputer = "".obs;
  XFile? pickFileFromComputer;
  Rx<bool> enableUpdateAvatar = false.obs;

  TextEditingController ten_sinh_vien = TextEditingController();
  TextEditingController ma_sinh_vien = TextEditingController();
  TextEditingController khoa = TextEditingController();
  TextEditingController ngay_sinh = TextEditingController();
  TextEditingController gioi_tinh = TextEditingController();
  TextEditingController cccd = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController so_dien_thoai = TextEditingController();

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
// tao sinh vien
  Future<void> createUser(
    String ten_sinh_vien,
    String ma_sinh_vien,
    String khoa,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai
  ) async {
    await apiClient.createUser(ten_sinh_vien, ma_sinh_vien, khoa, ngay_sinh, gioi_tinh, cccd, gmail, so_dien_thoai).whenComplete((){
      dashBoardController.getUser();
    });
  }
//cap nhat thong tin sinh vien
  Future<void> updateUser(
    String ten_sinh_vien,
    String ma_sinh_vien,
    String khoa,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai
  ) async {
    await apiClient.updateUser(ten_sinh_vien, ma_sinh_vien, khoa, ngay_sinh, gioi_tinh, cccd, gmail, so_dien_thoai).whenComplete((){
      dashBoardController.getUser();
    });
  }

//xoa sinh vien
  Future<void> deleterUser(
    String ma_sinh_vien,
  ) async {
    await apiClient.deleteUser(ma_sinh_vien).whenComplete((){
      dashBoardController.getUser();
    });
  }

//thay avatar
    Future<void> pickFileWeb() async {
    var getImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    pickFileFromComputer = getImage;

    pathImageAfterPickfileFromComputer.value = pickFileFromComputer!.path;
    if (pathImageAfterPickfileFromComputer.value != '') {
      enableUpdateAvatar.value = true;
    }
    // String name = pickedFile!.name;
    // debugPrint('TungVD - name - ${name}');
  }
  //upload avarta
  Future<void> uploadAvatar(String masv,XFile? files,) async{
    await apiClient.UpdateAvatar(masv: masv,files: files,magv: '');
    dashBoardController.getUser();
  }

//tim kiem theo thuoc tinh
  void search(String query,String options) {
    if(options == TenSV.value){
      var result = dashBoardController.getUserList.where((product) => product.TenSV!.contains(query)).toList();
      dashBoardController.getUserListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getUserListMap.refresh();
    }
    else if(options == MaSV.value){
      var result = dashBoardController.getUserList.where((product) => product.MaSV!.contains(query)).toList();
      dashBoardController.getUserListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getUserListMap.refresh();
    }
     else if(options == Khoa.value){
      var result = dashBoardController.getUserList.where((product) => product.Khoa!.contains(query)).toList();
      dashBoardController.getUserListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getUserListMap.refresh();
    }
     else if(options == CCCD.value){
      var result = dashBoardController.getUserList.where((product) => product.CCCD!.contains(query)).toList();
      dashBoardController.getUserListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getUserListMap.refresh();
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
    // final Range range1 = sheet.getRangeByName('A1:F1');
    // range1.merge();
    // final Range range2 = sheet.getRangeByName('A2:F2');
    // range2.merge();
    // final Range range3 = sheet.getRangeByName('A3:F3');
    // range3.merge();
    sheet.getRangeByName('A1:H4').cellStyle = globalStyle;
    sheet.getRangeByName('A2:H${dashBoardController.getUserList.length+1}').cellStyle = globalStyle1;
    sheet.getRangeByIndex(1, 1).setText(TenSV.value);
    sheet.getRangeByIndex(1, 2).setText(MaSV.value);
    sheet.getRangeByIndex(1, 3).setText(Email.value);
    sheet.getRangeByIndex(1, 4).setText(NamSinh.value);
    sheet.getRangeByIndex(1, 5).setText(GioiTinh.value);
    sheet.getRangeByIndex(1, 6).setText(Khoa.value);
    sheet.getRangeByIndex(1, 7).setText(SoDT.value);
    sheet.getRangeByIndex(1, 8).setText(CCCD.value);

    int row = 2;
    for (int i = 0; i < dashBoardController.getUserList.length; i++) {
      int column = 0;
      // sheet.getRangeByIndex(row, column).setValue(i);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getUserList[i].TenSV);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getUserList[i].MaSV);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getUserList[i].Email);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getUserList[i].NamSinh);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getUserList[i].GioiTinh);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getUserList[i].Khoa);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getUserList[i].SoDT);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getUserList[i].CCCD);
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
        Sheet sheetObject = excel[excel.tables.values.first.sheetName];
        var lengthRow = sheetObject.maxRows;
        for(int i =1;i<lengthRow;i++){
          var ten_sinh_vien = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:0,rowIndex: i)).value.toString();
          var ma_sinh_vien = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:1,rowIndex: i)).value.toString();
          var email = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:2,rowIndex: i)).value.toString();
          var ngay_sinh = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:3,rowIndex: i)).value.toString();
          var gioi_tinh = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:4,rowIndex: i)).value.toString();
          var khoa = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:5,rowIndex: i)).value.toString();
          var so_dien_thoai = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:6,rowIndex: i)).value.toString();
          var cccd = sheetObject.cell(CellIndex.indexByColumnRow(columnIndex:7,rowIndex: i)).value.toString();
          await apiClient.createUser(ten_sinh_vien, ma_sinh_vien, khoa, ngay_sinh, gioi_tinh, cccd, email, so_dien_thoai);
          dashBoardController.getUser();
        }
      }
      Get.snackbar(
      'Import file excel thành công'
      , '',backgroundColor: succes,
      );
    }
    catch(e){
      print('HoangNH: $e');
      Get.snackbar(
        'File không đúng định dạng'
        , '',backgroundColor: error);
    }
  }
}
