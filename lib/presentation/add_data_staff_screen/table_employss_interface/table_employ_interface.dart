import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_data_table/web_data_table.dart';
import 'package:get/get.dart';

import '../controller/add_data_controller.dart';
import '../models/add_data_model.dart';




class TableEmployssInterface extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<TableEmployssInterface> {
  late String _sortColumnName;
  late bool _sortAscending;
  List<String>? _filterTexts;
  bool _willSearch = true;
  Timer? _timer;
  int? _latestTick;
  List<String> _selectedRowKeys = [];
  int _rowsPerPage = 10;
  final addDatacontroller = Get.find<AddDataController>();

  @override
  void initState() {
    super.initState();
    // print(addDatacontroller.data);
    _sortColumnName = 'id';
    _sortAscending = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (!_willSearch) {
        if (_latestTick != null && timer.tick > _latestTick!) {
          _willSearch = true;
        }
      }
      if (_willSearch) {
        _willSearch = false;
        _latestTick = null;
        setState(() {
          if (_filterTexts != null && _filterTexts!.isNotEmpty) {
            _filterTexts = _filterTexts;
            print('filterTexts = $_filterTexts');
          }
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _timer = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: WebDataTable(
              header: Text('Danh sách nhân viên'),
              actions: [
                if (_selectedRowKeys.isNotEmpty)
                SizedBox(
                    height: 50,
                    width: 100,
                    child: TextButton(
                      child: Text(
                        'Delete',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      onPressed: () {
                        print('Delete!');
                        setState(() {
                          print(_selectedRowKeys);
                          addDatacontroller.getdataemployee.removeAt(_selectedRowKeys.length);
                          _selectedRowKeys.clear();
                        });
                      },
                    ),
                  ),
                Container(
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Tìm kiếm nhân viên...',
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFCCCCCC),
                        ),
                      ),
                    ),
                    onChanged: (text) {
                      _filterTexts = text.trim().split(' ');
                      _willSearch = false;
                      _latestTick = _timer?.tick;
                    },
                  ),
                ),
              ],
              source: WebDataTableSource(
                sortColumnName: _sortColumnName,
                sortAscending: _sortAscending,
                filterTexts: _filterTexts,
                columns: [
                  WebDataColumn(
                    name: 'id',
                    label: const Text('id'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'nickName',
                    label: const Text('Nick name'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'fullName',
                    label: const Text('Full name'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'email',
                    label: const Text('Email'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'userFace',
                    label: const Text('User face'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                    name: 'department',
                    label: const Text('Department'),
                    dataCell: (value) => DataCell(Text('$value')),
                  ),
                  WebDataColumn(
                      name: 'dateOfBirth',
                      label: const Text('DateOfBirth'),
                       dataCell: (value) => DataCell(Text('$value')),
                      // dataCell: (value) {
                      //   if (value is DateTime) {
                      //     final text =
                      //         '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
                      //     return DataCell(Text(text));
                      //   }
                      //   return DataCell(Text(value.toString()));
                      // },
                      filterText: (value) {
                        if (value is DateTime) {
                          return '${value.year}/${value.month}/${value.day} ${value.hour}:${value.minute}:${value.second}';
                        }
                        return value.toString();
                      }),
                    WebDataColumn(
                      name: 'employeeStatus',
                      label: const Text('EmployeeStatus'),
                      dataCell: (value) => DataCell(Text('$value')),
                      sortable: false,
                    ),
                    WebDataColumn(
                      name: 'role',
                      label: const Text('Role'),
                      dataCell: (value) => DataCell(Text('$value')),
                      sortable: false,
                    ),
                ],
                rows: addDatacontroller.getdataemployee,
                selectedRowKeys: _selectedRowKeys,
                onTapRow: (rows, index) {
                  print('onTapRow(): index = $index, row = ${rows[index]}');
                },
                onSelectRows: (keys) {
                  print('onSelectRows(): count = ${keys.length} keys = $keys');
                  setState(() {
                    _selectedRowKeys = keys;
                  });
                },
                primaryKeyName: 'id',
              ),
              horizontalMargin: 100,
              onPageChanged: (offset) {
                print('onPageChanged(): offset = $offset');
              },
              onSort: (columnName, ascending) {
                print(
                    'onSort(): columnName = $columnName, ascending = $ascending');
                setState(() {
                  _sortColumnName = columnName;
                  _sortAscending = ascending;
                });
              },
              onRowsPerPageChanged: (rowsPerPage) {
                print('onRowsPerPageChanged(): rowsPerPage = $rowsPerPage');
                setState(() {
                  if (rowsPerPage != null) {
                    _rowsPerPage = rowsPerPage;
                  }
                });
              },
              rowsPerPage: _rowsPerPage,
            ),
          ),
        ),
      );
  }
}