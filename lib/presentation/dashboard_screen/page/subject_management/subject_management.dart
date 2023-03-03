import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/libary/data_table_2/src/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/controller/department_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/widget/department_sources.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/subject_management/controller/subject_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/subject_management/widget/subject_sources.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/controller/teacher_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/widget/teacher_sources.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/controller/home_controller.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_textfiled.dart';
import 'package:do_an_tot_nghiep/widgets/custom_widget_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../widgets/custom_alert.dart';
import '../../../../widgets/custom_button.dart';


class SubjectManagement extends StatefulWidget {
  SubjectManagement({this.dashboardController});
  DashBoardController? dashboardController;
  final controller = Get.find<SubjectController>();
  @override
  State<StatefulWidget> createState() {
    return SubjectState();
  }
}

class SubjectState extends State<SubjectManagement> {
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel('Tên phòng')),
    DataColumn2(label: buildLabel('Mã phòng'),),
    DataColumn2(label: buildLabel('Mô tả')),
    DataColumn2(label: buildLabel('Tên máy quét')),
    DataColumn2(label: buildLabel('Hoạt động')),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (p0, p1) {
        return Container(
          height: p1.maxHeight,
          width: p1.maxWidth,
          padding: EdgeInsets.all(appPadding * 2),
          child: Column(
            children: [
              CustomAppbar(),
              Expanded(
                  flex: 2,
                  child: CustomWidgetAction(
                    title: 'Danh sách giảng viên',
                    textSearch: 'Tìm kiếm giảng viên',
                    titleButtonLeft: 'Thêm giảng viên mới',
                    titleButtonRight: 'Import excel',
                    onPressedLeft: () {
                    widget.controller.ten_phong.text = "";
                    widget.controller.ma_phong.text ="";
                    widget.controller.mo_ta.text = "";
                    widget.controller.ten_may_quet.text = "";
                      Get.dialog(
                        alertAvt(
                          widget.controller
                        )
                      );
                    },
                  )),
              Expanded(
                flex: 8,
                child: Container(
                    padding: EdgeInsets.only(top: appPadding),
                    child: Obx(() => widget.dashboardController!.isLoadingSubject.value
                    ?widget.dashboardController!.getSubjectListMap.isNotEmpty
                      ?MyPaginatedDataTable(
                        columns: columns,
                        source: SubjectDataTableSource(
                          data: widget.dashboardController!.getSubjectListMap),
                          rowsPerPage: 6,
                      ):Center(child: Text("Không có dữ liệu"),)
                    :Center(child: CircularProgressIndicator(),))),
              )
            ],
          ),
        );
      },
    );
  }
}
Widget alertAvt(SubjectController controller){
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Thêm giảng viên",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên sinh viên';
              }
            },
            controller: controller.ten_phong,
            label:'Tên sinh viên',
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mã sinh viên';
              }
            },
            controller: controller.ma_phong,
            label:'Mã sinh viên',
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập khoa';
              }
            },
            controller: controller.mo_ta,
            label:'Khoa',
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập khoa';
              }
            },
            controller: controller.ten_may_quet,
            label:'Khoa',
            obscureText: false,
            onChanged: (p0) {
            },
          )
        ],
      ),
      onPressedDisable: () {
        Get.back();
      },
      onPressedEisable: () {
        if (_formKey.currentState!.validate()) {
            controller.createSubject(
              controller.ten_phong.text,
              controller.ma_phong.text,
              controller.mo_ta.text,
              controller.mo_ta.text,
            );
            Get.back();
        }
      },
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
