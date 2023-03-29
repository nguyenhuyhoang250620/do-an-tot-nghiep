import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/controller/student_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/controller/teacher_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/teacher_management/widget/env_teacher.dart';
import 'package:do_an_tot_nghiep/widgets/custom_active_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_button_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../../widgets/custom_alert.dart';
import '../../../../../widgets/custom_button.dart';
import '../../../../../widgets/custom_loading.dart';
import '../../../../../widgets/custom_text_detail.dart';
import '../../../../../widgets/custom_textfiled.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

class TeacherDataTableSource extends DataTableSource {
  TeacherDataTableSource({required this.data});
  List<Map<String, dynamic>> data = [];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Map<String, dynamic> row = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(labelAndAvt(index, row['TenGV'].toString(),row['MaGV'].toString(),row['url'].toString())),
        DataCell(label(index, row['MaGV'].toString())),
        DataCell(label(index, row['ChuyenNganh'].toString())),
        DataCell(label(index, row['CCCD'].toString())),
        DataCell(buildAuthorcation(
          row['MaGV'].toString(),
          row['TenGV'].toString(),
          row['ChuyenNganh'].toString(),
          row['NamSinh'].toString(),
          row['GioiTinh'].toString(),
          row['CCCD'].toString(),
          row['Email'].toString(),
          row['SoDT'].toString(),
          row['url'].toString(),
          index
        )),
        DataCell(buildActive(
          row['MaGV'].toString(),
          row['TenGV'].toString(),
          row['ChuyenNganh'].toString(),
          row['NamSinh'].toString(),
          row['GioiTinh'].toString(),
          row['CCCD'].toString(),
          row['Email'].toString(),
          row['SoDT'].toString(),
          row['url'].toString(),
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

Widget labelAndAvt(int index, String text,String Masv,String url) {
  return Container(
    alignment: Alignment.centerLeft,
    width: Get.width,
    height: Get.height,
    padding: EdgeInsets.only(left: appPadding * 3),
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: unline)),
      color: index % 2 == 0 ? Colors.grey.withOpacity(0.1) : null,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Get.dialog(
              AlertDialog(
                title: Align(alignment: Alignment.bottomRight,child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Get.back();
                  },
                ),),
                content:FadeInImage(
                  placeholder: AssetImage('assets/images/image_not_found.png'),
                  image: NetworkImage(
                    url,
                  ),
                  imageErrorBuilder: (context, error, stackTrace) => Icon(
                    Icons.person,
                    color: darkTextColor,
                  ),
                  height: Get.height*0.7,
                  width: Get.width*0.5,
                  ),
              )
            );
          },
          child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor
            ),
            child:url!=''?Container(
              // width: 100,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image:DecorationImage(
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) => Icon(
                    Icons.person,
                    color: darkTextColor,
                    size: 40,
                  ),
                  image: NetworkImage(
                    url,
                  ),
                )
              ),
            ):Container(
              height: 100,
              child: Icon(
                Icons.person,
                color: darkTextColor,
                size: 30,
              ),
            )
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: appPadding * 2),
            child: Text(
              text,
              style: AppStyle.textData,
            ))
      ],
    ),
  );
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

Widget image(String text) {
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
Widget buildAuthorcation(
    String ma_giang_vien,
    String ten_giang_vien,
    String chuyen_nganh,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai,
    String url,
    int index) {
  final controller = Get.find<TeacherController>();
  BuildContext? context;
  return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: unline)),
        color: index % 2 == 0 ? Colors.grey.withOpacity(0.1) : null,
      ),
      alignment: Alignment.center,
      child:  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: orange
        ),
        child: Padding(
          padding: EdgeInsets.all(appPadding*0.2),
          child: IconButton(
            tooltip: 'Cấp quyền',
            onPressed: () {
              controller.getListAuthorcation(ma_giang_vien);
              Get.dialog(alertAuthor(ma_giang_vien));
            },
            icon: Icon(Icons.people_alt_outlined),
          ),
        ),
      ),);
}

