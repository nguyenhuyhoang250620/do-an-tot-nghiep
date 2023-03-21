class UserModel {
  String? id;
  String? NamSinh;
  String? CCCD;
  String? Email;
  String? SoDT;
  String? TenSV;
  String? MaSV;
  String? GioiTinh;
  String? Khoa;
  String? url;
  String? dcc;
  String? dgk;
  String? dck;
  String? dtb;


  UserModel(
      {this.id, this.NamSinh, this.CCCD, this.Email, this.SoDT, this.TenSV,this.GioiTinh,this.Khoa,this.MaSV,this.url,this.dcc,this.dgk,this.dck,this.dtb});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'] ?? "",
        NamSinh: json['NamSinh'] ?? "",
        CCCD: json['CCCD'] ?? "",
        Email: json['Email'] ?? "",
        SoDT: json['SoDT'] ?? "",
        TenSV: json['TenSV'] ?? "",
        GioiTinh: json['GioiTinh'] ?? "",
        Khoa: json['Khoa'] ?? "",
        MaSV: json['MaSV'] ?? "",
        url: json['url'] ?? "",
        dcc: json['DiemChuyenCan'] ?? "",
        dgk: json['DiemGiuaKi'] ?? "",
        dck: json['DiemCuoiKi'] ?? "",
        dtb: json['DiemTrungBinh'] ?? "",
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "NamSinh": NamSinh,
        "CCCD": CCCD,
        "Email": Email,
        "SoDT": SoDT,
        "TenSV": TenSV,
        "MaSV": MaSV,
        "GioiTinh": GioiTinh,
        "Khoa": Khoa,
        "url":url,
        "DiemChuyenCan":dcc,
        "DiemGiuaKi":dgk,
        "DiemCuoiKi":dck,
        "DiemTrungBinh":dtb,
      };
}
