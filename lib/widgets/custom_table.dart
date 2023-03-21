import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../libary/data_table_2/src/paginated_data_table_2.dart';
import '../presentation/dashboard_screen/components/search_field.dart';
import '../presentation/dashboard_screen/constants/responsive.dart';
import 'custom_button.dart';

class MyPaginatedDataTable extends StatefulWidget {
  final List<DataColumn> columns;
  final DataTableSource source;
  final int rowsPerPage;
  final String? title;
  final String? titleButtonLeft;
  final String? titleButtonRight;
  final String? titleButtonBetween;
  final String? textSearch;
  final VoidCallback? onPressedLeft;
  final VoidCallback? onPressedRight;
  final VoidCallback? onPressedBetween;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final dynamic Function(List<dynamic>)? onChangedSelect;
  final List<dynamic>? options;
  final String? whenEmpty;
  final Widget? icon;
  final  List<dynamic>? selectedValues;
  final String? labelText;
  final List<String>? items;
  final dynamic value;
  final Function(dynamic)? onChangedlistSelect;
  final String? iconLeft;
  final String? iconRight;

  const MyPaginatedDataTable({
    Key? key,
    required this.columns,
    required this.source,
    required this.rowsPerPage,
    this.title,
    this.onPressedLeft,
    this.onPressedRight,
    this.textSearch,
    this.titleButtonLeft,
    this.titleButtonRight,
    this.controller,
    this.onChanged,
    this.onChangedSelect,
    this.options,
    this.whenEmpty,
    this.icon,
    this.selectedValues,
    this.labelText,
    this.items,
    this.value,
    this.onChangedlistSelect,
    this.onPressedBetween,
    this.titleButtonBetween,
    this.iconLeft,
    this.iconRight
  }) : super(key: key);

  @override
  _MyPaginatedDataTableState createState() => _MyPaginatedDataTableState();
}
class _MyPaginatedDataTableState extends State<MyPaginatedDataTable> {
  final _paginatorController = PaginatorController();
  final controller = Get.find<DashBoardController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: transparent,
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: PaginatedDataTable2(
        header:SearchField(
            controller: widget.controller,
            texthint: 'Tìm kiếm',
            onChanged:widget.onChanged,
            suffixIcon: Container(
              width: 200,
              child: DropdownButtonFormField2(
            decoration: InputDecoration(
              labelStyle: AppStyle.txtInterRegular18.copyWith(color: darkTextColor),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide.none
              ),
            ),
            items: widget.items!.map((e) => _childDropDownItem(e)).toList(),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            style: AppStyle.textData.copyWith(color: Colors.black),
            value: widget.value,
            // controller.selectedGioiTinh.value,
            isDense: true,
            onChanged: widget.onChangedlistSelect,
            // (value) {
            //     // debugPrint('TungVD: selectedFormType - $value');
            //   controller.selectedGioiTinh.value = value as String;
            // },
          ),)
          ,),
        actions: [
          Container(
            width: Get.width*0.4,
            padding: EdgeInsets.only(left: appPadding*3),
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
                children: [
                if (!Responsive.isMobile(context))
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        widget.titleButtonLeft == null?Container():Expanded(
                          child: CustomButtonCommon(
                            icon: widget.iconLeft=='left'?Icon(Icons.class_):Icon(Icons.person_add),
                            title: widget.titleButtonLeft,
                            onPressed: widget.onPressedLeft,
                            color: Colors.blueAccent,
                            size: 14,
                          ),
                        ),
                        SizedBox(width: 10,),
                        widget.titleButtonBetween == null?Container():Expanded(
                          child: CustomButtonCommon(
                            icon: Icon(Icons.download),
                            title: widget.titleButtonBetween,
                            onPressed: widget.onPressedBetween,
                            color: Colors.blueAccent,
                            size: 14,
                          ),
                        ),
                        SizedBox(width: 10,),
                        widget.titleButtonRight==null?Container():Expanded(
                          child: CustomButtonCommon(
                            icon: widget.iconRight == 'right'?Icon(Icons.calculate):Icon(Icons.upload_outlined),
                            title: widget.titleButtonRight,
                            onPressed: widget.onPressedRight,
                            color: Colors.blueAccent,
                            size: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                if (Responsive.isMobile(context))
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomButtonCommon(
                          icon: Icon(Icons.people_alt),
                          title: widget.titleButtonLeft,
                          onPressed: widget.onPressedLeft,
                          color: Colors.blueAccent,
                          size: 12,
                        ),
                      ),
                      SizedBox(height: 2,),
                      Expanded(
                        child: CustomButtonCommon(
                          icon: Icon(Icons.upload_outlined),
                          title: widget.titleButtonRight,
                          onPressed: widget.onPressedRight,
                          color: Colors.blueAccent,
                          size: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
        columnSpacing: 0,
        // showCheckboxColumn: true,
        colorFirstLastButtons: Colors.black,
        colorNextPreviousButtons: Colors.black,
        footerTextStyle: TextStyle(fontSize: 14,color: Colors.black),
        checkboxHorizontalMargin: 0,
        horizontalMargin: 0,
        minWidth: 800,
        source: widget.source,
        // border: TableBorder(bottom: BorderSide(color: textColor),top: BorderSide(color: textColor)),
        headingRowHeight: 55,
        dataRowHeight: 70,
        rowsPerPage: widget.rowsPerPage,
        controller: _paginatorController,
        renderEmptyRowsInTheEnd: false,
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
DropdownMenuItem _childDropDownItem(String title) {
  return DropdownMenuItem<String>(
    value: title,
    child: Text(
      title,
      style: AppStyle.textData,
    ),
  );
}