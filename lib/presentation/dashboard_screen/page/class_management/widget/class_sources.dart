import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClassDataTableSource extends DataTableSource {
  List<Map<String, dynamic>> data = [
    {'name': 'Alice', 'age': 25, 'gender': 'Female'},
    {'name': 'Bob', 'age': 30, 'gender': 'Male'},
    {'name': 'Charlie', 'age': 35, 'gender': 'Male'},
    {'name': 'David', 'age': 40, 'gender': 'Male'},
    {'name': 'Eve', 'age': 45, 'gender': 'Female'},
    {'name': 'Frank', 'age': 50, 'gender': 'Male'},
  ];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Map<String, dynamic> row = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(row['name'].toString())),
        DataCell(Text(row['age'].toString())),
        DataCell(Text(row['gender'].toString())),
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