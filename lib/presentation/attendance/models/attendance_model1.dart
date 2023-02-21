class AttendanceModel1 {
  final int? id;
  final int? employeeId;
  final String? date;
  final String? firstIn;
  final String? lastOut;
  final String? totalHours;
  final String? payableHours;
  final String? overtimeDeviation;
  final String? status;
  final String? shift;
  final String? currentImage;
  AttendanceModel1(
      {this.id,
      this.employeeId,
      this.date,
      this.firstIn,
      this.lastOut,
      this.totalHours,
      this.payableHours,
      this.overtimeDeviation,
      this.status,
      this.shift,
      this.currentImage});
  factory AttendanceModel1.fromJson(Map<String, dynamic> json) {
    return AttendanceModel1(
        id: json['id'] ?? -1,
        employeeId: json['employeeId'] ?? -1,
        date: json['date'] ?? "",
        firstIn: json['firstIn'] ?? "",
        lastOut: json['lastOut'] ?? "",
        totalHours: json['totalHours'] ?? "",
        payableHours: json['payableHours'] ?? "",
        overtimeDeviation: json['overtimeDeviation'] ?? "",
        status: json['status'] ?? "",
        shift: json['shift'] ?? "",
        currentImage: json['currentImage'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "employeeId": employeeId,
        "date": date,
        "firstIn": firstIn,
        "lastOut": lastOut,
        "totalHours": totalHours,
        "payableHours": payableHours,
        "overtimeDeviation": overtimeDeviation,
        "status": status,
        "shift": shift,
        "currentImage": currentImage
      };
}
