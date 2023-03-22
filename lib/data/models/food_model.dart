import 'package:get/get.dart';

class FoodModel {
  final String id;
  final String maMon;
  final String khoiLuong;
  final String chiTiet;
  final String tenMonAn;
  final String type;
  final String calo;
  final String? url;
  final RxInt? so_luong;
  FoodModel({
    required this.id,
    required this.maMon,
    required this.khoiLuong,
    required this.chiTiet,
    required this.tenMonAn,
    required this.type,
    required this.calo,
    this.url,
    this.so_luong
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      id: json['id'],
      maMon: json['ma_mon'],
      khoiLuong: json['khoi_luong'],
      chiTiet: json['chi_tiet'],
      tenMonAn: json['ten_mon_an'],
      type: json['type'],
      calo: json['calo'],
      url: json['url'],
      so_luong: json['so_luong'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ma_mon': maMon,
      'khoi_luong': khoiLuong,
      'chi_tiet': chiTiet,
      'ten_mon_an': tenMonAn,
      'type': type,
      'calo': calo,
      'url': url,
      'so_luong': so_luong,
    };
  }
}