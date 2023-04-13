import 'dart:convert';
import 'dart:io';
// ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
import 'dart:typed_data';
// ignore: library_prefixes
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:dio/dio.dart';
import 'package:do_an_tot_nghiep/core/utils/authorcation.dart';
import 'package:do_an_tot_nghiep/data/models/class_models.dart';
import 'package:do_an_tot_nghiep/data/models/config_models.dart';
import 'package:do_an_tot_nghiep/data/models/department_models.dart';
import 'package:do_an_tot_nghiep/data/models/food_model.dart';
import 'package:do_an_tot_nghiep/data/models/order_food.dart';
import 'package:do_an_tot_nghiep/data/models/shift_models.dart';
import 'package:do_an_tot_nghiep/data/models/subject_models.dart';
import 'package:do_an_tot_nghiep/data/models/teacher_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as _dio;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/attendance_teacher_model.dart';
import '../models/note_client_model.dart';
import '../models/selectionPopupModel/attendance_model.dart';
import '../models/user_models.dart';
import 'env.dart';

class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();
  static String acccount = '';
  static bool isLogin = false;
  var baseUrl = "http://localhost:3000/api";
  final dio = Dio();
  String getAccount() {
    return acccount;
  }

  bool IsLogin() {
    return isLogin;
  }

  factory ApiClient() {
    return _apiClient;
  }
  Future<void> login(String email, String password) async {
    try {
      final response = await dio.post('$baseUrl/signin',
          data: {'email': '${email}@gmail.com', 'password': password});

      // Xử lý kết quả trả về từ API
      if (response.statusCode == 200) {
        Map<String, dynamic> decodedToken =
            JwtDecoder.decode(response.data['idToken']);
        String role = decodedToken['role'];
        String authorcation = decodedToken['authorcation'];
        // print('HoangNH: $role');
        // print('HoangNH: $authorcation');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('authorcation', authorcation);
        // List<String> mang = authorcation.split(",");
        // mang.map((e) {
        //   print('HoangNH: $e');
        // }).toList();
        // quyen.map((e) {
        //   print('HoangNH: $e');
        // }).toList();
        // SharedPreferences prefs = await SharedPreferences.getInstance();
        // prefs.setString('role', role);
        // prefs.setBool('isLogin', true);
        isLogin = true;
        if (role == Admin) {
          Get.offAndToNamed(AppRoutes.dashBoardScreen);
        } else {
          Get.offAndToNamed(AppRoutes.clientScreen);
          String MaGV =
              response.data['user']['email'].replaceAll("@gmail.com", "");
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('MaGV', MaGV);
        }
        // ...
      } else {
        // Đăng nhập thất bại, xử lý thông báo lỗi hoặc hiển thị form đăng nhập lại
        // ...
      }
    } catch (e) {
      // Xử lý lỗi khi gọi API
      Get.snackbar('Tài khoản không tồn tại, hoặc chưa được cấp', '',
          backgroundColor: error);
      // ...
    }
  }

  Future<void> logout() async {
    try {
      final response = await dio.post(
        '$baseUrl/logout',
      );
      // Xử lý kết quả trả về từ API
      if (response.statusCode == 200) {
        // Lưu token vào local storage hoặc truyền vào trang khác để sử dụng
        final token = response.data['token'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('MaGV');
        prefs.remove('isLogin');
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

  Future<void> forgetPassword(String email) async {
    try {
      final response =
          await dio.post('$baseUrl/forget-password', data: {'email': email});

      // Xử lý kết quả trả về từ API
      if (response.statusCode == 200) {
        print('HoangNH: thành công');
        Get.snackbar('Gửi mã thành công', '',
          backgroundColor: succes);
        // ...
      } else {
        // Đăng nhập thất bại, xử lý thông báo lỗi hoặc hiển thị form đăng nhập lại
        // ...
      }
    } catch (errors) {
      // Xử lý lỗi khi gọi API
      Get.snackbar('Gưi mã không thành công', '',
          backgroundColor: error);
      print('HoangNH: Thất bại');
      // ...
    }
  }

  //get list user
  Future<List<UserModel>> getUser() async {
    return await dio
        .get(
      '$baseUrl/get-user',
    )
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
      String so_dien_thoai) async {
    Map data = {
      "MaSV": ma_sinh_vien,
      "TenSV": ten_sinh_vien,
      "Khoa": khoa,
      "NamSinh": ngay_sinh,
      "GioiTinh": gioi_tinh,
      "CCCD": cccd,
      "Email": gmail,
      "SoDT": so_dien_thoai
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/create-user', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //delete user
  Future<void> deleteUser(String ma_sinh_vien) async {
    Map data = {
      "MaSV": ma_sinh_vien,
    };

    String body = json.encode(data);

    try {
      return await dio.delete('$baseUrl/delete-user', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Xoá thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Xoá không thành công', '', backgroundColor: error);
    }
  }

  //update user
  Future<void> updateUser(
      String ten_giang_vien,
      String ma_giang_vien,
      String chuyen_nganh,
      String ngay_sinh,
      String gioi_tinh,
      String cccd,
      String gmail,
      String so_dien_thoai) async {
    Map data = {
      "MaGV": ma_giang_vien,
      "TenGV": ten_giang_vien,
      "ChuyenNganh": chuyen_nganh,
      "NamSinh": ngay_sinh,
      "GioiTinh": gioi_tinh,
      "CCCD": cccd,
      "Email": gmail,
      "SoDT": so_dien_thoai
    };

    String body = json.encode(data);

    try {
      return await dio
          .patch('$baseUrl/update-teacher', data: body)
          .then((value) {
        print('HoangNH: ${value.statusCode}');
        if (value.statusCode == 200) {
          Get.snackbar('Cập nhật thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Cập nhật không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//

  //get list teacher
  Future<List<TeacherModel>> getTeacher() async {
    return await dio
        .get(
      '$baseUrl/get-teacher',
    )
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
      String so_dien_thoai) async {
    Map data = {
      "MaGV": ma_giang_vien,
      "TenGV": ten_giang_vien,
      "ChuyenNganh": chuyen_nganh,
      "NamSinh": ngay_sinh,
      "GioiTinh": gioi_tinh,
      "CCCD": cccd,
      "Email": gmail,
      "SoDT": so_dien_thoai
    };

    String body = json.encode(data);

    try {
      return await dio
          .post('$baseUrl/create-teacher', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //update teacher
  Future<void> updateTeacher(
      String ten_sinh_vien,
      String ma_sinh_vien,
      String khoa,
      String ngay_sinh,
      String gioi_tinh,
      String cccd,
      String gmail,
      String so_dien_thoai) async {
    Map data = {
      "MaSV": ma_sinh_vien,
      "TenSV": ten_sinh_vien,
      "Khoa": khoa,
      "NamSinh": ngay_sinh,
      "GioiTinh": gioi_tinh,
      "CCCD": cccd,
      "Email": gmail,
      "SoDT": so_dien_thoai
    };

    String body = json.encode(data);

    try {
      return await dio.patch('$baseUrl/update-user', data: body).then((value) {
        print('HoangNH: ${value.statusCode}');
        if (value.statusCode == 200) {
          Get.snackbar('Cập nhật thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Cập nhật không thành công', '', backgroundColor: error);
    }
  }

  //delete teacher
  Future<void> deleteTeacher(ma_giang_vien) async {
    Map data = {
      "MaGV": ma_giang_vien,
    };

    String body = json.encode(data);

    try {
      return await dio
          .delete('$baseUrl/delete-teacher', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Xoá thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Xoá không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get list department
  Future<List<DepartmentModel>> getDepartment() async {
    return await dio
        .get(
      '$baseUrl/get-department',
    )
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
  ) async {
    Map data = {
      "MaDV": ma_don_vi,
      "TenDV": ten_don_vi,
      "Mota": mo_ta,
    };

    String body = json.encode(data);

    try {
      return await dio
          .post('$baseUrl/create-department', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //update department
  Future<void> updateDepartment(
    String ten_don_vi,
    String ma_don_vi,
    String mo_ta,
  ) async {
    Map data = {
      "MaDV": ma_don_vi,
      "TenDV": ten_don_vi,
      "Mota": mo_ta,
    };

    String body = json.encode(data);

    try {
      return await dio
          .patch('$baseUrl/update-department', data: body)
          .then((value) {
        print('HoangNH: ${value.statusCode}');
        if (value.statusCode == 200) {
          Get.snackbar('Cập nhật thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Cập nhật không thành công', '', backgroundColor: error);
    }
  }

  //xoa phong ban
  Future<void> deleteDepartment(String ma_don_vi) async {
    Map data = {
      "MaDV": ma_don_vi,
    };

    String body = json.encode(data);

    try {
      return await dio
          .delete('$baseUrl/delete-department', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Xoá thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Xoá không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get list subject
  Future<List<SubjectModel>> getSubject() async {
    return await dio
        .get(
      '$baseUrl/get-subject',
    )
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
    String khoi_kien_thuc,
    String ma_hoc_phan,
    String ten_hoc_phan,
    String ki_thu,
    String so_tin_chi,
    String tong_so_tiet,
    String dktq,
    String mo_ta,
  ) async {
    Map data = {
      "KhoiKienThuc": khoi_kien_thuc,
      "MaHocPhan": ma_hoc_phan,
      "TenHocPhan": ten_hoc_phan,
      "KiThu": ki_thu,
      "SotinChi": so_tin_chi,
      "TongSoTiet": tong_so_tiet,
      "DKTQ": dktq,
      "MoTa": mo_ta
    };

    String body = json.encode(data);

    try {
      return await dio
          .post('$baseUrl/create-subject', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //update subject
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
    Map data = {
      "KhoiKienThuc": khoi_kien_thuc,
      "MaHocPhan": ma_hoc_phan,
      "TenHocPhan": ten_hoc_phan,
      "KiThu": ki_thu,
      "SotinChi": so_tin_chi,
      "TongSoTiet": tong_so_tiet,
      "DKTQ": dktq,
      "MoTa": mo_ta
    };

    String body = json.encode(data);

    try {
      return await dio
          .patch('$baseUrl/update-subject', data: body)
          .then((value) {
        print('HoangNH: ${value.statusCode}');
        if (value.statusCode == 200) {
          Get.snackbar('Cập nhật thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Cập nhật không thành công', '', backgroundColor: error);
    }
  }

  //xoa hoc phan
  Future<void> deleteSubject(String ma_hoc_phan) async {
    Map data = {
      "MaHocPhan": ma_hoc_phan,
    };

    String body = json.encode(data);

    try {
      return await dio
          .delete('$baseUrl/delete-subject', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Xoá thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Xoá không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get list class
  Future<List<ClassModel>> getClass() async {
    return await dio
        .get(
      '$baseUrl/get-class',
    )
        .then((response) {
      List<ClassModel> classList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          classList.add(ClassModel.fromJson(item));
        }
      }
      return classList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //create class
  Future<void> createClass(
    String ten_may_quet,
    String mo_ta,
    String ma_phong,
    String ten_phong,
  ) async {
    Map data = {
      "MaPhong": ma_phong,
      "TenPhong": ten_phong,
      "Mota": mo_ta,
      "TenMayQuet": ten_may_quet,
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/create-class', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //update class
  Future<void> updateClass(
    String ten_phong,
    String ma_phong,
    String ten_may_quet,
    String mo_ta,
  ) async {
    Map data = {
      "TenPhong": ten_phong,
      "MaPhong": ma_phong,
      "TenMayQuet": ten_may_quet,
      "Mota": mo_ta,
    };

    String body = json.encode(data);

    try {
      return await dio.patch('$baseUrl/update-class', data: body).then((value) {
        print('HoangNH: ${value.statusCode}');
        if (value.statusCode == 200) {
          Get.snackbar('Cập nhật thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Cập nhật không thành công', '', backgroundColor: error);
    }
  }

  //xoa lop hoc
  Future<void> deleteClass(String ma_phong) async {
    Map data = {
      "MaPhong": ma_phong,
    };

    String body = json.encode(data);

    try {
      return await dio
          .delete('$baseUrl/delete-class', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Xoá thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Xoá không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //upload avatar
  Future<void> UpdateAvatar({
    required String masv,
    required String magv,
    required String ma_mon,
    XFile? files,
  }) async {
    Map<String, dynamic> map = {};
    if (masv != '') {
      map.addAll({"masv": masv});
    }
    if (magv != '') {
      map.addAll({"magv": magv});
    }
    if (ma_mon != '') {
      map.addAll({"ma_mon": ma_mon});
    }
    if (files != null && files.length().toString() != '0') {
      Uint8List bytes = await files.readAsBytes();
      String fileName = files.name;
      map.addAll(
          {"file": _dio.MultipartFile.fromBytes(bytes, filename: fileName)});
    }

    _dio.FormData formData = _dio.FormData.fromMap(map);
    print('HoangNH: ${formData.fields}');
    return await dio
        .post('$baseUrl/upload-image', data: formData)
        .then((response) {
      print('HoangNH: thanh cong');
      return;
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get list class
  Future<List<ShiftModel>> getShift() async {
    return await dio
        .get(
      '$baseUrl/get-shift',
    )
        .then((response) {
      List<ShiftModel> shiftList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          shiftList.add(ShiftModel.fromJson(item));
        }
      }
      return shiftList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //create department
  Future<void> createShift(
    String ma_ca,
    String ten_ca,
    String so_ca,
    String mo_ta,
    String thoi_gian,
  ) async {
    Map data = {
      "MaCa": ma_ca,
      "TenCa": ten_ca,
      "SoCa": so_ca,
      "Mota": mo_ta,
      "ThoiGian": thoi_gian
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/create-shift', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //update class
  Future<void> updateShift(
    String ma_ca,
    String ten_ca,
    String so_ca,
    String mo_ta,
    String thoi_gian,
  ) async {
    Map data = {
      "MaCa": ma_ca,
      "TenCa": ten_ca,
      "SoCa": so_ca,
      "Mota": mo_ta,
      "ThoiGian": thoi_gian
    };

    String body = json.encode(data);

    try {
      return await dio.patch('$baseUrl/update-shift', data: body).then((value) {
        print('HoangNH: ${value.statusCode}');
        if (value.statusCode == 200) {
          Get.snackbar('Cập nhật thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Cập nhật không thành công', '', backgroundColor: error);
    }
  }

  //xoa lop hoc
  Future<void> deleteShift(String ma_ca) async {
    Map data = {
      "MaCa": ma_ca,
    };

    String body = json.encode(data);

    try {
      return await dio
          .delete('$baseUrl/delete-shift', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Xoá thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Xoá không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get list config
  Future<List<ConfigModel>> getConfig() async {
    return await dio
        .get(
      '$baseUrl/get-config',
    )
        .then((response) {
      List<ConfigModel> userList = [];
      if (response.statusCode == 200) {
        for (var item in response.data) {
          userList.add(ConfigModel.fromJson(item));
        }
      }
      return userList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //get config client
  Future<List<ConfigModel>> getConfigClient(String MaGV) async {
    return await dio
        .get(
      '$baseUrl/get-config?MaGV=$MaGV',
    )
        .then((response) {
      List<ConfigModel> userList = [];
      if (response.statusCode == 200) {
        for (var item in response.data) {
          userList.add(ConfigModel.fromJson(item));
        }
      }
      return userList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //get config client mahocphan
  Future<List<ConfigModel>> getConfigMaHocPhanClient(
      String MaGV, String MaHocPhan) async {
    return await dio
        .get(
      '$baseUrl/get-config?MaGV=$MaGV&MaHocPhan=$MaHocPhan',
    )
        .then((response) {
      List<ConfigModel> userList = [];
      if (response.statusCode == 200) {
        for (var item in response.data) {
          userList.add(ConfigModel.fromJson(item));
        }
      }
      return userList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

// [ '"12huy", "1828384858", "1874802010012222", "1874802010012"' ]
// ['12huy','1828384858','1874802010012222','1874802010012','18748020100122221']
  //create config
  Future<void> createConfig(
    String magv,
    String maphong,
    String madv,
    String maca,
    String mahocphan,
    List<String> masv,
  ) async {
    List<String> stringList = [...masv.map((number) => number.toString())];
    print('HoangNH: $stringList');
    Map data = {
      "MaGV": magv,
      "MaPhong": maphong,
      "MaDV": madv,
      "MaCa": maca,
      "MaHocPhan": mahocphan,
      "MaSV": stringList,
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/create-config', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //create attendance
  Future<void> createAttendance(
    String magv,
    String mahocphan,
    String maphong,
    List<dynamic> diemdanh,
    String tenhocphan,
  ) async {
    Map data = {
      "MaGV": magv,
      "MaHocPhan": mahocphan,
      "MaPhong": maphong,
      "DiemDanh": diemdanh,
      "TenHocPhan": tenhocphan,
    };

    String body = json.encode(data);

    try {
      return await dio
          .post('$baseUrl/create-attendance', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get list config
  Future<void> permission(
    String magv,
  ) async {
    Map data = {
      "email": '${magv}@gmail.com',
      "password": '123456',
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/signup', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      // Get.snackbar(
      //   'Thêm mới không thành công'
      //   , '',backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //create point
  Future<void> createPoint(
    String ma_giang_vien,
    String ma_sinh_vien,
    String diem_chuyen_can,
    String diem_giua_ki,
    String diem_cuoi_ki,
    String diem_trung_binh,
  ) async {
    Map data = {
      "magv": ma_giang_vien,
      "masv": ma_sinh_vien,
      "DiemChuyenCan": diem_chuyen_can,
      "DiemGiuaKi": diem_giua_ki,
      "DiemCuoiKi": diem_cuoi_ki,
      "DiemTrungBinh": diem_trung_binh,
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/create-point', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //sum avarage
  Future<void> sumAravage(
    String ma_giang_vien,
  ) async {
    Map data = {
      "magv": ma_giang_vien,
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/sum-avarage', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //delete student
  Future<void> deleteStudent(String ma_giang_vien, String ma_sinh_vien) async {
    Map data = {"magv": ma_giang_vien, "masv": ma_sinh_vien};

    String body = json.encode(data);

    try {
      return await dio
          .delete('$baseUrl/delete-student', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get food
  Future<List<FoodModel>> getFood() async {
    return await dio
        .get(
      '$baseUrl/get-food',
    )
        .then((response) {
      List<FoodModel> foodList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          foodList.add(FoodModel.fromJson(item));
        }
      }
      return foodList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //create department
  Future<void> createFood(
    String ma_mon,
    String ten_mon_an,
    String calo,
    String khoi_luong,
    String chi_tiet,
    String hinh_anh,
    String type,
  ) async {
    Map data = {
      "ma_mon": ma_mon,
      "ten_mon_an": ten_mon_an,
      "calo": calo,
      "khoi_luong": khoi_luong,
      "chi_tiet": chi_tiet,
      "hinh_anh": hinh_anh,
      "type": type
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/create-food', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  Future<void> updateFood(
    String ma_mon,
    String ten_mon_an,
    String calo,
    String khoi_luong,
    String chi_tiet,
    String type,
  ) async {
    Map data = {
      "ma_mon": ma_mon,
      "ten_mon_an": ten_mon_an,
      "calo": calo,
      "khoi_luong": khoi_luong,
      "chi_tiet": chi_tiet,
      "type": type
    };

    String body = json.encode(data);

    try {
      return await dio.patch('$baseUrl/update-food', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //xoa food
  Future<void> deleteFood(String ma_mon) async {
    Map data = {
      "ma_mon": ma_mon,
    };

    String body = json.encode(data);

    try {
      return await dio.delete('$baseUrl/delete-food', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Xoá thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Xoá không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //order food

  Future<void> createOrderFood(String MaGV, String maMon, String tenMonAn,
      int so_luong, String url, String thoiGian) async {
    Map data = {
      "MaGV": MaGV,
      "maMon": maMon,
      "tenMonAn": tenMonAn,
      "soLuong": so_luong.toString(),
      "url": url,
      "thoiGian": thoiGian,
    };

    String body = json.encode(data);

    try {
      return await dio
          .post('$baseUrl/create-orderFood', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Đặt món thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Đặt món không thành công', '', backgroundColor: error);
    }
  }

  Future<List<orderFoodModel>> getOrderfood() async {
    return await dio
        .get(
      '$baseUrl/get-orderFood',
    )
        .then((response) {
      List<orderFoodModel> orderFoodList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          orderFoodList.add(orderFoodModel.fromJson(item));
        }
      }
      return orderFoodList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //get food
  Future<List<Attendance>> getAttendance(String MaGV, String MaHocPhan) async {
    return await dio
        .get(
      '$baseUrl/get-attendance?MaGV=$MaGV&MaHocPhan=$MaHocPhan',
    )
        .then((response) {
      List<Attendance> attendanceList = [];
      if (response.statusCode == 200) {
        for (var item in response.data) {
          attendanceList.add(Attendance.fromJson(item));
        }
      }
      return attendanceList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  //create author
  Future<void> authorPermission(
      String ma_giang_vien, String role, List listAuthor) async {
    String resultAuthor = listAuthor.join(',');
    Map data = {
      "email": ma_giang_vien,
      "role": role,
      "authorcation": resultAuthor,
    };

    String body = json.encode(data);

    try {
      return await dio
          .post('$baseUrl/create-authorcation', data: body)
          .then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //note
  Future<List<NoteRequestModel>> getNote(String MaGV) async {
    return await dio
        .get(
      '$baseUrl/get-note?MaGV=$MaGV',
    )
        .then((response) {
      List<NoteRequestModel> noteRequestList = [];
      if (response.statusCode == 201) {
        print(response.data);
        for (var item in response.data) {
          noteRequestList.add(NoteRequestModel.fromJson(item));
        }
      }
      return noteRequestList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  Future<List<NoteRequestModel>> getNoteAdmin() async {
    return await dio
        .get(
      '$baseUrl/get-note',
    )
        .then((response) {
      List<NoteRequestModel> noteRequestList = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          noteRequestList.add(NoteRequestModel.fromJson(item));
        }
      }
      return noteRequestList;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  Future<void> createNoteClient(String status, String type, String time,
      String MaGV, String description) async {
    Map data = {
      "Type": type,
      "ThoiGian": time,
      "MaGV": MaGV,
      "Mota": description,
      "Status": status
    };

    String body = json.encode(data);

    try {
      return await dio.post('$baseUrl/create-note', data: body).then((value) {
        if (value.statusCode == 201) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }

  Future<void> NoteReview(String status, String type, String time, String MaGV,
      String description) async {
    Map data = {
      "Type": type,
      "ThoiGian": time,
      "MaGV": MaGV,
      "Mota": description,
      "Status": status
    };

    String body = json.encode(data);

    try {
      return await dio.patch('$baseUrl/update-note', data: body).then((value) {
        if (value.statusCode == 200) {
          Get.snackbar('Thêm mới thành công', '', backgroundColor: succes);
        }
      });
    } catch (e) {
      Get.snackbar('Thêm mới không thành công', '', backgroundColor: error);
    }
  }


   //#--------------------------------------------------------------------------------------------------------------------------------------------//
  //note
  Future<List<AttendanceTeacher>> getAttendanceTeacher(String MaGV) async {
    return await dio
        .get(
      '$baseUrl/get-attendance-teacher?MaGV=$MaGV',
    )
        .then((response) {
      List<AttendanceTeacher> listAttendanceTeacher = [];
      if (response.statusCode == 201) {
        for (var item in response.data) {
          listAttendanceTeacher.add(AttendanceTeacher.fromJson(item));
        }
      }
      return listAttendanceTeacher;
    }).catchError((err) {
      print('HoangNH: ${err}');
    });
  }

  ApiClient._internal();
}
