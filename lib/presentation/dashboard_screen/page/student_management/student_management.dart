import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/widget/table_studend.dart';
import 'package:flutter/material.dart';

import 'widget/data_sources.dart';

class StudenManagement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StudentState();
  }
}
class StudentState extends State<StudenManagement>{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return Container(
          height: p1.maxHeight,
          width: p1.maxWidth,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child:Container(
                  padding: EdgeInsets.all(appPadding),
                  child: CustomAppbar(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(color: Colors.black),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.all(40),
                  child: TableStudent(
                    rowsPerPage: 9,
                    source: DashboardDataSource(
                      data: ["1","2","3","4","5","6","7","sd","d","d","dsds","sdsadadasd","adasd"]
                    ),
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
