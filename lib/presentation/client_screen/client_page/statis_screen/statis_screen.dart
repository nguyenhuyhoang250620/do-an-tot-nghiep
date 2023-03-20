import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/statis_screen/statuis_controller/statis_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../libary/data_table_2/src/data_table_2.dart';
import '../../../../widgets/custom_loading.dart';
import '../../../../widgets/custom_table.dart';
import '../../../dashboard_screen/constants/constants.dart';
import '../../../dashboard_screen/page/student_management/widget/env_student.dart';
import '../../widget/client_source.dart';

class StatisScreen extends GetWidget<StatisController>{
  final clientController = Get.find<ClientController>();
  final TextEditingController _controller = TextEditingController();
  RxList<String> listLabel = [TenSV.value,MaSV.value,Khoa.value,CCCD.value].obs;
  var selectedOptions = TenSV.value;
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel(TenSV.value)),
    DataColumn2(label: buildLabel(MaSV.value),),
    DataColumn2(label: buildLabel(Khoa.value)),
    DataColumn2(label: buildLabel(CCCD.value)),
    DataColumn2(label: buildLabelActive('Hoạt động')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:Get.height,
        width: Get.width,
        child: Obx(() => clientController.isLoadingConfig.value
          ?MyPaginatedDataTable(
            value: selectedOptions,
            onChangedlistSelect: (p0) {
              selectedOptions= p0 as String;
            },
            items: listLabel.value,
            controller: _controller,
            onChanged: (p0) {
              clientController.search(_controller.text,selectedOptions);
            },
            // titleButtonLeft: 'Thêm sinh viên mới',
            titleButtonRight: 'Import excel',
            titleButtonBetween: 'Export excel',
            onPressedBetween: () {
              // controller.exportData();
            },
            onPressedLeft: () {
              // controller.ten_sinh_vien.text = "";
              // controller.ma_sinh_vien.text = "";
              // controller.khoa.text = "";
              // controller.ngay_sinh.text = "";
              // controller.gioi_tinh.text = "";
              // controller.cccd.text = "";
              // controller.email.text = "";
              // controller.so_dien_thoai.text = "";
              // Get.dialog(alertAvt(controller));
            },
            onPressedRight: () {
              // controller.importFileExcel();
            },
            columns: columns,
            source: ClientDataTableSource(
            data: clientController.getConfigListMap.value),
            rowsPerPage: 6,
          ):Center(child: CustomLoading(),))
      ),
    );
  }

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
