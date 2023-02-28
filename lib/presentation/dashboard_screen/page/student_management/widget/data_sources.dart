import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DashboardDataSource extends DataTableSource {
  final Set<int> _selectedRows = <int>{};
  List<String> data = [];
  DashboardDataSource({required this.data});
  //TungVD: Add Selected Row
  void _handleSelected(int index, bool? selected) {
    if (selected == true) {
      _selectedRows.add(index);
    } else {
      _selectedRows.remove(index);
    }
    notifyListeners();
  }

  @override
  DataRow? getRow(int index) {
    return DataRow(
        // onSelectChanged: (bool? selected) => _handleSelected(index, selected),
        // selected: _selectedRows.contains(index),
        cells: [
          DataCell(buildLabel(data[index])),
          DataCell(buildLabel(data[index])),
          DataCell(buildLabel(data[index])),
          DataCell(buildLabel(data[index])),
          DataCell(buildLabel(data[index])),
          DataCell(buildLabel(data[index])),
        ]);
  }
  Widget buildLabel(String text) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
      ),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
