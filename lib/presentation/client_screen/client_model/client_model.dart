class ClientModel {
  String? TenHocPhan;
  String? MaHocPhan;

  ClientModel(
      {this.TenHocPhan, this.MaHocPhan});
  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
        TenHocPhan: json['TenHocPhan'] ?? "",
        MaHocPhan: json['MaHocPhan'] ?? "",
        );
  }

  Map<String, dynamic> toJson() => {
        "TenHocPhan": TenHocPhan,
        "MaHocPhan": MaHocPhan,
      };
}
