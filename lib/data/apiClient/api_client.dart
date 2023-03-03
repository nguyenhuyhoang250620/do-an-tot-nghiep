import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
import 'dart:typed_data';
// ignore: library_prefixes
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:dio/dio.dart';
import 'package:do_an_tot_nghiep/data/models/department_models.dart';
import 'package:do_an_tot_nghiep/data/models/subject_models.dart';
import 'package:do_an_tot_nghiep/data/models/teacher_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../models/user_models.dart';

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();
  static String acccount = '';
  var baseUrl = "http://localhost:3000/api";
  final dio = Dio();
  String getAccount() {
    return acccount;
  }
  factory ApiClient() {
    return _apiClient;
  }
   Future<void> login(String email, String password) async {
    try {
      final response = await dio.post('$baseUrl/signin', data: {'email': email, 'password': password});

      // Xử lý kết quả trả về từ API
      if (response.statusCode == 200) {
        // Lưu token vào local storage hoặc truyền vào trang khác để sử dụng
        final token = response.data['token'];
        Get.offAndToNamed(AppRoutes.homeScreen);
        // ...
      } else {
        // Đăng nhập thất bại, xử lý thông báo lỗi hoặc hiển thị form đăng nhập lại
        // ...
      }
    } catch (error) {
      // Xử lý lỗi khi gọi API
      print('HoangNH: Thất bại');
      // ...
    }
  }

  Future<void> logout() async{
      try {
      final response = await dio.post('$baseUrl/signout',);

      // Xử lý kết quả trả về từ API
      if (response.statusCode == 200) {
        // Lưu token vào local storage hoặc truyền vào trang khác để sử dụng
        final token = response.data['token'];
        Get.offAndToNamed(AppRoutes.loginScreen);
        // ...
      } else {
        // Đăng nhập thất bại, xử lý thông báo lỗi hoặc hiển thị form đăng nhập lại
        // ...
      }
    } catch (error) {
      // Xử lý lỗi khi gọi API
      print('HoangNH: Thất bại');
      // ...
    }
  }

  Future<void> forgetPassword(String email) async{
      try {
      final response = await dio.post('$baseUrl/forget-password',data: {'email': email});

      // Xử lý kết quả trả về từ API
      if (response.statusCode == 200) {
        print('HoangNH: thành công');
        // ...
      } else {
        // Đăng nhập thất bại, xử lý thông báo lỗi hoặc hiển thị form đăng nhập lại
        // ...
      }
    } catch (error) {
      // Xử lý lỗi khi gọi API
      print('HoangNH: Thất bại');
      // ...
    }
  }

  //get list user
  Future<List<UserModel>> getUser() async {
    return await dio.get('$baseUrl/get-user',)
      .then((response) {
      List<UserModel> userList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          userList.add(UserModel.fromJson(item));
        }
      }
      return userList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }
  //create user
  Future<void> createUser(
    String ten_sinh_vien,
    String ma_sinh_vien,
    String khoa,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai
  ) async{
    Map data ={
      "MaSV":ma_sinh_vien, 
      "TenSV":ten_sinh_vien,
      "Khoa":khoa,
      "NamSinh":ngay_sinh,
      "GioiTinh":gioi_tinh,
      "CCCD":cccd,
      "Email":gmail,
      "SoDT":so_dien_thoai
    };

    String body = json.encode(data);

    try{
      return await dio.post(
        '$baseUrl/create-user',
        data: body
        ).then((value){
        if(value.statusCode == 201){
          Get.snackbar(
            'Thêm sinh viên mới thành công'
            , '',backgroundColor: succes);
        }
      });
    }
    catch(e){
          Get.snackbar(
            'Thêm sinh viên mới không thành công'
            , '',backgroundColor: error);
    }

  }
  //update user
   Future<void> updateUser(
    String ten_sinh_vien,
    String ma_sinh_vien,
    String khoa,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai
  ) async{
    Map data ={
      "MaSV":ma_sinh_vien, 
      "TenSV":ten_sinh_vien,
      "Khoa":khoa,
      "NamSinh":ngay_sinh,
      "GioiTinh":gioi_tinh,
      "CCCD":cccd,
      "Email":gmail,
      "SoDT":so_dien_thoai
    };

    String body = json.encode(data);

    try{
      return await dio.patch(
        '$baseUrl/update-user',
        data: body
        ).then((value){
          print('HoangNH: ${value.statusCode}');
        if(value.statusCode == 200){
          Get.snackbar(
            'Cập nhật thành công'
            , '',backgroundColor: succes);
        }
      });
    }
    catch(e){
          Get.snackbar(
            'Cập nhật không thành công'
          , '',backgroundColor: error);
    }

  }
    
  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  
  //get list teacher
  Future<List<TeacherModel>> getTeacher() async {
    return await dio.get('$baseUrl/get-teacher',)
      .then((response) {
      List<TeacherModel> teacherList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          teacherList.add(TeacherModel.fromJson(item));
        }
      }
      return teacherList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

    //create teacher
  Future<void> createTeacher(
    String ten_giang_vien,
    String ma_giang_vien,
    String chuyen_nganh,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai
  ) async{
    Map data ={
      "MaGV":ma_giang_vien, 
      "TenGV":ten_giang_vien,
      "ChuyenNganh":chuyen_nganh,
      "NamSinh":ngay_sinh,
      "GioiTinh":gioi_tinh,
      "CCCD":cccd,
      "Email":gmail,
      "SoDT":so_dien_thoai
    };

    String body = json.encode(data);

    try{
      return await dio.post(
        '$baseUrl/create-teacher',
        data: body
        ).then((value){
        if(value.statusCode == 201){
          Get.snackbar(
            'Thêm giang viên mới thành công'
            , '',backgroundColor: succes);
        }
      });
    }
    catch(e){
          Get.snackbar(
            'Thêm giảng viên mới không thành công'
            , '',backgroundColor: error);
    }
  }
  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get list department
  Future<List<DepartmentModel>> getDepartment() async {
    return await dio.get('$baseUrl/get-department',)
      .then((response) {
      List<DepartmentModel> departmentList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          departmentList.add(DepartmentModel.fromJson(item));
        }
      }
      return departmentList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //create department
  Future<void> createDepartment(
    String ten_don_vi,
    String ma_don_vi,
    String mo_ta,
  ) async{
    Map data ={
      "MaDV":ma_don_vi, 
      "TenDV":ten_don_vi,
      "Mota":mo_ta,
    };

    String body = json.encode(data);

    try{
      return await dio.post(
        '$baseUrl/create-department',
        data: body
        ).then((value){
        if(value.statusCode == 201){
          Get.snackbar(
            'Thêm giang viên mới thành công'
            , '',backgroundColor: succes);
        }
      });
    }
    catch(e){
          Get.snackbar(
            'Thêm giảng viên mới không thành công'
            , '',backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get list subject
  Future<List<SubjectModel>> getSubject() async {
    return await dio.get('$baseUrl/get-subject',)
      .then((response) {
      List<SubjectModel> subjectList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          subjectList.add(SubjectModel.fromJson(item));
        }
      }
      return subjectList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //create department
  Future<void> createSubject(
    String ten_don_vi,
    String ma_don_vi,
    String mo_ta,
    String ten_may_quet,
  ) async{
    Map data ={
      "MaPhong":ma_don_vi, 
      "TenPhong":ten_don_vi,
      "Mota":mo_ta,
      "TenMayQuet":ten_may_quet,
    };

    String body = json.encode(data);

    try{
      return await dio.post(
        '$baseUrl/create-subject',
        data: body
        ).then((value){
        if(value.statusCode == 201){
          Get.snackbar(
            'Thêm giang viên mới thành công'
            , '',backgroundColor: succes);
        }
      });
    }
    catch(e){
          Get.snackbar(
            'Thêm giảng viên mới không thành công'
            , '',backgroundColor: error);
    }
  }
  ApiClient._internal();
}

