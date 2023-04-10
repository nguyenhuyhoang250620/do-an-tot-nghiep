class TimeCheck {
  final String checkIn;
  final String checkOut;

  TimeCheck({required this.checkIn, required this.checkOut});

  factory TimeCheck.fromJson(Map<String, dynamic> json) {
    return TimeCheck(
      checkIn: json['CheckIn'],
      checkOut: json['CheckOut'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CheckIn'] = this.checkIn;
    data['CheckOut'] = this.checkOut;
    return data;
  }
}