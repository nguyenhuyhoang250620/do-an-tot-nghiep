class Department {
  // "id": 0,
  // "name": "AI & Platform",
  // "mailAlias": "@cerberus.com.vn",
  // "departmentLead": "nam.le",
  // "parentDepartment": "R&D"

  final int id;
  final String name;
  final String mailAlias;
  final String departmentLead;
  final String parentDepartment;

  Department(this.id, this.name, this.mailAlias, this.departmentLead, this.parentDepartment);

  //from json
  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(json['id'], json['name'], json['mailAlias'], json['departmentLead'], json['parentDepartment']);
  }
  //to json
  Map<String, dynamic> toJson() => {
    "id": id, 
    "name": name, 
    "mailAlias": mailAlias, 
    "departmentLead": departmentLead, 
    "parentDepartment": parentDepartment
    };
}
