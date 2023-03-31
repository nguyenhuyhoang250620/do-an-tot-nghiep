class NoteRequestModel {
  final String? id;
  final String? status;
  final String? type;
  final String? teacherName;
  final String? time;
  final String? teacherCode;
  final String? description;

  NoteRequestModel({
     this.id,
     this.status,
     this.type,
     this.teacherName,
     this.time,
     this.teacherCode,
     this.description,
  });

  factory NoteRequestModel.fromJson(Map<String, dynamic> json) {
    return NoteRequestModel(
      id: json['id'],
      status: json['Status'],
      type: json['Type'],
      teacherName: json['TenGV'],
      time: json['ThoiGian'],
      teacherCode: json['MaGV'],
      description: json['Mota'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Status': status,
      'Type': type,
      'TenGV': teacherName,
      'ThoiGian': time,
      'MaGV': teacherCode,
      'Mota': description,
    };
  }
}