Widget alertAuthor(
  String ma_giang_vien
){
  
  final controller = Get.find<TeacherController>();
  List filterListOnly = [];
  List finalList = [];
  controller.role.value = 'user';
  return AlertDialog(
    title: Center(child: Text("Danh sách các quyền")),
    content: Obx(() => Container(
      height: Get.height*0.7,
      width: Get.width*0.5,
      child: ListView(
        children: [
          Obx(() => CheckboxListTile(
            title: Text('User'),
            value: !controller.selected.value, 
            onChanged: (value) {
              controller.selected.value = !controller.selected.value;
              controller.switchEnable.value = false;
              controller.role.value = 'user';
            },
          ),),
          Obx(() => CheckboxListTile(
            title: Text('Admin'),
            value: controller.selected.value, 
            onChanged: (value) {
              controller.selected.value = !controller.selected.value; 
              controller.switchEnable.value =true;
              controller.role.value = 'admin';
            },
          )),
          Container(
            padding: EdgeInsets.symmetric(vertical: appPadding,horizontal: appPadding*4),
            height: 500,
            child: ListView.builder(
              itemCount: controller.listGetAuthor.length,
              itemBuilder: (context, index) {
                return Obx(() => CheckboxListTile(
                  title: Text("${controller.listGetAuthor[index].value}"),
                  contentPadding: EdgeInsets.zero,
                  enabled: controller.switchEnable.value,
                  value: controller.listGetAuthor[index].key.value,
                  onChanged: (newValue) {
                    controller.listGetAuthor[index].key.value = newValue ?? false;
                    if(controller.listGetAuthor[index].key.value){
                      filterListOnly.add(controller.listGetAuthor[index].ma_quyen);
                      finalList = filterListOnly.where((device) => device != null)
                                  .toSet()
                                  .toList();
                    }
                    else{
                      finalList.removeWhere((element) => element==controller.listGetAuthor[index].ma_quyen);
                    }
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),);
              },
            ),
          )
        ],
      ),
    ),
    ),
    actions: [
      CustomButtonAlert(
        titileDisable: 'Huỷ',
        titileEnable: 'Lưu',
        onPressedDisable: () => Get.back(),
        onPressedEnable:(){
          Get.back();
          controller.authorPermission(ma_giang_vien, controller.role.value, finalList);
          
        }
      )
    ],
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
    String url,
    int index) {
  final controller = Get.find<TeacherController>();
  BuildContext? context;
  return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: unline)),
        color: index % 2 == 0 ? Colors.grey.withOpacity(0.1) : null,
      ),
      alignment: Alignment.center,
      child: CusstomActiveTable(
        showView: true,
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
                    controller.deleterTeacher(ma_giang_vien);
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
          Get.dialog(view(
            controller,
            ma_giang_vien,
            ten_giang_vien,
            chuyen_nganh,
            ngay_sinh,
            gioi_tinh,
            cccd,
            gmail,
            so_dien_thoai,
            url
          ));
        },
      ));
}

