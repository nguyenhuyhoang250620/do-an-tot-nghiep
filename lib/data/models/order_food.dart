class orderFoodModel {
  String id;
  String maMon;
  String maGV;
  String url;
  String tenMonAn;
  String soLuong;
  String thoiGian;

  orderFoodModel({
    required this.id,
    required this.maMon,
    required this.maGV,
    required this.url,
    required this.tenMonAn,
    required this.soLuong,
    required this.thoiGian,
  });

  factory orderFoodModel.fromJson(Map<String, dynamic> json) {
    return orderFoodModel(
      id: json['id'],
      maMon: json['maMon'],
      maGV: json['MaGV'],
      url: json['url'],
      tenMonAn: json['tenMonAn'],
      soLuong: json['soLuong'],
      thoiGian: json['thoiGian'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'maMon': maMon,
        'MaGV': maGV,
        'url': url,
        'tenMonAn': tenMonAn,
        'soLuong': soLuong,
        'thoiGian': thoiGian,
      };
}