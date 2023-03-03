import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/controller/student_controller.dart';
import 'package:do_an_tot_nghiep/widgets/custom_active_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../../widgets/custom_alert.dart';
import '../../../../../widgets/custom_loading.dart';
import '../../../../../widgets/custom_textfiled.dart';
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
        DataCell(label(row['TenDV'].toString())),
        DataCell(label(row['MaDV'].toString())),
        DataCell(label(row['Mota'].toString())),
        DataCell(buildActive(
          row['MaGV'].toString(),
          row['TenGV'].toString(),
          row['ChuyenNganh'].toString(),
          row['NamSinh'].toString(),
          row['GioiTinh'].toString(),
          row['CCCD'].toString(),
          row['Email'].toString(),
          row['SoDT'].toString(),
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
Widget label(String text){
  return Center(
    child: Text(text,style: AppStyle.txtInterRegular12.copyWith(color: Colors.black,fontSize: 12),),
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
    String ma_giang_vien,
    String ten_giang_vien,
    String chuyen_nganh,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai,
  ) {
    final controller = Get.find<StudentController>();
    BuildContext? context;
    return Container(
      alignment: Alignment.center,
      child: CusstomActiveTable(
        onDelete: () {
          
        },
        onUpdate: () {
          Get.dialog(alertAvt(
            controller,
            ma_giang_vien,
            ten_giang_vien,
            chuyen_nganh,
            ngay_sinh,
            gioi_tinh,
            cccd,
            gmail,
            so_dien_thoai,

          ));
        },
        onView: () {
          
        },
      )
    );
  }
  Widget alertAvt(
    StudentController controller,
    String ma_giang_vien,
    String ten_giang_vien,
    String chuyen_nganh,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai,
  ){
  final _formKey = GlobalKey<FormState>();
  controller.ten_sinh_vien.text = ten_giang_vien;
  controller.ma_sinh_vien.text = ma_giang_vien;
  controller.khoa.text = chuyen_nganh;
  controller.ngay_sinh.text = ngay_sinh;
  controller.gioi_tinh.text = gioi_tinh;
  controller.cccd.text = cccd;
  controller.email.text = gmail;
  controller.so_dien_thoai.text = so_dien_thoai;
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
        title: Center(child: Text("Thêm sinh viên",style: AppStyle.txtRobotoRegular20,)),
        listTextFiled: ListView(
        children: [
          CustomTextForm(
            enabled: false,
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập mã sinh viên';
              }
            },
            controller: controller.ma_sinh_vien,
            label:'Mã sinh viên',
            obscureText: false,
            onChanged: (p0) {
            },
          ),
          CustomTextForm(
            validator: (p0) {
              if(p0==null||p0.isEmpty){
                return 'Vui lòng nhập tên sinh viên';
              }
            },
            controller: controller.ten_sinh_vien,
            label:'Tên sinh viên',
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
            controller: controller.khoa,
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
            controller.updateUser(
              controller.ten_sinh_vien.text,
              controller.ma_sinh_vien.text,
              controller.khoa.text,
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
