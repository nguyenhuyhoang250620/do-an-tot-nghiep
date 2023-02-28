import 'package:flutter/material.dart';

class SettingsManagement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SettingsState();
  }
}
class SettingsState extends State<SettingsManagement>{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings'),
    );
  }

}