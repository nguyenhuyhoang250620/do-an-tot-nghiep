
import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/client_screen/client_page/statis_screen/statuis_controller/statis_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../../../../../widgets/custom_active_table.dart';
import '../../../../../widgets/custom_button_alert.dart';
import '../../../../../widgets/custom_loading.dart';
import '../../../../dashboard_screen/constants/constants.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

class StatisDataTableSource extends DataTableSource {
  StatisDataTableSource({required this.data});
  List<Map<String, dynamic>> data = [];

  int _selectedCount = 0;

  @override
  DataRow getRow(int index) {
    final Map<String, dynamic> row = data[index];
     final controller = Get.find<StatisController>();
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(labelAndAvt(index, row['TenSV'].toString(),row['MaSV'].toString(),row['url'].toString())),
        DataCell(label(index, row['MaSV'].toString())),
        DataCell(label(index, row['DiemChuyenCan'].toString(),)),
        DataCell(label(index, row['DiemGiuaKi'].toString(),)),
        DataCell(label(index, row['DiemCuoiKi'].toString(),)),
        DataCell(label(index, row['DiemTrungBinh'].toString())),
        DataCell(buildActive(
          row['url'].toString(),
          row['TenSV'].toString(),
          row['MaSV'].toString(),
          row['DiemChuyenCan'].toString(),
          row['DiemGiuaKi'].toString(),
          row['DiemCuoiKi'].toString(),
          row['DiemTrungBinh'].toString(),
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
    alignment: Alignment.center,
    padding: EdgeInsets.only(left: appPadding * 3),
    width: Get.width,
    height: Get.height,
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: unline)),
      color: index % 2 == 0 ? Colors.grey.withOpacity(0.1) : null,
    ),
    child: Text(
      text=='NaN'||text==''?'-':text,
      style: AppStyle.txtInterRegular12
          .copyWith(color: Colors.black, fontSize: 12),
    ),
  );
}


Widget buildActive(
    String url,
    String ten_sinh_vien,
    String ma_sinh_vien,
    String diem_chuyen_can,
    String diem_giua_ki,
    String diem_cuoi_ki,
    String diem_trung_binh,
    int index) {
  BuildContext? context;
  final controller = Get.find<StatisController>();
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
                    Get.dialog(Dialog(
                      child: CustomLoading(),
                    ));
                    controller.deleteStudent(
                      'phan_van_tien',
                      ma_sinh_vien
                    );
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
          Get.dialog(buildUpdate(
            url,
            ten_sinh_vien,
            ma_sinh_vien,
            diem_chuyen_can,
            diem_giua_ki,
            diem_cuoi_ki,
            diem_trung_binh,
            index,
            controller
            ));
        },
      ));
}
Widget buildUpdate(
    String url,
    String ten_sinh_vien,
    String ma_sinh_vien,
    String diem_chuyen_can,
    String diem_giua_ki,
    String diem_cuoi_ki,
    String diem_trung_binh,
    int index,
    StatisController controller
){
  diem_chuyen_can == ''?controller.diem_chuyen_can.text ='-':controller.diem_chuyen_can.text = diem_chuyen_can;
  diem_giua_ki==''? controller.diem_giua_ki.text='-':controller.diem_giua_ki.text=diem_giua_ki;
  diem_cuoi_ki==''?controller.diem_cuoi_ki.text='-' :controller.diem_cuoi_ki.text=diem_cuoi_ki;
  return 
    AlertDialog(
      content: Container(
        width: Get.width,
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Text('$url'),
            Container(
              padding: EdgeInsets.all(appPadding),
              margin: EdgeInsets.all(appPadding),
              child: Row(
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
                  Text('$ten_sinh_vien')
                ],
              )),
            Container(
              padding: EdgeInsets.all(appPadding),
              margin: EdgeInsets.all(appPadding),
              child: ma_sinh_vien==''?Text('-'):Text('$ma_sinh_vien')),
            Container(
              width: 40,
              padding: EdgeInsets.all(appPadding),
              margin: EdgeInsets.all(appPadding),
              child: TextField(
                controller: controller.diem_chuyen_can,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
        
                ),
              ),),
            Container(
              width: 40,
              padding: EdgeInsets.all(appPadding),
              margin: EdgeInsets.all(appPadding),
              child: TextField(
                controller: controller.diem_giua_ki,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
        
                ),
              ),),
            Container(
              width: 40,
              padding: EdgeInsets.all(appPadding),
              margin: EdgeInsets.all(appPadding),
              child: TextField(
                controller: controller.diem_cuoi_ki,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                
                ),
              ),),
          ],
        ),
      ),
      actions: [
        CustomButtonAlert(
          titileDisable: 'Huỷ',
          titileEnable: 'Lưu',
          onPressedDisable: () => Get.back(),
          onPressedEnable: () {
            Get.back();
            Get.dialog(Dialog(
              child: CustomLoading(),
            ));
            controller.createPoint(
              'phan_van_tien',
              ma_sinh_vien,
              controller.diem_chuyen_can.text,
              controller.diem_giua_ki.text,
              controller.diem_cuoi_ki.text,
              controller.diem_trung_binh.text
            );
            Future.delayed(Duration(seconds: 2),() {
              Get.back();
            },);
          },
        )
      ],
    );
}
