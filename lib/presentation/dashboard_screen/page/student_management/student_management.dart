import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/libary/data_table_2/src/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/controller/home_controller.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_widget_action.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button.dart';
import 'widget/user_sources.dart';

class StudenManagement extends StatefulWidget{
  StudenManagement({this.studentController});
  DashBoardController? studentController;
  @override
  State<StatefulWidget> createState() {
    return StudentState();
  }
}
class StudentState extends State<StudenManagement>{
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel('Họ và tên')),
    DataColumn2(label: buildLabel('Mã sinh viên'),),
    DataColumn2(label: buildLabel('Khoa')),
    DataColumn2(label: buildLabel('Email')),
    DataColumn2(label: buildLabel('CCCD/CMT')),
    DataColumn2(label: buildLabel('Hoạt động')),
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
                    title: 'Danh sách sinh viên',
                    textSearch: 'Tìm kiếm sinh viên',
                    titleButtonLeft: 'Thêm sinh viên mới',
                    titleButtonRight: 'Import excel',
                  )
                ),
                Expanded(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(top: appPadding),
                    child: MyPaginatedDataTable(
                      columns: columns,
                      source: StudentDataTableSource(
                        data: widget.studentController!.jsonList
                      ),
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