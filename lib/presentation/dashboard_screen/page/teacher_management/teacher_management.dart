import 'package:flutter/material.dart';

class TeacherManagement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StudentState();
  }
}
class StudentState extends State<TeacherManagement>{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Teacher management"),);
  }

}
