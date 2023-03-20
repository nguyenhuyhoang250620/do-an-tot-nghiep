import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/libary/data_table_2/src/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/class_management/widget/class_sources.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/class_management/widget/env_class.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/controller/department_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/widget/department_sources.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/controller/teacher_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/widget/teacher_sources.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_textfiled.dart';
import 'package:do_an_tot_nghiep/widgets/custom_widget_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../widgets/custom_alert.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_loading.dart';
import 'controller/class_controller.dart';


class ClassManagement extends StatefulWidget {
  ClassManagement({this.dashboardController});
  DashBoardController? dashboardController;
  @override
  State<StatefulWidget> createState() {
    return ClassState();
  }
}

class ClassState extends State<ClassManagement> {
    final controller = Get.find<ClassController>();
    RxList<String> listLabel = [TenPhong.value,MaPhong.value,TenMayQuet.value].obs;
    var selectedOptions = TenPhong.value;
    List<DataColumn> columns = [
    DataColumn2(label: buildLabel(TenPhong.value)),
    DataColumn2(label: buildLabel(MaPhong.value),),
    DataColumn2(label: buildLabel(TenMayQuet.value)),
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
                      () =>widget.dashboardController!.isLoadingClass.value
                            ?MyPaginatedDataTable(
                                  value: selectedOptions,
                                  onChangedlistSelect: (p0) {
                                    selectedOptions= p0 as String;
                                  },
                                  items: listLabel.value,
                                  controller: _controller,
                                  onChanged: (p0) {
                                    controller.search(_controller.text,selectedOptions);
                                  },
                                  titleButtonLeft: 'Thêm lớp học mới',
                                  titleButtonRight: 'Import excel',
                                  titleButtonBetween: 'Export excel',
                                  onPressedLeft: () {
                                    controller.ten_may_quet.text = "";
                                    controller.ma_phong.text ="";
                                    controller.mo_ta.text = "";
                                    controller.ten_phong.text = "";
                                    Get.dialog(alertAvt(controller));
                                  },
                                  onPressedBetween: () {
                                    controller.exportData();
                                  },
                                  onPressedRight: () {
                                    controller.importFileExcel();
                                  },
                                  columns: columns,
                                  source: ClassDataTableSource(
                                      data: widget
                                          .dashboardController!.getClassListMap.value),
                                  rowsPerPage: 6,
                                )
                              :Center(
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
Widget alertAvt(ClassController controller){
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Thêm phòng học",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            suffixIcon: Icon(Icons.near_me),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên phòng học';
              }
            },
            controller: controller.ten_phong,
            label:TenPhong.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.qr_code_2),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mã phòng';
              }
            },
            controller: controller.ma_phong,
            label:MaPhong.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.video_camera_back),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên máy quét';
              }
            },
            controller: controller.ten_may_quet,
            label:TenMayQuet.value,
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
            controller.createClass(
              controller.ten_phong.text,
              controller.ma_phong.text,
              controller.ten_may_quet.text,
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
