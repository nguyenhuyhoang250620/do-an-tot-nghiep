class EmployeeModel {
  final int? id;
  final String? nickName;
  final String? fullName;
  final String? email;
  final String? userFace;
  final String? dateOfBirth;
  final int? department;
  final String? employeeStatus;
  final String? role;
  final String? password;
  EmployeeModel(
      {this.id, this.nickName, this.fullName, this.email, this.userFace, this.dateOfBirth, this.department, this.employeeStatus, this.role, this.password});
  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
        id: json['id'] ?? -1,
        nickName: json['nickName'] ?? "",
        fullName: json['fullName'] ?? "",
        email: json['email'] ?? "",
        userFace: json['userFace'] ?? "",
        dateOfBirth: json['dateOfBirth'] ?? "",
        department: json['department'] ?? -1,
        employeeStatus: json['employeeStatus'] ?? "",
        role: json['role'] ?? "",
        password: json['password'] ?? "");
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickName": nickName,
        "mailAlias": fullName,
        "email": email,
        "userFace": userFace,
        "dateOfBirth": dateOfBirth,
        "department": department,
        "employeeStatus": employeeStatus,
        "role": role,
        "password": password
      };
}
