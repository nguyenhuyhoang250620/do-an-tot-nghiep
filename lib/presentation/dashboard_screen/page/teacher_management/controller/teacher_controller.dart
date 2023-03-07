import 'dart:convert';
import 'dart:html';
// import 'dart:html';
import 'dart:io';

import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/widget/env_teacher.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '../../../constants/constants.dart';
import '/core/app_export.dart';

class TeacherController extends GetxController {
  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();
  List<UserModel> getUserList = <UserModel>[].obs;
  List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[].obs;
  final dashBoardController = Get.find<DashBoardController>();
    
  var pathImageAfterPickfileFromComputer = "".obs;
  XFile? pickFileFromComputer;
  Rx<bool> enableUpdateAvatar = false.obs;

  TextEditingController ten_giang_vien = TextEditingController();
  TextEditingController ma_giang_vien = TextEditingController();
  TextEditingController chuyen_nganh = TextEditingController();
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
  Future<void> createTeacher(
    String ten_giang_vien,
    String ma_giang_vien,
    String chuyen_nganh,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai
  ) async {
    await apiClient.createTeacher(ten_giang_vien, ma_giang_vien, chuyen_nganh, ngay_sinh, gioi_tinh, cccd, gmail, so_dien_thoai).whenComplete((){
      dashBoardController.getTeacher();
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
    await apiClient.UpdateAvatar(masv: masv,files: files);
    dashBoardController.getUser();
  }

//tim kiem theo thuoc tinh
  void search(String query,String options) {
    if(options == TenGV.value){
      var result = dashBoardController.getTeacherList.where((product) => product.TenGV!.contains(query)).toList();
      dashBoardController.getTeacherListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getTeacherListMap.refresh();
    }
    else if(options == MaGV.value){
      var result = dashBoardController.getTeacherList.where((product) => product.MaGV!.contains(query)).toList();
      dashBoardController.getTeacherListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getTeacherListMap.refresh();
    }
     else if(options == ChuyenNganh.value){
      var result = dashBoardController.getTeacherList.where((product) => product.ChuyenNganh!.contains(query)).toList();
      dashBoardController.getTeacherListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getTeacherListMap.refresh();
    }
     else if(options == CCCD.value){
      var result = dashBoardController.getTeacherList.where((product) => product.CCCD!.contains(query)).toList();
      dashBoardController.getTeacherListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getTeacherListMap.refresh();
    }
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
    final Range range1 = sheet.getRangeByName('A1:F1');
    range1.merge();
    final Range range2 = sheet.getRangeByName('A2:F2');
    range2.merge();
    final Range range3 = sheet.getRangeByName('A3:F3');
    range3.merge();
    sheet.getRangeByName('A4:I4').cellStyle = globalStyle;
    sheet.getRangeByName('A5:I${dashBoardController.getTeacherList.length + 4}').cellStyle = globalStyle1;
    sheet.getRangeByIndex(4, 1).setText('STT');
    sheet.getRangeByIndex(4, 2).setText(TenGV.value);
    sheet.getRangeByIndex(4, 3).setText(MaGV.value);
    sheet.getRangeByIndex(4, 4).setText(Email.value);
    sheet.getRangeByIndex(4, 5).setText(NamSinh.value);
    sheet.getRangeByIndex(4, 6).setText(GioiTinh.value);
    sheet.getRangeByIndex(4, 7).setText(ChuyenNganh.value);
    sheet.getRangeByIndex(4, 8).setText(SoDT.value);
    sheet.getRangeByIndex(4, 9).setText(CCCD.value);

    int row = 5;
    for (int i = 0; i < dashBoardController.getUserList.length; i++) {
      int column = 1;
      sheet.getRangeByIndex(row, column).setValue(i);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getTeacherList[i].TenGV);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getTeacherList[i].MaGV);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getTeacherList[i].Email);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getTeacherList[i].NamSinh);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getTeacherList[i].GioiTinh);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getTeacherList[i].ChuyenNganh);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getTeacherList[i].SoDT);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getTeacherList[i].CCCD);
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
