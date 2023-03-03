class SubjectModel {
  String? id;
  String? MaPhong;
  String? TenPhong;
  String? Mota;
  String? TenMayQuet;

  SubjectModel(
      {this.id, this.MaPhong, this.TenPhong, this.Mota,this.TenMayQuet});
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
        id: json['id'] ?? "",
        MaPhong: json['MaPhong'] ?? "",
        TenPhong: json['TenPhong'] ?? "",
        Mota: json['Mota'] ?? "",
        TenMayQuet: json['TenMayQuet'] ?? "",
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "MaPhong": MaPhong,
        "TenPhong": TenPhong,
        "Mota": Mota,
        "TenMayQuet": TenMayQuet,
      };
}
