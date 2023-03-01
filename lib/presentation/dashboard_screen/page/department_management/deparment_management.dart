import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/widget/department_sources.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_widget_action.dart';
import 'package:flutter/material.dart';

class DepartmentManagement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return DeparmentState();
  }
}
class DeparmentState extends State<DepartmentManagement>{
  List<DataColumn> columns = [
    DataColumn(label: buildLabel('lable')),
    DataColumn(label: buildLabel('labele2')),
    DataColumn(label: buildLabel('label3')),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return  Container(
            height: p1.maxHeight,
            width: p1.maxWidth,
            padding: EdgeInsets.all(appPadding*2),
            child: Column(
              children: [
                CustomAppbar(),
                Expanded(
                  flex: 2,
                  child:CustomWidgetAction(
                    title: 'Danh sách phòng ban',
                    textSearch: 'Tìm kiếm phòng ban',
                    titleButtonLeft: 'Thêm phòng ban mới',
                    titleButtonRight: 'Import excel',
                  )
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(top: appPadding),
                    child: MyPaginatedDataTable(
                      columns: columns,
                      source: DepartmentDataTableSource(),
                      rowsPerPage: 4,
                    )
                  ),
                )
              ],
            ),
        );
      },
    );
  }
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