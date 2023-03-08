import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';

class CusstomActiveTable extends StatelessWidget{
  CusstomActiveTable({
    this.onDelete,
    this.onUpdate,
    this.onView,
    this.showView,
  });
  final VoidCallback? onView;
  final VoidCallback? onUpdate;
  final VoidCallback? onDelete;
  bool? showView = true;
  @override
  Widget build(BuildContext context) {
    return  showView!?Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: green
            ),
            child: Padding(
              padding: EdgeInsets.all(appPadding*0.2),
              child: IconButton(
                tooltip: 'Xem chi tiết',
                onPressed: onView,
                icon: Icon(Icons.account_box),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: blue
            ),
            child: Padding(
              padding: EdgeInsets.all(appPadding*0.2),
              child: IconButton(
                tooltip: 'Chỉnh sửa',
                onPressed: onUpdate,
                icon: Icon(Icons.border_color_outlined),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: red
            ),
            child: Padding(
              padding: EdgeInsets.all(appPadding*0.2),
              child: IconButton(
                tooltip: 'Xoá',
                onPressed: onDelete,
                icon: Icon(Icons.delete),
              ),
            ),
          ),
        ],
      ):Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: blue
            ),
            child: Padding(
              padding: EdgeInsets.all(appPadding*0.2),
              child: IconButton(
                tooltip: 'Chỉnh sửa',
                onPressed: onUpdate,
                icon: Icon(Icons.border_color_outlined),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: red
            ),
            child: Padding(
              padding: EdgeInsets.all(appPadding*0.2),
              child: IconButton(
                tooltip: 'Xoá',
                onPressed: onDelete,
                icon: Icon(Icons.delete),
              ),
            ),
          ),
        ],
      );
  }

}