import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/models/user_models.dart';
import 'package:do_an_tot_nghiep/libary/data_table_2/src/data_table_2.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/search_field.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/responsive.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/home_screen/controller/home_controller.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_textfiled.dart';
import 'package:do_an_tot_nghiep/widgets/custom_widget_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../../../widgets/custom_alert.dart';
import '../../../../widgets/custom_button.dart';
import 'controller/student_controller.dart';
import 'widget/user_sources.dart';

class StudenManagement extends StatefulWidget {
  StudenManagement({this.dashboardController});
  DashBoardController? dashboardController;
  final controller = Get.find<StudentController>();
  @override
  State<StatefulWidget> createState() {
    return StudentState();
  }
}

class StudentState extends State<StudenManagement> {
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel('Họ và tên')),
    DataColumn2(
      label: buildLabel('Mã sinh viên'),
    ),
    DataColumn2(label: buildLabel('Khoa')),
    DataColumn2(label: buildLabel('CCCD/CMT')),
    DataColumn2(label: buildLabelActive('Hoạt động')),
  ];

  final TextEditingController controller = TextEditingController();
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
                      () =>widget.dashboardController!.isLoadingStudent.value
                            ?widget.dashboardController!.getUserList.isNotEmpty
                              ? MyPaginatedDataTable(
                                  controller: controller,
                                  onChanged: (p0) {
                                    widget.controller.search(controller.text);
                                  },
                                  titleButtonLeft: 'Thêm nhân viên mới',
                                  titleButtonRight: 'Import excel',
                                  onPressedLeft: () {
                                    widget.controller.ten_sinh_vien.text = "";
                                    widget.controller.ma_sinh_vien.text = "";
                                    widget.controller.khoa.text = "";
                                    widget.controller.ngay_sinh.text = "";
                                    widget.controller.gioi_tinh.text = "";
                                    widget.controller.cccd.text = "";
                                    widget.controller.email.text = "";
                                    widget.controller.so_dien_thoai.text = "";
                                    Get.dialog(alertAvt(widget.controller));
                                  },
                                  onPressedRight: () {
                                    
                                  },
                                  columns: columns,
                                  source: StudentDataTableSource(
                                      data: widget
                                          .dashboardController!.getUserListMap.value),
                                  rowsPerPage: 6,
                                )
                              : Center(
                                  child: Text("Không có dữ liệu"),
                            ):Center(
                              child: CircularProgressIndicator(),
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

Widget alertAvt(StudentController controller) {
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
      title: Center(
          child: Text(
        "Thêm sinh viên",
        style: AppStyle.txtRobotoRegular20,
      )),
      listTextFiled: ListView(
        children: [
          CustomTextForm(
            prefixIcon: Icon(Icons.person),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập tên sinh viên';
              }
            },
            controller: controller.ten_sinh_vien,
            label: 'Tên sinh viên',
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            prefixIcon: Icon(Icons.qr_code_2_outlined),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập mã sinh viên';
              }
            },
            controller: controller.ma_sinh_vien,
            label: 'Mã sinh viên',
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            prefixIcon: Icon(Icons.subject),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập khoa';
              }
            },
            controller: controller.khoa,
            label: 'Khoa',
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            prefixIcon: Icon(Icons.date_range),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập ngày sinh';
              }
            },
            controller: controller.ngay_sinh,
            label: 'Ngày sinh',
            obscureText: false,
            onChanged: (p0) {},
            ontap: () => DatePicker.showDatePicker(Get.context!,
                showTitleActions: true,
                minTime: DateTime(1980, 6, 7),
                maxTime: DateTime(2005, 6, 7),
                // onChanged: (date) {
                //   print('change $date');
                // },
                onConfirm: (date) {
              controller.ngay_sinh.text = date.toString().substring(0, 10);
            }, currentTime: DateTime.now(), locale: LocaleType.vi),
          ),
          CustomTextForm(
            prefixIcon: Icon(Icons.people),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập giới tính';
              }
            },
            controller: controller.gioi_tinh,
            label: 'Giới tính',
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            prefixIcon: Icon(Icons.branding_watermark),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập cccd';
              }
            },
            controller: controller.cccd,
            label: 'CCCD',
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            prefixIcon: Icon(Icons.email),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập gmail';
              }
            },
            controller: controller.email,
            label: 'G-mail',
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            prefixIcon: Icon(Icons.contact_phone),
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập số điện thoại';
              }
            },
            controller: controller.so_dien_thoai,
            label: 'Số điện thoại',
            obscureText: false,
            onChanged: (p0) {},
          )
        ],
      ),
      onPressedDisable: () {
        Get.back();
      },
      onPressedEisable: () {
        if (_formKey.currentState!.validate()) {
          controller.createUser(
              controller.ten_sinh_vien.text,
              controller.ma_sinh_vien.text,
              controller.khoa.text,
              controller.ngay_sinh.text,
              controller.gioi_tinh.text,
              controller.cccd.text,
              controller.email.text,
              controller.so_dien_thoai.text);
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

