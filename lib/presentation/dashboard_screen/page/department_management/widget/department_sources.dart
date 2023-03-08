import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/controller/department_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/department_management/widget/env_department.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/controller/student_controller.dart';
import 'package:do_an_tot_nghiep/widgets/custom_active_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../../widgets/custom_alert.dart';
import '../../../../../widgets/custom_button_alert.dart';
import '../../../../../widgets/custom_loading.dart';
import '../../../../../widgets/custom_textfiled.dart';
import '../../../constants/constants.dart';
final FirebaseStorage storage = FirebaseStorage.instance;
class DepartmentDataTableSource extends DataTableSource {
  DepartmentDataTableSource({required this.data});
  List<Map<String, dynamic>> data = [];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Map<String, dynamic> row = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(label(index,row['TenDV'].toString())),
        DataCell(label(index,row['MaDV'].toString())),
        DataCell(label(index,row['Mota'].toString())),
        DataCell(buildActive(
          row['TenDV'].toString(),
          row['MaDV'].toString(),
          row['Mota'].toString(),
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
    String ten_don_vi,
    String ma_don_vi,
    String mo_ta,
    int index
  ) {
    final controller = Get.find<DepartmentController>();
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
                    controller.deleterDepartment(ma_don_vi);
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
            ten_don_vi,
            ma_don_vi,
            mo_ta,
          ));
        },
      )
    );
  }
  Widget alertAvt(
    DepartmentController controller,
    String ten_don_vi,
    String ma_don_vi,
    String mo_ta,
  ){
  final _formKey = GlobalKey<FormState>();
  controller.ten_don_vi.text = ten_don_vi;
  controller.ma_don_vi.text = ma_don_vi;
  controller.mo_ta.text = mo_ta;
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Cập nhật thông tin phòng ban",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            enabled: false,
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mã đơn vị';
              }
            },
            controller: controller.ma_don_vi,
            label:MaDV.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên đơn vị';
              }
            },
            controller: controller.ten_don_vi,
            label:TenDV.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mổ tả';
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
            controller.updateDepartment(
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
