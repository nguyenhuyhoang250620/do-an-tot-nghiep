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

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();
  static String acccount = '';
  var baseUrl = "http://localhost:3000/api";
  final dio = Dio();
  String getAccount() {
    return acccount;
  }

  factory ApiClient() {
    //debugPrint('ahihihiApiClient');
    // _dio.options.connectTimeout = 15 * 1000; //15 sec
    // _dio.options.receiveTimeout = 15 * 1000; //15 sec
    // _dio.options.receiveDataWhenStatusError = true;
    // _dio.interceptors.clear();
    // _dio.interceptors.add(dio.QueuedInterceptorsWrapper(
    //   onRequest: (options, handler) {
    //     //debugPrint('ahihihiApiClient onRequest');
    //     options.baseUrl = baseUrl;
    //     options.headers = {"Authorization": "Bearer $accessToken"};
    //     return handler.next(options);
    //   },
    //   onResponse: (response, handler) {
    //     //debugPrint('ahihihiApiClient onResponse');
    //     return handler.next(response);
    //   },
    //   onError: (e, handler) async {
    //     // debugPrint('apiClient: onError ${e.type}');
    //     switch (e.type) {
    //       case dio.DioErrorType.connectTimeout:
    //       case dio.DioErrorType.sendTimeout:
    //       case dio.DioErrorType.receiveTimeout:
    //         throw DeadlineExceededException(e.requestOptions);
    //       case dio.DioErrorType.response:
    //         // debugPrint('ApiClient: dio.DioErrorType.response: ${e.response}');
    //         isDioResponseNull.value = e.response == null;
    //         switch (e.response?.statusCode) {
    //           case 400:
    //             throw BadRequestException(e.requestOptions);
    //           case 401:
    //             //NguyenNH: lấy token mới
    //             await refreshTokens();
    //             //NguyenNH: lấy các option của request cũ và thay accessToken mới:
    //             dio.RequestOptions requestOptions = e.requestOptions;
    //             if (requestOptions.data is dio.FormData) {
    //               dio.FormData formData = dio.FormData();
    //               formData.fields.addAll(requestOptions.data.fields);
    //               for (MapEntry mapFile in requestOptions.data.files) {
    //                 formData.files.add(MapEntry(mapFile.key, dio.MultipartFile.fromFileSync(mapFile.value.FILE_PATH, filename: mapFile.value.filename)));
    //               }
    //               requestOptions.data = formData;
    //             }
    //             requestOptions.headers["Authorization"] = "Bearer $accessToken";

    //             //NguyenNH: forward request cũ theo token mới
    //             retryDio.fetch(requestOptions).then((value) {
    //               handler.resolve(value);
    //             }).catchError((err) {
    //               // ignore: prefer_typing_uninitialized_variables
    //               var errorMessage;
    //               if (err is dio.DioError) {
    //                 switch (err.type) {
    //                   case dio.DioErrorType.response:
    //                     errorMessage = err.response!.data['message'];
    //                     break;
    //                   default:
    //                     errorMessage = err.toString();
    //                     break;
    //                 }
    //               } else {
    //                 errorMessage = err.toString();
    //               }
    //               debugPrint('NguyenNH: fetch error: ApiClient: $errorMessage');
    //               handler.next(e);
    //             });
    //             // throw UnauthorizedException(e.requestOptions);
    //             //Đổi sang break để hạn chế bắn exception
    //             break;
    //           case 404:
    //             handler.next(e);
    //             throw NotFoundException(e.requestOptions);
    //           case 409:
    //             handler.next(e);
    //             throw ConflictException(e.requestOptions);
    //           case 500:
    //             handler.next(e);
    //             throw InternalServerErrorException(e.requestOptions);
    //         }
    //         break;
    //       case dio.DioErrorType.cancel:
    //         break;
    //       case dio.DioErrorType.other:
    //         throw NoInternetConnectionException(e.requestOptions);
    //     }
    //   },
    // ));
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

  
  // register(String username, String email, String fullname, String password) async {
  //   Map data = {
  //     'username': username,
  //     'email': email,
  //     'fullname': fullname,
  //     'password': password,
  //   };
  //   String body = json.encode(data);

  //   _dio.options.headers['content-Type'] = 'application/json';
  //   try {
  //     return await _dio
  //         .post(
  //       '/api/auth/register',
  //       data: body,
  //     )
  //         .then((value) {
  //       if (value.statusCode == 200) {
  //         return Get.snackbar('Đăng kí tài khoản thành công!', 'Mời về đăng nhập',
  //             snackPosition: SnackPosition.TOP, backgroundColor: Colors.green.withOpacity(0.4));
  //       }
  //     });
  //   } catch (e) {
  //     return Get.snackbar('Đăng kí không thành công!', 'Tên đăng nhập đã tồn tại',
  //         snackPosition: SnackPosition.TOP, backgroundColor: Colors.red.withOpacity(0.4));
  //   }
  // }
  ApiClient._internal();
}

