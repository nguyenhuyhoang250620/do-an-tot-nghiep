import 'dart:convert';
import 'dart:math';
import 'package:flutter/widgets.dart';
import 'dart:async';
import '../../home_screen/models/department.dart';
import '../../home_screen/models/employees.dart';
import '../models/add_data_model.dart';
import '/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddDataController extends GetxController {
  TextEditingController employeeID = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController dateofbirth = TextEditingController();
  TextEditingController department = TextEditingController();
  TextEditingController employessStatus = TextEditingController();
  TextEditingController role = TextEditingController();

  TextEditingController idDep = TextEditingController();
  TextEditingController nameDep = TextEditingController();
  TextEditingController mailAliasDep = TextEditingController();
  TextEditingController departmentLeadDep = TextEditingController();
  TextEditingController parentDepartmentDep = TextEditingController();
  var useface= "".obs;
  final ImagePicker picker = ImagePicker();
  Uint8List? image;
  XFile? pickedFile;
  final _isLoading = true.obs;
  final RxList<Employee> _employeeEventList = <Employee>[].obs;
  RxList<Employee> get employeeEventList => _employeeEventList;
  List<Map<String, dynamic>> dataemployee =<Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get getdataemployee => dataemployee;

  final RxList<Department> _departmentEventList = <Department>[].obs;
  RxList<Department> get departmentEventList => _departmentEventList;
  List<Map<String, dynamic>> datadepartment =<Map<String, dynamic>>[].obs;
  List<Map<String, dynamic>> get getdatadepartment => datadepartment;

  bool? check_full_validator = false;


  @override
  void onReady() {
    getCCTVStaffListFromLocalFile();
    getCCTVDepartmentListFromLocalFile();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
    Future<void> getCCTVStaffListFromLocalFile() async {
      final String response = await rootBundle.loadString('data/employee.json');
      final data = await json.decode(response);
      _employeeEventList.value =
          (data as List).map((e) => Employee.fromJson(e)).toList(); 
      _employeeEventList.map((element){
        dataemployee.add({
            "id": element.id,
            "nickName": element.nickName,
            "fullName": element.fullName,
            "email": element.email,
            "userFace": element.userFace,
            "dateOfBirth": element.dateOfBirth,
            "department": element.department,
            "employeeStatus": element.employeeStatus,
            "role": element.role,
            "password": element.password
        });
      }).toList();
      // print(departmentEventList.length+1);
      employeeID.text="${employeeEventList.length+1}";
      _isLoading.value = false;
    }
    Future<void> getCCTVDepartmentListFromLocalFile() async {
      final String response = await rootBundle.loadString('data/department.json');
      final data = await json.decode(response);
      _departmentEventList.value =
          (data as List).map((e) => Department.fromJson(e)).toList(); 
      _departmentEventList.map((element){
        datadepartment.add({
              "id": element.id, 
              "name": element.name, 
              "mailAlias": element.mailAlias, 
              "departmentLead": element.departmentLead, 
              "parentDepartment": element.parentDepartment
        });
      }).toList();
      // print(dataemployee);
      _isLoading.value = false;
    }
   Future<void> pickFileWeb() async {
    var getImage =  await ImagePicker().pickImage(source: ImageSource.gallery);
    pickedFile = getImage;
    useface.value = pickedFile!.path;
  }

  void catureImage(String path) {
    useface.value = path;
  }

  void SaveInformationStaff(){
    print("luu");
    if(fullname.text!="" && nickname.text!="" && password.text!="" && email.text!="" && dateofbirth.text!="" && department !="" && employessStatus !="" && role !=""){
      dataemployee.add({
          "id":employeeID.text,
          "nickName": nickname.text,
          "fullName": fullname.text,
          "email": email.text,
          "userFace": useface.value,
          "dateOfBirth": dateofbirth.text,
          "department": department.text,
          "employeeStatus": employessStatus.text,
          "role": role.text,
          "password": password.text
      });
      Get.toNamed(AppRoutes.employeeInterface);
      check_full_validator=true;
    }
    else{
      print("Cần nhập thêm");
    }
  }
    void SaveInformationDepartment(){
    print("luu");
    datadepartment.add({
      "id": idDep.text, 
      "name": nameDep.text, 
      "mailAlias": mailAliasDep.text, 
      "departmentLead": department.text, 
      "parentDepartment": parentDepartmentDep.text
    });
  }
}
