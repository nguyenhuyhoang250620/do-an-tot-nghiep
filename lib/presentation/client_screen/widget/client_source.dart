
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../widgets/custom_active_table.dart';
import '../../../widgets/custom_alert.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_button_alert.dart';
import '../../../widgets/custom_loading.dart';
import '../../../widgets/custom_text_detail.dart';
import '../../../widgets/custom_textfiled.dart';
import '../../dashboard_screen/constants/constants.dart';
import '../../dashboard_screen/page/student_management/widget/env_student.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

class ClientDataTableSource extends DataTableSource {
  ClientDataTableSource({required this.data});
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
                        child:Container()
                        // Obx(
                        //   () {
                        //     // debugPrint('controller.pathImage.value - ${controller.pathImageAfterPickfileFromComputer.value}');
                        //     return 
                        //     controller.pathImageAfterPickfileFromComputer.value.isNotEmpty
                        //         ? Image.network(
                        //             controller.pathImageAfterPickfileFromComputer.value,
                        //             errorBuilder: (context, error, stackTrace) {
                        //               return Image.asset("assets/images/image_not_found.png");
                        //             },
                        //           )
                        //         : Image.asset("assets/images/image_not_found.png");
                        //   },
                        // ),
                      ),
                      Container(
                        padding: EdgeInsets.all(appPadding*2),
                        child: CustomButtonCommon(
                          title: 'Thư viện',
                          color: colorButton,
                          size:16,
                          icon: Icon(Icons.photo_album),
                          // onPressed: () {
                          //   controller.pickFileWeb();
                          // },
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
            }, currentTime: DateTime.now(), locale: LocaleType.vi),
          ),
          CustomTextForm(
            validator: (p0) {
              if (p0 == null || p0.isEmpty) {
                return 'Vui lòng nhập giới tính';
              }
            },
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
          Get.back();
        }
      },
    ),
  );
}
