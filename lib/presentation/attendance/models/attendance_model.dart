class AttendanceModel {
  final int? id;
  final String? soCmt;
  final String? image;
  final String? thoiGianXuatHien;
  final int? cameraId;

  AttendanceModel(
      {this.id, this.soCmt, this.image, this.thoiGianXuatHien, this.cameraId});
  factory AttendanceModel.fromJson(Map<String, dynamic> json) {
    return AttendanceModel(
        id: json['id'] ?? -1,
        soCmt: json['soCmt'] ?? "",
        image: json['image'] ?? "",
        thoiGianXuatHien: json['thoiGianXuatHien'] ?? "",
        cameraId: json['camera_model'] ?? -1);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "soCmt": soCmt,
        "image": image,
        "thoiGianXuatHien": thoiGianXuatHien,
        "camera_model": cameraId
      };
}
