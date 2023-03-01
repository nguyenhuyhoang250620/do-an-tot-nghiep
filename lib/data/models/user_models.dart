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


  UserModel(
      {this.id, this.NamSinh, this.CCCD, this.Email, this.SoDT, this.TenSV,this.GioiTinh,this.Khoa,this.MaSV});
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
        "Khoa": Khoa
      };
}
