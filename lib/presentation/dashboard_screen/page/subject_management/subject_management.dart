import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/subject_management/widget/subject_sources.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_table.dart';
import '../../../../widgets/custom_widget_action.dart';
import '../../components/custom_appbar.dart';

class SubjectManagement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SubjectState();
  }
}
class SubjectState extends State<SubjectManagement>{
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
                    title: 'Danh sách tín chỉ',
                    textSearch: 'Tìm kiếm tín chỉ',
                    titleButtonLeft: 'Thêm tín chỉ mới',
                    titleButtonRight: 'Import excel',
                  )
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(top: appPadding),
                    child: MyPaginatedDataTable(
                      columns: columns,
                      source: SubjectDataTableSource(),
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