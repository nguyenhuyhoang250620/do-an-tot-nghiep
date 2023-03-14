import 'package:do_an_tot_nghiep/data/models/class_models.dart';
import 'package:do_an_tot_nghiep/data/models/department_models.dart';
import 'package:do_an_tot_nghiep/data/models/shift_models.dart';
import 'package:do_an_tot_nghiep/data/models/subject_models.dart';
import 'package:do_an_tot_nghiep/data/models/teacher_models.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';

class ConfigModel {
  String id;
  ShiftModel maca;
  String tenGV;
  String email;
  SubjectModel mahocphan;
  String maGV;
  String soDT;
  TeacherModel magv;
  String gioiTinh;
  ClassModel maphong;
  DepartmentModel madv;
  String namSinh;
  String chuyenNganh;
  String cccd;
  List<UserModel> danhsach;

  ConfigModel(
      {required this.id,
      required this.maca,
      required this.tenGV,
      required this.email,
      required this.mahocphan,
      required this.maGV,
      required this.soDT,
      required this.magv,
      required this.gioiTinh,
      required this.maphong,
      required this.madv,
      required this.namSinh,
      required this.chuyenNganh,
      required this.cccd,
      required this.danhsach});

  factory ConfigModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> danhsachJson = json['danhsach'];
    List<UserModel> danhsach = danhsachJson.map((e) => UserModel.fromJson(e)).toList();
    return ConfigModel(
        id: json['id'],
        maca: ShiftModel.fromJson(json['maca']),
        tenGV: json['TenGV'],
        email: json['Email'],
        mahocphan: SubjectModel.fromJson(json['mahocphan']),
        maGV: json['MaGV'],
        soDT: json['SoDT'],
        magv: TeacherModel.fromJson(json['magv']),
        gioiTinh: json['GioiTinh'],
        maphong: ClassModel.fromJson(json['maphong']),
        madv: DepartmentModel.fromJson(json['madv']),
        namSinh: json['NamSinh'],
        chuyenNganh: json['ChuyenNganh'],
        cccd: json['CCCD'],
        danhsach: danhsach);
  }
}



