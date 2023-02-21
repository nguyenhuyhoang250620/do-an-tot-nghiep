class Employee {
  // "id": 0,
  // "nickName": "tung.vu",
  // "fullName": "Vũ Đình Tùng",
  // "email": "tung.vu@cerberus.com.vn",
  // "userFace": "data/images/hanh.luu.jpg",
  // "dateOfBirth": "16/07/1997",
  // "department": 0,
  // "employeeStatus": "Active",
  // "role": "admin"
   Employee(
    this.id, 
    this.nickName, 
    this.fullName, 
    this.email, 
    this.userFace, 
    this.dateOfBirth, 
    this.department, 
    this.employeeStatus, 
    this.role, 
    this.password
    );
  final int id;
  final String nickName;
  final String fullName;
  final String email;
  final String userFace;
  final String dateOfBirth;
  final int department;
  final String employeeStatus;
  final String role;
  final String password;
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      json['id'], 
      json['nickName'], 
      json['fullName'], 
      json['email'], 
      json['userFace'], 
      json['dateOfBirth'], 
      json['department'], 
      json['employeeStatus'], 
      json['role'],
      json['password']);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nickName": nickName,
        "fullName": fullName,
        "email": email,
        "userFace": userFace,
        "dateOfBirth": dateOfBirth,
        "department": department,
        "employeeStatus": employeeStatus,
        "role": role,
        "password": password
      };
}
