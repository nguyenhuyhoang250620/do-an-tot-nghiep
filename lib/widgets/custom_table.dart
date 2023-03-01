import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';

import '../libary/data_table_2/src/paginated_data_table_2.dart';

class MyPaginatedDataTable extends StatefulWidget {
  final List<DataColumn> columns;
  final DataTableSource source;
  final int rowsPerPage;

  const MyPaginatedDataTable({
    Key? key,
    required this.columns,
    required this.source,
    required this.rowsPerPage,
  }) : super(key: key);

  @override
  _MyPaginatedDataTableState createState() => _MyPaginatedDataTableState();
}
class _MyPaginatedDataTableState extends State<MyPaginatedDataTable> {
  final _paginatorController = PaginatorController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorItem,
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: PaginatedDataTable2(
        // showCheckboxColumn: true,
        colorFirstLastButtons: Colors.black,
        colorNextPreviousButtons: Colors.black,
        footerTextStyle: TextStyle(fontSize: 14,color: Colors.black),
        checkboxHorizontalMargin: 0,
        horizontalMargin: 20,
        minWidth: 1200,
        source: widget.source,
        border: TableBorder.all(color: Colors.black.withOpacity(0.3)),
        headingRowHeight: 55,
        dataRowHeight: 55,
        rowsPerPage: widget.rowsPerPage,
        controller: _paginatorController,
        wrapInCard: false,
        autoRowsToHeight: true,
        showFirstLastButtons: true,
        hidePaginator: false,
        empty: Center(child: Container(padding: const EdgeInsets.all(20), color: Colors.grey[200], child: Text('no_data'.tr))),
        columns: widget.columns,
      ),
    );
  }
}