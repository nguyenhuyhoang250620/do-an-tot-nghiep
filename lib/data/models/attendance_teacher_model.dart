class TimeTeacher {
  String? CheckIn;
  TimeTeacher({this.CheckIn});
  factory TimeTeacher.fromJson(Map<String, dynamic> json) {
    return TimeTeacher(
      CheckIn: json['CheckIn']?? "",
    );
  }
}

class AttendanceTeacher {
  String? MaPhong;
  String? ThoiGian;
  String? MaHocPhan;
  String? MaGV;
  List<TimeTeacher>? DiemDanh;

  AttendanceTeacher({
    this.MaPhong,
    this.ThoiGian,
    this.MaHocPhan,
    this.MaGV,
    this.DiemDanh,
  });

  factory AttendanceTeacher.fromJson(Map<String, dynamic> json) {
    List<dynamic> danhsachJson = json['DiemDanh'];
    List<TimeTeacher> DiemDanh = danhsachJson.map((e) => TimeTeacher.fromJson(e)).toList();
    return AttendanceTeacher(
      MaPhong: json['MaPhong'],
      ThoiGian: json['ThoiGian'],
      MaHocPhan: json['MaHocPhan'],
      MaGV: json['MaGV'],
      DiemDanh: DiemDanh,
    );
  }
}