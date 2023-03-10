class ShiftModel {
  String? id;
  String? TenCa;
  String? MaCa;
  String? ThoiGian;
  String? SoCa;
  String? Mota;

  ShiftModel(
      {this.id, this.TenCa, this.MaCa, this.Mota,this.SoCa,this.ThoiGian});
  factory ShiftModel.fromJson(Map<String, dynamic> json) {
    return ShiftModel(
        id: json['id'] ?? "",
        TenCa: json['TenCa'] ?? "",
        MaCa: json['MaCa'] ?? "",
        SoCa: json['SoCa'] ?? "",
        ThoiGian: json['ThoiGian'] ?? "",
        Mota: json['Mota'] ?? "",
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "TenCa": TenCa,
        "MaCa": MaCa,
        "SoCa": SoCa,
        "ThoiGian": ThoiGian,
        "Mota": Mota,
      };
}
