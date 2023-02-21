import 'package:flutter/material.dart';
import 'package:get/get.dart';


class AttendanceFooter extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: Get.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("Ngay"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("Gio")))
          ],)),
           Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("Ngay"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("Gio")))
          ],)),
           Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("hien dien"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("0 ngay")))
          ],)),
           Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("truc"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("0 ngay")))
          ],)),
           Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("nghi co luong"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("0 ngay")))
          ],)),
           Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("Ngay le"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("0 ngay")))
          ],)),
           Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("cuoi tuan"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("0 ngay")))
          ],)),
           Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("vang mat"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("0 ngay")))
          ],)),
           Expanded(flex:1,child: Column(children: [
            Expanded(child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("nghi khong luong"))),
            Expanded(child: Container(decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent)
              ),child: Text("0 ngay")))
          ],)),
          
        ],
      ),
    );
  }
}