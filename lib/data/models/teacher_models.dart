class TeacherModel {
  String? id;
  String? NamSinh;
  String? CCCD;
  String? Email;
  String? SoDT;
  String? TenGV;
  String? MaGV;
  String? GioiTinh;
  String? ChuyenNganh;
  String? url;
  String? author;


  TeacherModel(
      {this.id, this.NamSinh, this.CCCD, this.Email, this.SoDT, this.TenGV,this.GioiTinh,this.ChuyenNganh,this.MaGV,this.url,this.author});
  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
        id: json['id'] ?? "",
        NamSinh: json['NamSinh'] ?? "",
        CCCD: json['CCCD'] ?? "",
        Email: json['Email'] ?? "",
        SoDT: json['SoDT'] ?? "",
        TenGV: json['TenGV'] ?? "",
        GioiTinh: json['GioiTinh'] ?? "",
        ChuyenNganh: json['ChuyenNganh'] ?? "",
        MaGV: json['MaGV'] ?? "",
        url: json['url'] ?? "",  
        author: json['author'] ?? "",  
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "NamSinh": NamSinh,
        "CCCD": CCCD,
        "Email": Email,
        "SoDT": SoDT,
        "TenGV": TenGV,
        "MaGV": MaGV,
        "GioiTinh": GioiTinh,
        "ChuyenNganh": ChuyenNganh,
        "url": url,
        "author": author,
      };
}
