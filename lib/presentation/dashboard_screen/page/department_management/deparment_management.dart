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


class DepartmentManagement extends StatefulWidget {
  DepartmentManagement({this.dashboardController});
  DashBoardController? dashboardController;
  @override
  State<StatefulWidget> createState() {
    return DepartmentState();
  }
}

class DepartmentState extends State<DepartmentManagement> {
  final controller = Get.find<DepartmentController>();
  RxList<String> listLabel = [TenDV.value,MaDV.value].obs;
  var selectedOptions = TenDV.value;
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel(TenDV.value)),
    DataColumn2(label: buildLabel(MaDV.value),),
    DataColumn2(label: buildLabel(Mota.value)),
    DataColumn2(label: buildLabel('Hoạt động')),
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
                  flex: 3,
                  child: CustomWidgetAction()),
              Expanded(
                flex: 7,
                child: Container(
                    child: Obx(
                      () =>widget.dashboardController!.isLoadingDepartment.value
                            ?widget.dashboardController!.getDepartmentList.isNotEmpty
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
                                  titleButtonLeft: 'Thêm nhân viên mới',
                                  titleButtonRight: 'Import excel',
                                  onPressedLeft: () {
                                    controller.ten_don_vi.text = "";
                                    controller.ma_don_vi.text ="";
                                    controller.mo_ta.text = "";
                                    Get.dialog(alertAvt(controller));
                                  },
                                  onPressedRight: () {
                                    
                                  },
                                  columns: columns,
                                  source: DepartmentDataTableSource(
                                      data: widget
                                          .dashboardController!.getDepartmentListMap.value),
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
Widget alertAvt(DepartmentController controller){
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Thêm phòng ban",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên sinh viên';
              }
            },
            controller: controller.ten_don_vi,
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
            controller: controller.ma_don_vi,
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
          )
        ],
      ),
      onPressedDisable: () {
        Get.back();
      },
      onPressedEisable: () {
        if (_formKey.currentState!.validate()) {
            controller.createDepartment(
              controller.ten_don_vi.text,
              controller.ma_don_vi.text,
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
