import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/class_management/controller/class_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/class_management/widget/env_class.dart';
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
class ClassDataTableSource extends DataTableSource {
  ClassDataTableSource({required this.data});
  List<Map<String, dynamic>> data = [];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Map<String, dynamic> row = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(label(index,row['TenPhong'].toString())),
        DataCell(label(index,row['MaPhong'].toString())),
        DataCell(label(index,row['TenMayQuet'].toString())),
        DataCell(label(index,row['Mota'].toString())),
        DataCell(buildActive(
          row['TenPhong'].toString(),
          row['MaPhong'].toString(),
          row['TenMayQuet'].toString(),
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
    String ten_phong,
    String ma_phong,
    String ten_may_quet,
    String mo_ta,
    int index
  ) {
    final controller = Get.find<ClassController>();
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
                    controller.deleterClass(ma_phong);
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
            ten_phong,
            ma_phong,
            ten_may_quet,
            mo_ta,
          ));
        },
        onView: () {
          
        },
      )
    );
  }
  Widget alertAvt(
    ClassController controller,
    String ten_phong,
    String ma_phong,
    String ten_may_quet,
    String mo_ta,
  ){
  final _formKey = GlobalKey<FormState>();
  controller.ten_phong.text = ten_phong;
  controller.ma_phong.text = ma_phong;
  controller.ten_may_quet.text = ten_may_quet;
  controller.mo_ta.text = mo_ta;
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Thêm lớp học mới",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            enabled: false,
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
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên phòng';
              }
            },
            controller: controller.ten_phong,
            label:TenPhong.value,
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
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
          ),CustomTextForm(
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
        ],
      ),
      onPressedDisable: () {
        Get.back();
      },
      onPressedEisable: () {
        if (_formKey.currentState!.validate()) {
            controller.updateClass(
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
