import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/controller/student_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/student_management/widget/env_student.dart';
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

class StudentDataTableSource extends DataTableSource {
  StudentDataTableSource({required this.data});
  List<Map<String, dynamic>> data = [];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Map<String, dynamic> row = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(labelAndAvt(index, row['TenSV'].toString(),row['MaSV'].toString(),row['url'].toString())),
        DataCell(label(index, row['MaSV'].toString())),
        DataCell(label(index, row['Khoa'].toString())),
        DataCell(label(index, row['CCCD'].toString())),
        DataCell(buildActive(
          row['MaSV'].toString(),
          row['TenSV'].toString(),
          row['Khoa'].toString(),
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
            height: 40,
            width: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(500 / 2),
                border: Border.all(color: darkTextColor)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(500 / 2),
              child:url.isNotEmpty?
              FadeInImage(
                placeholder: AssetImage('assets/images/image_not_found.png'),
                image: NetworkImage(
                  url,
                ),
                imageErrorBuilder: (context, error, stackTrace) =>Icon(
                    Icons.person,
                    color: darkTextColor,
                  ),
                height: Get.height,
                width: Get.width,
              )
              : FadeInImage(
                  height: Get.height,
                  width: Get.width,
                  fit: BoxFit.cover,
                  placeholder: AssetImage('assets/images/image_not_found.png'),
                  image: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHr-PpS2eEnnDOLRJO6xS2NjvrWFBpVixlnw&usqp=CAU',
                  ),
                  imageErrorBuilder: (context, error, stackTrace) => Icon(
                    Icons.person,
                    color: darkTextColor,
                  )),
            ),
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

Widget buildActive(
    String ma_sinh_vien,
    String ten_sinh_vien,
    String khoa,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai,
    String url,
    int index) {
  final controller = Get.find<StudentController>();
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
          controller.deleterUser(ma_sinh_vien);
          Get.dialog(Dialog(
            child: CustomLoading(),
          ));
          Future.delayed(Duration(seconds: 2),() {
            Get.back();
          },);
        },
        onUpdate: () {
          Get.dialog(alertAvt(
            controller,
            ma_sinh_vien,
            ten_sinh_vien,
            khoa,
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
            ma_sinh_vien,
            ten_sinh_vien,
            khoa,
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
    StudentController controller,
    String ma_sinh_vien,
    String ten_sinh_vien,
    String khoa,
    String ngay_sinh,
    String gioi_tinh,
    String cccd,
    String gmail,
    String so_dien_thoai,
    String url
){
  controller.pathImageAfterPickfileFromComputer.value=url;
  return AlertDialog(
    title: Center(child: Text("Hồ sơ sinh viên")),
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
                  title: TenSV.value,
                  content: ten_sinh_vien,
                ),
                CustomTextDetail(
                  title: MaSV.value,
                  content: ma_sinh_vien,
                ),
                CustomTextDetail(
                  title: Khoa.value,
                  content: khoa,
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
          controller.uploadAvatar(ma_sinh_vien,controller.pickFileFromComputer);
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
  StudentController controller,
  String ma_sinh_vien,
  String ten_sinh_vien,
  String khoa,
  String ngay_sinh,
  String gioi_tinh,
  String cccd,
  String gmail,
  String so_dien_thoai,
) {
  final _formKey = GlobalKey<FormState>();
  controller.ten_sinh_vien.text = ten_sinh_vien;
  controller.ma_sinh_vien.text = ma_sinh_vien;
  controller.khoa.text = khoa;
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
            controller: controller.ma_sinh_vien,
            label: 'Mã sinh viên',
            obscureText: false,
            onChanged: (p0) {},
          ),
          CustomTextForm(
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
          controller.updateUser(
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
