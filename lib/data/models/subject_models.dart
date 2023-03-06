class SubjectModel {
  String? id;
  String? MaHocPhan;
  String? TenHocPhan;
  String? KiThu;
  String? SotinChi;
  String? TongSoTiet;
  String? KhoiKienThuc;
  String? DKTQ;
  String? MoTa;

  SubjectModel(
      {this.id, this.MaHocPhan, this.TenHocPhan, this.KiThu,this.SotinChi,this.TongSoTiet,this.KhoiKienThuc,this.DKTQ,this.MoTa});
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
        id: json['id'] ?? "",
        MaHocPhan: json['MaHocPhan'] ?? "",
        TenHocPhan: json['TenHocPhan'] ?? "",
        KiThu: json['KiThu'] ?? "",
        SotinChi: json['SotinChi'] ?? "",
        TongSoTiet: json['TongSoTiet'] ?? "",
        KhoiKienThuc: json['KhoiKienThuc'] ?? "",
        DKTQ: json['DKTQ'] ?? "",
        MoTa: json['MoTa'] ?? "",
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "KhoiKienThuc" : KhoiKienThuc,
        "MaHocPhan":MaHocPhan,
        "TenHocPhan":TenHocPhan,
        "KiThu":KiThu,
        "SotinChi":SotinChi,
        "TongSoTiet":TongSoTiet,
        "DKTQ":DKTQ,
        "MoTa":MoTa
      };
}
