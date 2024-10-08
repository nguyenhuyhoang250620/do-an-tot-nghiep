import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/class_models.dart';
import 'package:do_an_tot_nghiep/data/models/config_models.dart';
import 'package:do_an_tot_nghiep/data/models/department_models.dart';
import 'package:do_an_tot_nghiep/data/models/order_food.dart';
import 'package:do_an_tot_nghiep/data/models/subject_models.dart';
import 'package:do_an_tot_nghiep/data/models/teacher_models.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/food_management/env/env.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/models/attendance_teacher_model.dart';
import '../../../data/models/food_model.dart';
import '../../../data/models/note_client_model.dart';
import '../../../data/models/shift_models.dart';
import '../../../libary/data_table_2/src/data_table_2.dart';
import '../models/model_sum_food.dart';
import '/core/app_export.dart';

class DashBoardController extends GetxController {
  var name_tab = ''.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();

  var TQ = false.obs;
  var QLSV = false.obs;
  var QLGV = false.obs;
  var QLPB = false.obs;
  var QLVTPH = false.obs;
  var QLTC = false.obs;
  var QLCH = false.obs;
  var QLTD = false.obs;
  var QLP = false.obs;
  var CHDD = false.obs;
  var DSDM = false.obs;

  var isLoadingStudent = false.obs;
  var isLoadingTeacher = false.obs;
  var isLoadingDepartment = false.obs;
  var isLoadingSubject = false.obs;
  var isLoadingClass = false.obs;
  var isLoadingShift = false.obs;
  var isLoadingNote = false.obs;
  var isLoadingConfig = false.obs;

  var sum_student = 0.obs;
  var sum_teacher = 0.obs;
  var sum_department = 0.obs;
  var sum_class = 0.obs;

  var so_ngay_cong = 0.obs;

  RxList<UserModel> getUserList = <UserModel>[].obs;
  RxList<Map<String, dynamic>> getUserListMap = <Map<String, dynamic>>[].obs;

  RxList<TeacherModel> getTeacherList = <TeacherModel>[].obs;
  RxList<Map<String, dynamic>> getTeacherListMap = <Map<String, dynamic>>[].obs;

  RxList<DepartmentModel> getDepartmentList = <DepartmentModel>[].obs;
  RxList<Map<String, dynamic>> getDepartmentListMap =
      <Map<String, dynamic>>[].obs;

  RxList<SubjectModel> getSubjectList = <SubjectModel>[].obs;
  RxList<Map<String, dynamic>> getSubjectListMap = <Map<String, dynamic>>[].obs;

  RxList<ClassModel> getClassList = <ClassModel>[].obs;
  RxList<Map<String, dynamic>> getClassListMap = <Map<String, dynamic>>[].obs;

  RxList<ShiftModel> getShiftList = <ShiftModel>[].obs;
  RxList<Map<String, dynamic>> getShiftListMap = <Map<String, dynamic>>[].obs;

  RxList<ConfigModel> getConfigList = <ConfigModel>[].obs;

  RxList<FoodModel> getDishList = <FoodModel>[].obs;

  RxList<FoodModel> getDrinksList = <FoodModel>[].obs;

  RxList<FoodModel> getDessertList = <FoodModel>[].obs;

  RxList<orderFoodModel> getOrderFoodList = <orderFoodModel>[].obs;

  RxList<NoteRequestModel> listNoteRequestAdmin = <NoteRequestModel>[].obs;

  RxList listDateInMonth = [].obs;

  RxList<AttendanceTeacher> getAttendanceTeacherList =
      <AttendanceTeacher>[].obs;

  List<String> listGioiTinh = ['Nam', 'Nữ', 'Khác', 'Chọn'];
  RxString selectedGioiTinh = "Chọn".obs;
  List<dynamic> listKhoa = [];
  void onInit() {
    // checkIsLogin();
    Authorcation();
    getUser();
    getTeacher();
    getDepartment();
    getClass();

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

  Future<void> Authorcation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> authorcation = prefs.getString('authorcation')!.split(",");
    authorcation.map((e) {
      name_tab.value = authorcation.first;
      switch (e) {
        case 'tong_quat':
          TQ.value = true;
          break;
        case 'quan_ly_sinh_vien':
          QLSV.value = true;
          break;
        case 'quan_ly_giang_vien':
          QLGV.value = true;
          break;
        case 'quan_ly_phong_ban':
          QLPB.value = true;
          break;
        case 'quan_ly_vi_tri_phong_hoc':
          QLVTPH.value = true;
          break;
        case 'quan_ly_tin_chi':
          getSubject();
          QLTC.value = true;
          break;
        case 'quan_ly_ca_hoc':
          getShift();
          QLCH.value = true;
          break;
        case 'quan_ly_thuc_don':
          getFood();
          QLTD.value = true;
          break;
        case 'quan_ly_phieu':
          getNoteRequestAdmin();
          QLP.value = true;
          break;
        case 'cau_hinh_he_thong_diem_danh':
          getConfig();
          CHDD.value = true;
          break;
        case 'order_food':
          getOrderFood();
          DSDM.value = true;
          break;
      }
    }).toList();
  }

