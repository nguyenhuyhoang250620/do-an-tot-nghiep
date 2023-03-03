import 'package:do_an_tot_nghiep/data/apiClient/api_client.dart';
import 'package:do_an_tot_nghiep/data/models/department_models.dart';
import 'package:do_an_tot_nghiep/data/models/subject_models.dart';
import 'package:do_an_tot_nghiep/data/models/teacher_models.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/slide_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '/core/app_export.dart';

class DashBoardController extends GetxController {
  var name_tab = tong_quat.obs;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final apiClient = ApiClient();

  var isLoadingStudent = false.obs;
  var isLoadingTeacher = false.obs;
  var isLoadingDepartment = false.obs;
  var isLoadingSubject = false.obs;

  RxList<UserModel> getUserList = <UserModel>[].obs;
  RxList<Map<String, dynamic>> getUserListMap = <Map<String, dynamic>>[].obs;

  RxList<TeacherModel> getTeacherList = <TeacherModel>[].obs;
  RxList<Map<String, dynamic>> getTeacherListMap = <Map<String, dynamic>>[].obs;

  RxList<DepartmentModel> getDepartmentList = <DepartmentModel>[].obs;
  RxList<Map<String, dynamic>> getDepartmentListMap =
      <Map<String, dynamic>>[].obs;

  RxList<SubjectModel> getSubjectList = <SubjectModel>[].obs;
  RxList<Map<String, dynamic>> getSubjectListMap = <Map<String, dynamic>>[].obs;

  void onInit() {
    getUser();
    getTeacher();
    getDepartment();
    getSubject();
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
            id: e.id);
        data.add(models);
      }).toList();
      isLoadingStudent.value = true;
      getUserList.value = data;
      getUserListMap.value =getUserList.map((person) => person.toJson()).toList();
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
            id: e.id);
        data.add(models);
      }).toList();
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
          MaPhong: e.MaPhong,
          TenMayQuet: e.TenMayQuet,
          TenPhong: e.TenPhong,
          Mota: e.Mota,
        );
        data.add(models);
      }).toList();
      isLoadingSubject.value = true;
      getSubjectList.value = data;
      getSubjectListMap.value =
          getSubjectList.map((person) => person.toJson()).toList();
      getSubjectListMap.refresh();
    });
  }
}
