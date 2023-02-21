// class AddData {
//   List<Map<String, dynamic>> get data =>
//       sampleDataRows.map((row) => row.values).toList();

//   final List<AddDataModel> sampleDataRows = [
//     AddDataModel.fromList([
//         0,
//         "tung.vu",
//         "Vũ Đình Tùng",
//         "tung.vu@cerberus.com.vn",
//         "data/images/hanh.luu.jpg",
//         0,
//         "admin",
//         "Active",
//         "2020-10-10 13:30:30"
//     ]),

//   ];
// }
// class AddDataModel {
//   AddDataModel({
//     required this.id, 
//     required this.nickName, 
//     required this.fullName, 
//     required this.email, 
//     required this.userFace, 
//     required this.dateOfBirth, 
//     required this.department, 
//     required this.employeeStatus, 
//     required this.role, 
//   });

//   factory AddDataModel.fromList(List<dynamic> values) {
//     return AddDataModel(
//       id: values[0],
//       nickName: values[1],
//       fullName: values[2],
//       email: values[3],
//       userFace: values[4],
//       department: values[5],
//       employeeStatus: values[6],
//       role: values[7],
//       dateOfBirth: values[8],
//     );
//   }

//   final int id;
//   final String nickName;
//   final String fullName;
//   final String email;
//   final String userFace;
//   final String dateOfBirth;
//   final int department;
//   final String employeeStatus;
//   final String role;

//   Map<String, dynamic> get values {
//     return {
//         "id": id,
//         "nickName": nickName,
//         "fullName": fullName,
//         "email": email,
//         "userFace": userFace,
//         "dateOfBirth": dateOfBirth,
//         "department": department,
//         "employeeStatus": employeeStatus,
//         "role": role,
//     };
//   }
// }
