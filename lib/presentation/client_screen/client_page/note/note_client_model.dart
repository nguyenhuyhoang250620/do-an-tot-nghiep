class NoteClientModel {
  final String key;
  final String value;

  NoteClientModel({required this.key, required this.value});

  factory NoteClientModel.fromJson(Map<String, dynamic> json) {
    return NoteClientModel(
      key: json['key'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
    'key': key,
    'value': value,
  };
}