class ClassModel {
  String? id;
  String? TenMayQuet;
  String? Mota;
  String? MaPhong;
  String? TenPhong;

  ClassModel(
      {this.id, this.TenMayQuet, this.Mota, this.MaPhong,this.TenPhong});
  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
        id: json['id'] ?? "",
        TenMayQuet: json['TenMayQuet'] ?? "",
        Mota: json['Mota'] ?? "",
        MaPhong: json['MaPhong'] ?? "",
        TenPhong: json['TenPhong'] ?? "",
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "TenMayQuet": TenMayQuet,
        "Mota": Mota,
        "MaPhong": MaPhong,
        "TenPhong": TenPhong,
      };
}