Widget view(
    TeacherController controller,
    String ma_giang_vien,
    String ten_giang_vien,
    String chuyen_nganh,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai,
    String url
){
  controller.pathImageAfterPickfileFromComputer.value=url;
  return AlertDialog(
    title: Center(child: Text("Hồ sơ giảng viên")),
    content: Container(
      height: Get.height*0.7,
      width: Get.width*0.5,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                  height: Get.height,
                  width: Get.width,
                  padding: EdgeInsets.symmetric(vertical: appPadding*3),
                  child: ListView(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(appPadding),
                          child: Text('Ảnh 3x4', style: AppStyle.txtInterRegular18),
                        ),
                      ),
                      Container(
                        height: 300,
                        width: 100,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: textColor,
                            style: BorderStyle.solid,
                          )
                        ),
                        child:
                        Obx(
                          () {
                            // debugPrint('controller.pathImage.value - ${controller.pathImageAfterPickfileFromComputer.value}');
                            return 
                            controller.pathImageAfterPickfileFromComputer.value.isNotEmpty
                                ? Image.network(
                                    controller.pathImageAfterPickfileFromComputer.value,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset("assets/images/image_not_found.png");
                                    },
                                  )
                                : Image.asset("assets/images/image_not_found.png");
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(appPadding*2),
                        child: CustomButtonCommon(
                          title: 'Thư viện',
                          color: colorButton,
                          size:16,
                          icon: Icon(Icons.photo_album),
                          onPressed: () {
                            controller.pickFileWeb();
                          },
                        ))
                    ],
                  ),
                ),
          ),
          Expanded(
            flex: 2,
            child: ListView(
              children: [
                CustomTextDetail(
                  title: TenGV.value,
                  content: ten_giang_vien,
                ),
                CustomTextDetail(
                  title: MaGV.value,
                  content: ma_giang_vien,
                ),
                CustomTextDetail(
                  title: ChuyenNganh.value,
                  content: chuyen_nganh,
                ),
                CustomTextDetail(
                  title: NamSinh.value,
                  content: ngay_sinh,
                ),
                CustomTextDetail(
                  title: GioiTinh.value,
                  content: gioi_tinh,
                ),
                CustomTextDetail(
                  title: CCCD.value,
                  content: cccd,
                ),
                CustomTextDetail(
                  title: Email.value,
                  content: gmail,
                ),
                CustomTextDetail(
                  title: SoDT.value,
                  content: so_dien_thoai,
                ),
              ],
            ),
          )
        ],
      )
    ),
    actions: [
      CustomButtonAlert(
        titileDisable: 'Huỷ',
        titileEnable: 'Lưu',
        onPressedDisable: () => Get.back(),
        onPressedEnable:(){
          controller.uploadAvatar(ma_giang_vien,controller.pickFileFromComputer);
          Get.back();
          Get.dialog(Dialog(
            child: CustomLoading(),
          ));
          Future.delayed(Duration(seconds: 3),() {
            Get.back();
          },);
        }
      )
    ],
  );
}
Widget alertAvt(
  TeacherController controller,
  String ma_giang_vien,
  String ten_giang_vien,
  String chuyen_nganh,
  String ngay_sinh,
  String gioi_tinh,
  String cccd,
  String gmail,
  String so_dien_thoai,
) {
  final _formKey = GlobalKey<FormState>();
  controller.ten_giang_vien.text = ten_giang_vien;
  controller.ma_giang_vien.text = ma_giang_vien;
  controller.chuyen_nganh.text = chuyen_nganh;
  controller.ngay_sinh.text = ngay_sinh;
  controller.gioi_tinh.text = gioi_tinh;
  controller.cccd.text = cccd;
  controller.email.text = gmail;
  controller.so_dien_thoai.text = so_dien_thoai;
  return Form(
    key: _formKey,
    child: CustomAlertAvt(
      title: Center(
          child: Text(
        "Cập nhật thông tin",
        style: AppStyle.txtRobotoRegular20,
      )),
      listTextFiled: ListView(
        children: [
          CustomTextForm(
            enabled: false,
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập mã sinh viên';
              }
            },
            controller: controller.ma_giang_vien,
            label: MaGV.value,
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập tên sinh viên';
              }
            },
            controller: controller.ten_giang_vien,
            label: TenGV.value,
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập khoa';
              }
            },
            controller: controller.chuyen_nganh,
            label: ChuyenNganh.value,
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập ngày sinh';
              }
            },
            controller: controller.ngay_sinh,
            label: NamSinh.value,
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
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập giới tính';
              }
            },
            controller: controller.gioi_tinh,
            label: GioiTinh.value,
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập cccd';
              }
            },
            controller: controller.cccd,
            label: CCCD.value,
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập gmail';
              }
            },
            controller: controller.email,
            label: Email.value,
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập số điện thoại';
              }
            },
            controller: controller.so_dien_thoai,
            label: SoDT.value,
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
          controller.updateTeacher(
              controller.ten_giang_vien.text,
              controller.ma_giang_vien.text,
              controller.chuyen_nganh.text,
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
