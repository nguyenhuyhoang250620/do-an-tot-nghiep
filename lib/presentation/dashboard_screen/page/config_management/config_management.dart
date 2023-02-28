import 'package:flutter/material.dart';

class ConfigManagement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ConfigState();
  }
}
class ConfigState extends State<ConfigManagement>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Cấu hình hệ thống điểm danh"),
    );
  }

}