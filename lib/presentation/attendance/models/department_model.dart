class DepartmentModel {
  final int? id;
  final String? name;
  final String? mailAlias;
  final String? departmentLead;
  final String? parentDepartment;

  DepartmentModel({this.id, this.name, this.mailAlias, this.departmentLead, this.parentDepartment});
  factory DepartmentModel.fromJson(Map<String, dynamic> json) {
    return DepartmentModel(
        id: json['id'] ?? -1,
        name: json['name'] ?? "",
        mailAlias: json['mailAlias'] ?? "",
        departmentLead: json['departmentLead'] ?? "",
        parentDepartment: json['parentDepartment'] ?? "");
  }

  Map<String, dynamic> toJson() => {"id": id, "name": name, "mailAlias": mailAlias, "departmentLead": departmentLead, "parentDepartment": parentDepartment};
}
