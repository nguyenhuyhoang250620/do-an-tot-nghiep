import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_controller/client_controller.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/statis_screen/statuis_controller/statis_controller.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';

import '../../../../libary/data_table_2/src/data_table_2.dart';
import '../../../../widgets/custom_loading.dart';
import '../../../../widgets/custom_table.dart';
import '../../../dashboard_screen/constants/constants.dart';
import '../../../dashboard_screen/page/student_management/widget/env_student.dart';
import 'statis_widget/statis_source.dart';

class StatisScreen extends GetWidget<StatisController>{
  final clientController = Get.find<ClientController>();
  final TextEditingController _controller = TextEditingController();
  RxList<String> listLabel = [TenSV.value,MaSV.value].obs;
  var selectedOptions = TenSV.value;
  List<DataColumn> columns = [
    DataColumn2(label: buildLabel(TenSV.value)),
    DataColumn2(label: buildLabel(MaSV.value),),
    DataColumn2(label: buildLabel('Điểm chuyên cần')),
    DataColumn2(label: buildLabel('Điểm giữa kì')),
    DataColumn2(label: buildLabel('Điểm cuối kì')),
    DataColumn2(label: buildLabel('Điểm trung bình')),
    DataColumn2(label: buildLabel('Hoạt động')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height:Get.height,
        width: Get.width,
        child: Column(
          children: [
            Obx(() => Text("${clientController.selectTenHocPhan.value}",style: AppStyle.txtInterRegular18.copyWith(fontWeight: FontWeight.bold),),),
            Expanded(
              flex: 10,
              child: Obx(() => 
              clientController.isLoadingConfig.value
                ? 
                    MyPaginatedDataTable(
                      value: selectedOptions,
                      onChangedlistSelect: (p0) {
                        selectedOptions= p0 as String;
                      },
                      items: listLabel.value,
                      controller: _controller,
                      onChanged: (p0) {
                        clientController.search(_controller.text,selectedOptions);
                      },
                      titleButtonLeft: 'Lựa chọn lớp',
                      titleButtonBetween: 'Export excel',
                      titleButtonRight: 'Tính trung bình',
                      onPressedBetween: () {
                        controller.exportData();
                      },
                      iconLeft: 'left',
                      iconRight: 'right',
                      onPressedLeft: () {
                        Get.dialog(buildSelectMaHocPhan());
                      },
                      onPressedRight: () {
                        controller.averagedFunction(clientController.MaGV.value);
                      },
                      columns: columns,
                      source: StatisDataTableSource(
                      data: clientController.getConfigListMap.value),
                      rowsPerPage: 6,
                    ):Center(child: Text("Chưa có dữ liệu"),)),
            )
          ],
        )
      ),
    );
  }

}
Widget buildLabel(String text) {
  return Container(
    padding: EdgeInsets.only(left: appPadding * 3),
    alignment: Alignment.center,
    child: Text(
      text,
      style: AppStyle.txtInterRegular16.copyWith(color: darkTextColor),
      maxLines: 1,
      overflow: TextOverflow.fade,
    ),
  );
}
Widget buildSelectMaHocPhan() {
  final controller = Get.find<ClientController>();
  final MultiSelectController<String> _controller = MultiSelectController();
  return AlertDialog(
    title: Text("Danh sách học phần"),
    content: SizedBox(
      height: Get.height*0.5,
      width: Get.width*0.3,
      child:Obx(() => controller.listMaHocPhan.value.isNotEmpty?
      ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: MultiSelectCheckList(
                singleSelectedItem: true,
                maxSelectableCount: controller.listMaHocPhan.length,
                textStyles: MultiSelectTextStyles(
                    selectedTextStyle: TextStyle(
                        color: Get.context!.theme.colorScheme.background, fontWeight: FontWeight.bold)),
                itemsDecoration: MultiSelectDecorations(
                    selectedDecoration:
                        BoxDecoration(color:Get.context!.theme.colorScheme.secondary)),
                listViewSettings: ListViewSettings(
                    separatorBuilder: (context, index) => const Divider(
                          height: 0,
                        )),
                controller: _controller,
                items: List.generate(
                    controller.listMaHocPhan.length,
                    (index) => CheckListCard(          
                        decorations: MultiSelectItemDecorations(decoration: BoxDecoration(color:Get.context!.theme.colorScheme.surface)),
                        selected: false,
                        enabled: true,
                        value:'${controller.listMaHocPhan.value[index].MaHocPhan}',
                        title: Text('${controller.listMaHocPhan.value[index].TenHocPhan}'),
                        selectedColor:Get.context!.theme.colorScheme.onBackground,
                        checkColor: Get.context!.theme.colorScheme.background,
                        checkBoxBorderSide:
                            BorderSide(color: Colors.grey),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)))),
                onChange: (allSelectedItems, selectedItem) {
                  // selectDepartmentFirst.value = selectedItem;
                  controller.selectMaHocPhan.value =selectedItem;
                },
                onMaximumSelected: (allSelectedItems, selectedItem) {
                },
              ),
            ):Center(child: Text("Chưa có dữ liệu"),),)
    ),
    actions: [CustomButtonAlert(
      titileDisable: 'Huỷ',
      titileEnable: 'Đồng ý',
      onPressedDisable: () => Get.back(),
      onPressedEnable: () {
        controller.getConfigMaHocPhanClient(controller.MaGV.value,controller.selectMaHocPhan.value);
        controller.getAttendance(controller.MaGV.value,controller.selectMaHocPhan.value);
        Get.back();
      },
    )],
  );
}