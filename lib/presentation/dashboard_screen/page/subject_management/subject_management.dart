import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/libary/data_table_2/src/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/controller/department_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/widget/department_sources.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/widget/env_department.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/widget/env_student.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/subject_management/controller/subject_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/subject_management/widget/env_subject.dart';
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
import '../../../../widgets/custom_loading.dart';


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
  final controller = Get.find<SubjectController>();
  RxList<String> listLabel = [MaHocPhan.value,TenHocPhan.value,KhoiKienThuc.value,KiThu.value].obs;
  var selectedOptions = MaHocPhan.value;
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel(KhoiKienThuc.value)),
    DataColumn2(label: buildLabel(TenHocPhan.value)),
    DataColumn2(label: buildLabel(MaHocPhan.value),),
    DataColumn2(label: buildLabel(SotinChi.value)),
    DataColumn2(label: buildLabel(DKTQ.value)),
    DataColumn2(label: buildLabel(KiThu.value)),
    DataColumn2(label: buildLabel(TongSoTiet.value)),
    DataColumn2(label: buildLabel(Mota.value)),
    DataColumn2(label: buildLabelActive('Hoạt động')),
  ];
  final TextEditingController _controller = TextEditingController();
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
              Divider(),
              Expanded(
                  flex: 2,
                  child: CustomWidgetAction()),
              Expanded(
                flex: 8,
                child: Container(
                    child: Obx(
                      () =>widget.dashboardController!.isLoadingSubject.value
                            ?widget.dashboardController!.getSubjectList.isNotEmpty
                              ? MyPaginatedDataTable(
                                  value: selectedOptions,
                                  onChangedlistSelect: (p0) {
                                    selectedOptions= p0 as String;
                                  },
                                  items: listLabel.value,
                                  controller: _controller,
                                  onChanged: (p0) {
                                    controller.search(_controller.text,selectedOptions);
                                  },
                                  titleButtonLeft: 'Thêm tín chỉ mới',
                                  titleButtonRight: 'Import excel',
                                  titleButtonBetween: 'Export excel',
                                  onPressedBetween: () {
                                    controller.exportData();
                                  },
                                  onPressedLeft: () {
                                  widget.controller.khoi_kien_thuc.text = "";
                                  widget.controller.ma_hoc_phan.text ="";
                                  widget.controller.ten_hoc_phan.text = "";
                                  widget.controller.ki_thu.text = "";
                                  widget.controller.so_tin_chi.text = "";
                                  widget.controller.tong_so_tiet.text = "";
                                  widget.controller.dktq.text = "";
                                  widget.controller.mo_ta.text = "";
                                    Get.dialog(alertAvt(controller));
                                  },
                                  onPressedRight: () {
                                    controller.importFileExcel();
                                  },
                                  columns: columns,
                                  source: SubjectDataTableSource(
                                      data: widget
                                          .dashboardController!.getSubjectListMap.value),
                                  rowsPerPage: 6,
                                )
                              : Center(
                                  child: Text("Không có dữ liệu"),
                            ):Center(
                              child: CustomLoading(),
                            ),
                    )),
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
        title: Center(child: Text("Thêm tín chỉ",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            suffixIcon: Icon(Icons.near_me),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên tín chỉ';
              }
            },
            controller: controller.ten_hoc_phan,
            label:TenHocPhan.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.rectangle_outlined),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập khối kiến thức';
              }
            },
            controller: controller.khoi_kien_thuc,
            label:KhoiKienThuc.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.qr_code_2),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mã học phần';
              }
            },
            controller: controller.ma_hoc_phan,
            label:MaHocPhan.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.format_list_numbered), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập kì';
              }
            },
            controller: controller.ki_thu,
            label:KiThu.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.format_list_numbered), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập số tín chỉ';
              }
            },
            controller: controller.so_tin_chi,
            label:SotinChi.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.format_list_numbered), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tổng số tiết';
              }
            },
            controller: controller.tong_so_tiet,
            label:TongSoTiet.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.warning_rounded), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập DKTQ';
              }
            },
            controller: controller.dktq,
            label:DKTQ.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.description), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mô tả';
              }
            },
            controller: controller.mo_ta,
            label:Mota.value,
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
              controller.khoi_kien_thuc.text,
              controller.ma_hoc_phan.text,
              controller.ten_hoc_phan.text,
              controller.ki_thu.text,
              controller.so_tin_chi.text,
              controller.tong_so_tiet.text,
              controller.dktq.text,
              controller.mo_ta.text
            );
            Get.back();
        }
      },
    ),
  );
}

Widget buildLabel(String text) {
  return Container(
    padding: EdgeInsets.only(left: appPadding * 3),
    alignment: Alignment.centerLeft,
    child: Text(
      text,
      style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor),
      maxLines: 1,
      overflow: TextOverflow.fade,
    ),
  );
}
Widget buildLabelActive(String text) {
  return Container(
    alignment: Alignment.center,
    child: Text(
      text,
      style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor),
      maxLines: 1,
      overflow: TextOverflow.fade,
    ),
  );
}

