import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StudentDataTableSource extends DataTableSource {
  StudentDataTableSource({required this.data});
  List<Map<String, dynamic>> data = [];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Map<String, dynamic> row = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(label(row['TenSV'].toString())),
        DataCell(label(row['MaSV'].toString())),
        DataCell(label(row['Khoa'].toString())),
        DataCell(label(row['Email'].toString())),
        DataCell(label(row['CCCD'].toString())),
        DataCell(buildActive('test')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => _selectedCount;

  // void sort<T>(Comparable<T> Function(Map<String, dynamic> d) getField, bool ascending) {
  //   data.sort((a, b) {
  //     final aValue = getField(a);
  //     final bValue = getField(b);
  //     return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
  //   });
  //   notifyListeners();
  // }

  // void selectAll(bool isAllChecked) {
  //   _selectedCount = isAllChecked ? data.length : 0;
  //   notifyListeners();
  // }

  // void onSelectRow(int index, bool isSelected) {
  //   if (isSelected) {
  //     _selectedCount += 1;
  //   } else {
  //     _selectedCount -= 1;
  //   }
  //   notifyListeners();
  // }
}
Widget label(String text){
  return Center(
    child: Text(text,style: AppStyle.txtInterRegular12.copyWith(color: Colors.black,fontSize: 12),),
  );
}
  Widget buildActive(String text) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(Icons.delete),
          Icon(Icons.delete),
          Icon(Icons.delete),
        ],
      )
    );
  }