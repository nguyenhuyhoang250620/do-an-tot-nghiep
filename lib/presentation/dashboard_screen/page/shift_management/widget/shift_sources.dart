import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/shift_management/controller/shift_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/shift_management/widget/env_shift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../../theme/app_style.dart';
import '../../../../../widgets/custom_active_table.dart';
import '../../../../../widgets/custom_alert.dart';
import '../../../../../widgets/custom_button_alert.dart';
import '../../../../../widgets/custom_loading.dart';
import '../../../../../widgets/custom_textfiled.dart';
import '../../../constants/constants.dart';

class ShiftDataTableSource extends DataTableSource {
  ShiftDataTableSource({required this.data});
  List<Map<String, dynamic>> data = [];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Map<String, dynamic> row = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(label(index,row['MaCa'].toString())),
        DataCell(label(index,row['TenCa'].toString())),
        DataCell(label(index,row['SoCa'].toString())),
        DataCell(label(index,row['Mota'].toString())),
        DataCell(label(index,row['ThoiGian'].toString())),
        DataCell(buildActive(
          row['MaCa'].toString(),
          row['TenCa'].toString(),
          row['SoCa'].toString(),
          row['Mota'].toString(),
          row['ThoiGian'].toString(),
          index
        )),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => _selectedCount;

  // void sort<T>(Comparable<T> Function(Map<String, dynamic> d) getField, bool ascending) {
  //   data.sort((a, b) {
  //     final aValue = getField(a);
  //     final bValue = getField(b);
  //     return ascending ? Comparable.compare(aValue, bValue) : Comparable.compare(bValue, aValue);
  //   });
  //   notifyListeners();
  // }

  // void selectAll(bool isAllChecked) {
  //   _selectedCount = isAllChecked ? data.length : 0;
  //   notifyListeners();
  // }

  // void onSelectRow(int index, bool isSelected) {
  //   if (isSelected) {
  //     _selectedCount += 1;
  //   } else {
  //     _selectedCount -= 1;
  //   }
  //   notifyListeners();
  // }
}

Widget label(int index, String text) {
  return Container(
    alignment: Alignment.centerLeft,
    padding: EdgeInsets.only(left: appPadding * 3),
    width: Get.width,
    height: Get.height,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: unline)),
      color: index % 2 == 0 ? Colors.grey.withOpacity(0.1) : null,
    ),
    child: Text(
      text,
      style: AppStyle.txtInterRegular12
          .copyWith(color: Colors.black, fontSize: 12),
    ),
  );
}
Widget image(String text){
  return FadeInImage(
    placeholder: AssetImage('assets/images/image_not_found.png'),
    image: NetworkImage(
      'https://firebasestorage.googleapis.com/v0/b/demoflutter-706b1.appspot.com/o/_media_vms_media_2022_12_01_image_3TTgEwn.jpg?alt=media&token=a9aba964-9b08-44c6-94f1-32e7244fe8bc',
    ),
    imageErrorBuilder: (context, error, stackTrace) => Text('Error'),
    height: 100,
    width: 100,
  );
}
  Widget buildActive(
    String ma_ca,
    String ten_ca,
    String so_ca,
    String mo_ta,
    String thoi_gian,
    int index
  ) {
    final controller = Get.find<ShiftController>();
    BuildContext? context;
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: unline)),
        color: index % 2 == 0 ? Colors.grey.withOpacity(0.1) : null,
      ),
      alignment: Alignment.center,
      child: CusstomActiveTable(
        showView: false,
        onDelete: () {
            Get.dialog(
            AlertDialog(
              content: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: Text('Bạn có chắc muốn xoá không?')
                ),
              actions: [
                CustomButtonAlert(
                  titileDisable: 'Huỷ',
                  titileEnable: 'Đồng ý',
                  onPressedDisable: () => Get.back(),
                  onPressedEnable: () {
                    Get.back();
                    controller.deleterShift(ma_ca);
                    Get.dialog(Dialog(
                      child: CustomLoading(),
                    ));
                    Future.delayed(Duration(seconds: 2),() {
                      Get.back();
                    },);
                  },
                )
              ],
            )
          );
        },
        onUpdate: () {
          Get.dialog(alertAvt(
            controller,
            ma_ca,
            ten_ca,
            so_ca,
            mo_ta,
            thoi_gian
          ));
        },
      )
    );
  }
  Widget alertAvt(
    ShiftController controller,
    String ma_ca,
    String ten_ca,
    String so_ca,
    String mo_ta,
    String thoi_gian,
  ){
  final _formKey = GlobalKey<FormState>();
  controller.ma_ca.text = ma_ca;
  controller.ten_ca.text = ten_ca;
  controller.so_ca.text = so_ca;
  controller.mo_ta.text = mo_ta;
  controller.thoi_gian.text = thoi_gian;
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Cập nhật thông tin",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            enabled: false,
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mã đơn vị';
              }
            },
            controller: controller.ma_ca,
            label:MaCa.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
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
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập số ca';
              }
            },
            controller: controller.so_ca,
            label:SoCa.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
           CustomTextForm(
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
          )
        ],
      ),
      onPressedDisable: () {
        Get.back();
      },
      onPressedEisable: () {
        if (_formKey.currentState!.validate()) {
            controller.updateShift(
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
