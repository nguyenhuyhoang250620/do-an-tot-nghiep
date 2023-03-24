class Attendance {
  String? id;
  String? maPhong;
  String? maHocPhan;
  String? maGV;
  String? tenHocPhan;
  List<AttendanceDetail> diemDanh;

  Attendance({
    this.id,
    this.maPhong,
    this.maHocPhan,
    this.maGV,
    this.tenHocPhan,
    required this.diemDanh,
  });

  factory Attendance.fromJson(Map<String, dynamic> json) {
    List<dynamic> danhsachJson = json['DiemDanh'];
    List<AttendanceDetail> diemDanh = danhsachJson.map((e) => AttendanceDetail.fromJson(e)).toList();
    return Attendance(
        id: json['id'],
        maPhong: json['MaPhong'],
        maHocPhan: json['MaHocPhan'],
        maGV: json['MaGV'],
        tenHocPhan: json['TenHocPhan'],
        diemDanh: diemDanh,
        );
  }
}

class AttendanceDetail {
  String? maSV;
  String? thoiGian;
  String? tenSV;

  AttendanceDetail({this.maSV, this.thoiGian, this.tenSV});

  AttendanceDetail.fromJson(Map<String, dynamic> json) {
    maSV = json['MaSV'];
    thoiGian = json['ThoiGian'];
    tenSV = json['TenSV'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['MaSV'] = this.maSV;
    data['ThoiGian'] = this.thoiGian;
    data['TenSV'] = this.tenSV;
    return data;
  }
}