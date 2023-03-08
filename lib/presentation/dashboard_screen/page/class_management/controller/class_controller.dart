import 'dart:convert';
import 'dart:html';

import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/class_management/widget/env_class.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_xlsio/xlsio.dart';

import '/core/app_export.dart';

class ClassController extends GetxController {
  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();
  List<UserModel> getUserList = <UserModel>[].obs;
  List<Map<String, dynamic>> jsonList = <Map<String, dynamic>>[].obs;
  final dashBoardController = Get.find<DashBoardController>();

  TextEditingController ten_may_quet = TextEditingController();
  TextEditingController mo_ta = TextEditingController();
  TextEditingController ma_phong = TextEditingController();
  TextEditingController ten_phong = TextEditingController();


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

  Future<void> createClass(
    String ten_phong,
    String ma_phong,
    String ten_may_quet,
    String mo_ta,
  ) async {
    await apiClient.createClass(ten_may_quet, mo_ta, ma_phong, ten_phong).whenComplete((){
      dashBoardController.getClass();
    });
  }

  Future<void> updateClass(
    String ten_phong,
    String ma_phong,
    String ten_may_quet,
    String mo_ta,
  ) async {
    await apiClient.updateClass(ten_phong, ma_phong, ten_may_quet, mo_ta).whenComplete((){
      dashBoardController.getClass();
    });
  }

   //xoa lop hoc
  Future<void> deleterClass(
    String ma_phong,
  ) async {
    await apiClient.deleteClass(ma_phong).whenComplete((){
      dashBoardController.getClass();
    });
  }

  void search(String query,String options) {
    if(options == TenPhong.value){
      var result = dashBoardController.getClassList.where((product) => product.TenPhong!.contains(query)).toList();
      dashBoardController.getClassListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getClassListMap.refresh();
    }
    else if(options == MaPhong.value){
      var result = dashBoardController.getClassList.where((product) => product.MaPhong!.contains(query)).toList();
      dashBoardController.getClassListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getClassListMap.refresh();
    }
    else if(options == TenMayQuet.value){
      var result = dashBoardController.getClassList.where((product) => product.TenMayQuet!.contains(query)).toList();
      dashBoardController.getClassListMap.value =result.map((person) => person.toJson()).toList();
      dashBoardController.getClassListMap.refresh();
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
    sheet.getRangeByName('A4:E4').cellStyle = globalStyle;
    sheet.getRangeByName('A5:I${dashBoardController.getClassList.length + 4}').cellStyle = globalStyle1;
    sheet.getRangeByIndex(4, 1).setText('STT');
    sheet.getRangeByIndex(4, 2).setText(TenPhong.value);
    sheet.getRangeByIndex(4, 3).setText(MaPhong.value);
    sheet.getRangeByIndex(4, 4).setText(TenMayQuet.value);
    sheet.getRangeByIndex(4, 5).setText(Mota.value);

    int row = 5;
    for (int i = 0; i < dashBoardController.getClassList.length; i++) {
      int column = 1;
      sheet.getRangeByIndex(row, column).setValue(i);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getClassList[i].TenPhong);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getClassList[i].MaPhong);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getClassList[i].TenMayQuet);
      column++;
      sheet.getRangeByIndex(row, column).setText(dashBoardController.getClassList[i].Mota);
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