  Future<void> checkIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogin = prefs.getBool('isLogin');
    if (isLogin == true) {
    } else {
      Get.offAllNamed(AppRoutes.loginScreen);
    }
  }

  // get event sinh vien
  Future<void> getUser() async {
    List<UserModel> dataGet = [];
    List<UserModel> data = [];
    await apiClient.getUser().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.map((e) {
        UserModel models = UserModel(
            CCCD: e.CCCD,
            Email: e.Email,
            GioiTinh: e.GioiTinh,
            Khoa: e.Khoa,
            MaSV: e.MaSV,
            NamSinh: e.NamSinh,
            SoDT: e.SoDT,
            TenSV: e.TenSV,
            id: e.id,
            url: e.url);
        data.add(models);
        listKhoa.add(e.Khoa);
      }).toList();
      isLoadingStudent.value = true;
      sum_student.value = data.length;
      getUserList.value = data;
      getUserListMap.value =
          getUserList.map((person) => person.toJson()).toList();
      getUserListMap.refresh();
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get du lieu giang vien
  Future<void> getTeacher() async {
    List<TeacherModel> dataGet = [];
    List<TeacherModel> data = [];
    await apiClient.getTeacher().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.map((e) {
        TeacherModel models = TeacherModel(
            CCCD: e.CCCD,
            Email: e.Email,
            GioiTinh: e.GioiTinh,
            ChuyenNganh: e.ChuyenNganh,
            MaGV: e.MaGV,
            NamSinh: e.NamSinh,
            SoDT: e.SoDT,
            TenGV: e.TenGV,
            url: e.url,
            id: e.id,
            author: e.author);
        data.add(models);
      }).toList();
      isLoadingTeacher.value = true;
      sum_teacher.value = data.length;
      getTeacherList.value = data;
      getTeacherListMap.value =
          getTeacherList.map((person) => person.toJson()).toList();
      getTeacherListMap.refresh();
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get du lieu giang vien
  Future<void> getDepartment() async {
    List<DepartmentModel> dataGet = [];
    List<DepartmentModel> data = [];
    await apiClient.getDepartment().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.map((e) {
        DepartmentModel models = DepartmentModel(
            id: e.id, MaDV: e.MaDV, Mota: e.Mota, TenDV: e.TenDV);
        data.add(models);
      }).toList();
      isLoadingDepartment.value = true;
      sum_department.value = data.length;
      getDepartmentList.value = data;
      getDepartmentListMap.value =
          getDepartmentList.map((person) => person.toJson()).toList();
      getDepartmentListMap.refresh();
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get du lieu vi tri phong hoc
  Future<void> getSubject() async {
    List<SubjectModel> dataGet = [];
    List<SubjectModel> data = [];
    await apiClient.getSubject().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.map((e) {
        SubjectModel models = SubjectModel(
            id: e.id,
            MaHocPhan: e.MaHocPhan,
            SotinChi: e.SotinChi,
            TenHocPhan: e.TenHocPhan,
            KiThu: e.KiThu,
            DKTQ: e.DKTQ,
            KhoiKienThuc: e.KhoiKienThuc,
            MoTa: e.MoTa,
            TongSoTiet: e.TongSoTiet);
        data.add(models);
      }).toList();
      isLoadingSubject.value = true;
      getSubjectList.value = data;
      getSubjectListMap.value =
          getSubjectList.map((person) => person.toJson()).toList();
      getSubjectListMap.refresh();
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get du lieu vi tri phong hoc
  Future<void> getClass() async {
    List<ClassModel> dataGet = [];
    List<ClassModel> data = [];
    await apiClient.getClass().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.map((e) {
        ClassModel models = ClassModel(
            id: e.id,
            MaPhong: e.MaPhong,
            Mota: e.Mota,
            TenMayQuet: e.TenMayQuet,
            TenPhong: e.TenPhong);
        data.add(models);
      }).toList();
      isLoadingClass.value = true;
      sum_class.value = data.length;
      getClassList.value = data;
      getClassListMap.value =
          getClassList.map((person) => person.toJson()).toList();
      getClassListMap.refresh();
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get du lieu vi tri phong hoc
  Future<void> getShift() async {
    List<ShiftModel> dataGet = [];
    List<ShiftModel> data = [];
    await apiClient.getShift().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.map((e) {
        ShiftModel models = ShiftModel(
            id: e.id,
            MaCa: e.MaCa,
            Mota: e.Mota,
            SoCa: e.SoCa,
            TenCa: e.TenCa,
            ThoiGian: e.ThoiGian);
        data.add(models);
      }).toList();
      isLoadingShift.value = true;
      getShiftList.value = data;
      getShiftListMap.value =
          getShiftList.map((person) => person.toJson()).toList();
      getShiftListMap.refresh();
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get du lieu vi tri phong hoc
  Future<void> getConfig() async {
    List<ConfigModel> dataGet = [];
    await apiClient.getConfig().then((value) {
      dataGet = value;
    }).whenComplete(() {
      isLoadingConfig.value = true;
      getConfigList.value = dataGet;
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get thuc don
  Future<void> getFood() async {
    getDishList.clear();
    getDrinksList.clear();
    getDessertList.clear();
    List<FoodModel> dataGet = [];
    await apiClient.getFood().then((value) {
      dataGet = value;
    }).whenComplete(() {
      dataGet.forEach((e) {
        if (e.type == mon_ans.value) {
          FoodModel model = FoodModel(
              id: e.id,
              maMon: e.maMon,
              khoiLuong: e.khoiLuong,
              chiTiet: e.chiTiet,
              tenMonAn: e.tenMonAn,
              type: e.type,
              calo: e.calo,
              url: e.url);
          getDishList.add(model);
        } else if (e.type == nuoc_uong.value) {
          FoodModel model = FoodModel(
              id: e.id,
              maMon: e.maMon,
              khoiLuong: e.khoiLuong,
              chiTiet: e.chiTiet,
              tenMonAn: e.tenMonAn,
              type: e.type,
              calo: e.calo,
              url: e.url);
          getDrinksList.add(model);
        } else {
          FoodModel model = FoodModel(
              id: e.id,
              maMon: e.maMon,
              khoiLuong: e.khoiLuong,
              chiTiet: e.chiTiet,
              tenMonAn: e.tenMonAn,
              type: e.type,
              calo: e.calo,
              url: e.url);
          getDessertList.add(model);
        }
      });
    });
  }

  List<sumFood> sumFodd = <sumFood>[].obs;
  // get orderfood
  Future<void> getOrderFood() async {
    List<orderFoodModel> dataGet = [];
    List<String> listFood = [];
    await apiClient.getOrderfood().then((value) {
      dataGet = value;
    }).whenComplete(() {
      getOrderFoodList.value = dataGet;
      for (var element in dataGet) {
        listFood.add(element.tenMonAn);
      }
      List<String> onlyFood = listFood.toSet().toList();
      for (var element in onlyFood) {
        int sum = 0;
        for (var doc in getOrderFoodList) {
          if (element == doc.tenMonAn) {
            sum += int.parse(doc.soLuong);
          }
        }
        sumFood model = sumFood(name: element, sum: sum);
        sumFodd.add(model);
      }
      print(sumFodd.length);
    });
  }

  //get note
  Future<void> getNoteRequestAdmin() async {
    listNoteRequestAdmin.clear();
    List<NoteRequestModel> data = [];
    await apiClient.getNoteAdmin().then((value) {
      data = value;
    }).whenComplete(() {
      data.map((e) {
        NoteRequestModel model = NoteRequestModel(
            id: e.id,
            description: e.description,
            status: e.status,
            teacherCode: e.teacherCode,
            teacherName: e.teacherName,
            time: e.time,
            type: e.type);
        isLoadingNote.value = true;
        listNoteRequestAdmin.add(model);
      }).toList();
    });
  }

  //get date in month
  Future<void> getDateinMonth(DateTime now, MaGV) async {
    listDateInMonth.clear();
    int year = now.year;
    int month = now.month;
    int daysInMonth = DateTime(year, month + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      DateTime date = DateTime(year, month, day);
      String formattedDate = DateFormat('dd/MM').format(date);
      listDateInMonth.add(formattedDate);
      // print(formattedDate);
    }
    getAttendanceTeacher(MaGV, listDateInMonth);
  }

  String convertTime(String) {
    DateTime dateTime = DateTime.parse(String);
    var formattedDate =
        "${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}";
    return formattedDate;
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get du lieu vi tri phong hoc
  Future<void> getAttendanceTeacher(MaGV, List listDateInMonth) async {
    getAttendanceTeacherList.clear();
    so_ngay_cong.value = 0;
    List<AttendanceTeacher> data = [];
    bool isCheck = false;
    await apiClient.getAttendanceTeacher(MaGV).then((value) {
      data = value;
    }).whenComplete(() {
      if (data.isNotEmpty) {
        for (var element in data) {
          for (var doc in listDateInMonth) {
            for (int i = 0; i < element.DiemDanh!.length; i++) {
              if (convertTime(element.DiemDanh![i].CheckIn) == doc) {
                isCheck = true;
              } else {
                isCheck = false;
              }
            }
            if (isCheck == true) {
              so_ngay_cong++;
            }
            AttendanceTeacher model = AttendanceTeacher(
                DiemDanh: element.DiemDanh,
                MaGV: element.MaGV,
                MaHocPhan: element.MaHocPhan,
                MaPhong: element.MaPhong,
                ThoiGian: element.ThoiGian,
                isCheck: isCheck,
                date: doc);
            getAttendanceTeacherList.add(model);
          }
        }
      } else {
        for (var doc in listDateInMonth) {
          AttendanceTeacher model = AttendanceTeacher(
              DiemDanh: [],
              MaGV: '',
              MaHocPhan: '',
              MaPhong: '',
              ThoiGian: '',
              isCheck: isCheck,
              date: doc);
          getAttendanceTeacherList.add(model);
        }
      }
    });
  }
}
