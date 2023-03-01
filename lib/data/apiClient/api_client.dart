import 'dart:convert';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:typed_data';
// ignore: library_prefixes
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:dio/dio.dart';
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
  ApiClient._internal();
}

