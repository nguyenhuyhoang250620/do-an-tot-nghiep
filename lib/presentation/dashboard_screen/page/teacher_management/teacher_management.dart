import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/libary/data_table_2/src/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/controller/teacher_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/widget/env_teacher.dart';
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


class TeacherManagement extends StatefulWidget {
  TeacherManagement({this.dashboardController});
  DashBoardController? dashboardController;
  @override
  State<StatefulWidget> createState() {
    return TeacherState();
  }
}

class TeacherState extends State<TeacherManagement> {
    final controller = Get.find<TeacherController>();
    RxList<String> listLabel = [TenGV.value,MaGV.value,ChuyenNganh.value,CCCD.value].obs;
    var selectedOptions = TenGV.value;
    List<DataColumn> columns = [
    DataColumn2(label: buildLabel(TenGV.value)),
    DataColumn2(label: buildLabel(MaGV.value),),
    DataColumn2(label: buildLabel(ChuyenNganh.value)),
    DataColumn2(label: buildLabel(CCCD.value)),
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
                      () =>widget.dashboardController!.isLoadingTeacher.value
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
                                  titleButtonLeft: 'Thêm giảng viên mới',
                                  titleButtonRight: 'Import excel',
                                  titleButtonBetween: 'Export excel',
                                  onPressedLeft: () {
                                    controller.ten_giang_vien.text = "";
                                    controller.ma_giang_vien.text = "";
                                    controller.chuyen_nganh.text = "";
                                    controller.ngay_sinh.text = "";
                                    controller.gioi_tinh.text = "";
                                    controller.cccd.text = "";
                                    controller.email.text = "";
                                    controller.so_dien_thoai.text = "";
                                    Get.dialog(alertAvt(controller));
                                  },
                                  onPressedRight: () {
                                    controller.importFileExcel();
                                  },
                                  onPressedBetween: () {
                                     controller.exportData();
                                  },

                                  columns: columns,
                                  source: TeacherDataTableSource(
                                      data: widget
                                          .dashboardController!.getTeacherListMap.value),
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
Widget alertAvt(TeacherController controller){
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Thêm giảng viên",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            suffixIcon: Icon(Icons.person),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên giảng viên';
              }
            },
            controller: controller.ten_giang_vien,
            label:TenGV.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.qr_code_2),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mã giảng viên';
              }
            },
            controller: controller.ma_giang_vien,
            label:MaGV.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.subject),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập chuyên ngành';
              }
            },
            controller: controller.chuyen_nganh,
            label:ChuyenNganh.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),CustomTextForm(
            suffixIcon: Icon(Icons.date_range),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập ngày sinh';
              }
            },
            controller: controller.ngay_sinh,
            label:NamSinh.value,
            obscureText: false,
            onChanged: (p0) {
            },
            ontap: ()=> DatePicker.showDatePicker(Get.context!,
              showTitleActions: true,
              minTime: DateTime(1980, 6, 7),
              maxTime: DateTime(2005, 6, 7), 
              // onChanged: (date) {
              //   print('change $date');
              // }, 
              onConfirm: (date) {
                controller.ngay_sinh.text = date.toString().substring(0,10);
              }, 
              currentTime: DateTime.now(), locale: LocaleType.vi),
          ),CustomTextForm(
            suffixIcon: Icon(Icons.person_outline),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập giới tính';
              }
            },
            controller: controller.gioi_tinh,
            label:GioiTinh.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.branding_watermark),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập cccd';
              }
            },
            controller: controller.cccd,
            label:CCCD.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.email),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập gmail';
              }
            },
            controller: controller.email,
            label:Email.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.phone),
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập số điện thoại';
              }
            },
            controller: controller.so_dien_thoai,
            label:SoDT.value,
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
            controller.createTeacher(
              controller.ten_giang_vien.text,
              controller.ma_giang_vien.text,
              controller.chuyen_nganh.text,
              controller.ngay_sinh.text,
              controller.gioi_tinh.text,
              controller.cccd.text,
              controller.email.text,
              controller.so_dien_thoai.text
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
