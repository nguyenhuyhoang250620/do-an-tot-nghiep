class Attendance {
  //   "id": "8",
  //   "employeeId": "4",
  //   "date": "04-10-2022",
  //   "firstIn": "06-10-2022 8:50:13",
  //   "LastOut": "06-10-2022 16:50:13",
  //   "payableHours": "8.0",
  //   "overtimeDeviation": "1.0",
  //   "status": "Active",
  //   "shift": "Fulltime",
  //   "currentImage":"data/images/hanh.luu.jpg"

  final int id;
  final int employeeId;
  final String date;
  final String firstIn;
  final String lastOut;
  final String totalHours;
  final String payableHours;
  final String overtimeDeviation;
  final String status;
  final String shift;
  final String currentImage;

  Attendance(
      this.id, this.employeeId, this.date, this.firstIn, this.lastOut, this.totalHours, this.payableHours, this.overtimeDeviation, this.status, this.shift, this.currentImage);

  //from json
  factory Attendance.fromJson(Map<String, dynamic> json) {
    return Attendance(json['id'], json['employeeId'], json['date'], json['firstIn'], json['lastOut'], json['totalHours'], json['payableHours'], json['overtimeDeviation'],
        json['status'], json['shift'], json['currentImage']);
  }
  //to json
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
