import 'package:get/get_rx/src/rx_types/rx_types.dart';

class TeacherAuthorModel {
  final String value;
  late  RxBool key;
  final String? ma_quyen;

  TeacherAuthorModel({required this.value, required this.key,this.ma_quyen});

  factory TeacherAuthorModel.fromJson(Map<String, dynamic> json) {
    return TeacherAuthorModel(
      value: json['value'],
      key: json['key'],
      ma_quyen: json['ma_quyen'],
    );
  }
}