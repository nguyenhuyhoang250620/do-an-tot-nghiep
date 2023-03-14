import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/shift_management/controller/shift_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/shift_management/widget/env_shift.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/shift_management/widget/shift_sources.dart';
import 'package:do_an_tot_nghiep/widgets/custom_loading.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_widget_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../libary/data_table_2/src/data_table_2.dart';
import '../../../../theme/app_style.dart';
import '../../../../widgets/custom_alert.dart';
import '../../../../widgets/custom_textfiled.dart';
import '../../controller/dashboard_controller.dart';

class ShiftManagement extends StatefulWidget{
  ShiftManagement({this.dashboardController});
  DashBoardController? dashboardController;
  final controller = Get.find<ShiftController>();
  @override
  State<StatefulWidget> createState() {
    return ShiftState();
  }
}
class ShiftState extends State<ShiftManagement>{
  RxList<String> listLabel = [MaCa.value,TenCa.value].obs;
  final controller = Get.find<ShiftController>();
  var selectedOptions = MaCa.value;
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel(MaCa.value)),
    DataColumn2(label: buildLabel(TenCa.value)),
    DataColumn2(label: buildLabel(SoCa.value),),
    DataColumn2(label: buildLabel(Mota.value)),
    DataColumn2(label: buildLabel(ThoiGian.value)),
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
                      () =>widget.dashboardController!.isLoadingShift.value
                            ?widget.dashboardController!.getShiftList.isNotEmpty
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
                                  titleButtonLeft: 'Thêm ca học mới',
                                  titleButtonRight: 'Import excel',
                                  titleButtonBetween: 'Export excel',
                                  onPressedBetween: () {
                                    controller.exportData();
                                  },
                                  onPressedLeft: () {
                                  widget.controller.ma_ca.text = "";
                                  widget.controller.ten_ca.text ="";
                                  widget.controller.so_ca.text = "";
                                  widget.controller.mo_ta.text = "";
                                  widget.controller.thoi_gian.text = "";
                                  widget.controller.mo_ta.text = "";
                                    Get.dialog(alertAvt(controller));
                                  },
                                  onPressedRight: () {
                                    controller.importFileExcel();
                                  },
                                  columns: columns,
                                  source: ShiftDataTableSource(
                                      data: widget
                                          .dashboardController!.getShiftListMap.value),
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
Widget alertAvt(ShiftController controller){
  final _formKey = GlobalKey<FormState>();
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Thêm ca học",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            suffixIcon: Icon(Icons.qr_code_2), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên mã ca';
              }
            },
            controller: controller.ma_ca,
            label:MaCa.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.near_me), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên ca';
              }
            },
            controller: controller.ten_ca,
            label:TenCa.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.format_list_numbered), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập số tiết';
              }
            },
            controller: controller.so_ca,
            label:SoCa.value,
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
          ),
          CustomTextForm(
            suffixIcon: Icon(Icons.lock_clock), 
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập thời gian';
              }
            },
            controller: controller.thoi_gian,
            label:ThoiGian.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
        ],
      ),
      onPressedDisable: () {
        Get.back();
      },
      onPressedEisable: () {
        if (_formKey.currentState!.validate()) {
            controller.createShift(
              controller.ma_ca.text,
              controller.ten_ca.text,
              controller.so_ca.text,
              controller.mo_ta.text,
              controller.thoi_gian.text,
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
