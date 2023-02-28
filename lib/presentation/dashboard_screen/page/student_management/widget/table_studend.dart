
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/widget/data_table_2/paginated_data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';



class TableStudent extends StatefulWidget {
  TableStudent({Key? key, required this.source, required this.rowsPerPage}) : super(key: key);
  final DataTableSource source;
  final int rowsPerPage;

  @override
  State<TableStudent> createState() => _TableStudentState();
}

class _TableStudentState extends State<TableStudent> {
  List<String> items = ['lbl_status_all'.tr];
  final PaginatorController paginatorController = PaginatorController();
  final FocusNode _focusNode = FocusNode();
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKey: (value) {
        if (value.isKeyPressed(LogicalKeyboardKey.arrowRight)) {
          paginatorController.goToNextPage();
        }
        if (value.isKeyPressed(LogicalKeyboardKey.arrowLeft)) {
          paginatorController.goToPreviousPage();
        }
      },
      child: PaginatedDataTable2(
        // showCheckboxColumn: true,
        colorFirstLastButtons: context.theme.colorScheme.primary,
        colorNextPreviousButtons: context.theme.colorScheme.primary,
        footerTextStyle: TextStyle(fontSize: 30),
        checkboxHorizontalMargin: 0,
        horizontalMargin: 20,
        minWidth: 800,
        source: widget.source,
        border: TableBorder.all(color: context.theme.colorScheme.outline),
        headingRowHeight: 55,
        dataRowHeight: 55,
        rowsPerPage: widget.rowsPerPage,
        controller: paginatorController,
        wrapInCard: false,
        autoRowsToHeight: true,
        showFirstLastButtons: true,
        hidePaginator: false,
        empty: Center(child: Container(padding: const EdgeInsets.all(20), color: Colors.grey[200], child: Text('no_data'.tr))),
        columns: [
          DataColumn(label: buildLabel('lable')),
          DataColumn(label: buildLabel('labele2')),
          DataColumn(label: buildLabel('label3')),
          DataColumn(label: buildLabel('label 4')),
          DataColumn(label: buildLabel('label 5')),
          DataColumn(label: buildLabel('6')),
        ],
   
      ),
    );
  }

  Widget buildLabel(String text) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.fade,
      ),
    );
  }
}
