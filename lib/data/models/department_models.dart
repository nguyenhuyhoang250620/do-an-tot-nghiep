class DepartmentModel {
  String? id;
  String? TenDV;
  String? MaDV;
  String? Mota;

  DepartmentModel(
      {this.id, this.TenDV, this.MaDV, this.Mota,});
  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
        id: json['id'] ?? "",
        TenDV: json['TenDV'] ?? "",
        MaDV: json['MaDV'] ?? "",
        Mota: json['Mota'] ?? "",
        );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "TenDV": TenDV,
        "MaDV": MaDV,
        "Mota": Mota,
      };
}
