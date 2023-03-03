import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/libary/data_table_2/src/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
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


class TeacherManagement extends StatefulWidget {
  TeacherManagement({this.dashboardController});
  DashBoardController? dashboardController;
  final controller = Get.find<TeacherController>();
  @override
  State<StatefulWidget> createState() {
    return TeacherState();
  }
}

class TeacherState extends State<TeacherManagement> {
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel('Họ và tên')),
    DataColumn2(label: buildLabel('Mã giảng viên'),),
    DataColumn2(label: buildLabel('Chuyên ngành')),
    DataColumn2(label: buildLabel('CCCD/CMT')),
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
                    widget.controller.ten_giang_vien.text = "";
                    widget.controller.ma_giang_vien.text ="";
                    widget.controller.chuyen_nganh.text = "";
                    widget.controller.ngay_sinh.text = "";
                    widget.controller.gioi_tinh.text="";
                    widget.controller.cccd.text="";
                    widget.controller.email.text="";
                    widget.controller.so_dien_thoai.text="";
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
                    child: Obx(() => widget.dashboardController!.getTeacherListMap.isNotEmpty?
                    MyPaginatedDataTable(
                      columns: columns,
                      source: TeacherDataTableSource(
                        data: widget.dashboardController!.getTeacherListMap),
                        rowsPerPage: 6,
                    ):Center(child: Text("Không có dữ liệu"),)
                    ,)),
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
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên sinh viên';
              }
            },
            controller: controller.ten_giang_vien,
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
            controller: controller.ma_giang_vien,
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
            controller: controller.chuyen_nganh,
            label:'Khoa',
            obscureText: false,
            onChanged: (p0) {
            },
          ),CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập ngày sinh';
              }
            },
            controller: controller.ngay_sinh,
            label:'Ngày sinh',
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
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập giới tính';
              }
            },
            controller: controller.gioi_tinh,
            label:'Giới tính',
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập cccd';
              }
            },
            controller: controller.cccd,
            label:'CCCD',
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập gmail';
              }
            },
            controller: controller.email,
            label:'G-mail',
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập số điện thoại';
              }
            },
            controller: controller.so_dien_thoai,
            label:'Số điện thoại',
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
    alignment: Alignment.center,
    child: Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.fade,
    ),
  );
}
