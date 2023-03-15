import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/data/models/config_models.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/config_management/controller/config_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/config_management/widget/config_sources.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_textfiled.dart';
import 'package:do_an_tot_nghiep/widgets/custom_widget_action.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../../data/models/user_models.dart';
import '../../../../widgets/custom_button_alert.dart';
import '../../../../widgets/custom_dropdow_button.dart';
import '../../../../widgets/custom_widget_row.dart';
import 'model/config_models.dart';

class ConfigManagement extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ConfigState();
  }
}
class ConfigState extends State<ConfigManagement>{
 List<Item> items = [
    Item(id: 1, name: "Item 1", description: "Description 1"),
    Item(id: 2, name: "Item 2", description: "Description 2"),
    Item(id: 3, name: "Item 3", description: "Description 3"),
  ];

  final _formKey = GlobalKey<FormState>();
  int? _selectedItemId;
  String? _name;
  String? _description;
  final controller = Get.find<DashBoardController>();
  final configController = Get.find<ConfigController>();
  var selectedOptions = '';
  Widget _addNewItem() {
    controller.getTeacherList.map((element) {
      selectedOptions = element.TenGV!;
    },).toList();
    final _items = controller.getUserList
    .map((element) => MultiSelectItem<UserModel>(element, element.TenSV!))
    .toList();
    return AlertDialog(
        title: Center(child: Text("Thêm một cấu hình mới")),
        content: Form(
          key: _formKey,
          child: Container(
            height: Get.height*0.7,
            width: Get.width*0.5,
            child: ListView(
              children: [
                CustomTextForm(
                  label: 'Tên cấu hình',
                  obscureText: false,
                  suffixIcon:Icon(Icons.near_me),
                  controller: configController.ten_cau_hinh,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkTextColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  child: CustomDropDownButton(   
                    icon: Icon(Icons.person),             
                    hintText: 'Lựa chọn giảng viên',
                    items:controller.getTeacherList.map((e) => _childDropDownItem(e.TenGV!,e.MaGV!)).toList(),
                    onChangedlistSelect: (p0) {
                      configController.ma_giang_vien.value = p0 as String;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkTextColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  child: CustomDropDownButton(
                    icon: Icon(Icons.class_),  
                    hintText: 'Lựa chọn phòng ban',
                    items: controller.getDepartmentList.map((e) => _childDropDownItem(e.TenDV!,e.MaDV!)).toList(),
                    onChangedlistSelect: (p0) {
                      configController.ma_phong_ban.value = p0 as String;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                 Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkTextColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                   child: CustomDropDownButton(
                    icon: Icon(Icons.room), 
                    hintText: 'Lựa chọn phòng học',
                    items: controller.getClassList.map((e) => _childDropDownItem(e.TenPhong!,e.MaPhong!)).toList(),
                    onChangedlistSelect: (p0) {
                      configController.ma_phong_hoc.value = p0 as String;
                    },
                                 ),
                 ),
                 SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkTextColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  child: CustomDropDownButton(
                    icon: Icon(Icons.lock_clock), 
                    hintText: 'Lựa chọn ca học',
                    items: controller.getShiftList.map((e) => _childDropDownItem(e.TenCa!,e.MaCa!)).toList(),
                    onChangedlistSelect: (p0) {
                      configController.ma_ca.value = p0 as String;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkTextColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  child: CustomDropDownButton(
                    icon: Icon(Icons.subject), 
                    hintText: 'Lựa chọn môn dậy ',
                    items: controller.getSubjectList.map((e) => _childDropDownItem(e.TenHocPhan!,e.MaHocPhan!)).toList(),
                    onChangedlistSelect: (p0) {
                      configController.ma_hoc_phan.value = p0 as String;
                    },
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: darkTextColor.withOpacity(0.2)),
                    borderRadius: BorderRadius.circular(4.0)
                  ),
                  child: MultiSelectDialogField<UserModel>(
                    items: _items,
                    title: Text("Nhân viên"),
                    selectedColor: context.theme.colorScheme.onSurface,
                    searchable: true,
                    searchTextStyle: TextStyle(color: darkTextColor),
                    itemsTextStyle: TextStyle(color: darkTextColor),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      border: Border.all(
                        color: context.theme.colorScheme.onBackground,
                        width: 1,
                      ),
                    ),
                    buttonIcon: Icon(
                      Icons.person_add,
                    ),
                    buttonText: Text(
                      "Chọn sinh viên",
                      style: TextStyle(
                        color:  darkTextColor.withOpacity(0.6),
                        fontSize: 16,
                      ),
                    ),
                    chipDisplay:MultiSelectChipDisplay(
                      scroll: true,
                      scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                
                    ),
                    onSelectionChanged: (p0) {
                    },
                    onConfirm: (results) {
                      results.map((e) {
                        configController.danh_sach_sinh_vien.add(e.MaSV!);
                      }).toList();
                      // controller.listEmployees = results;
                    },
                  ),
                ),
                CustomTextForm(
                  label: 'Ghi chú',
                  obscureText: false,
                  suffixIcon: Icon(Icons.note),
                  controller: configController.ghi_chu,
                ),
              ],
            ),
          ),
        ),
        actions: [
          CustomButtonAlert(
            titileDisable: 'Huỷ',
            titileEnable: 'Thêm',
            onPressedDisable: () => Get.back(),
            onPressedEnable: () {
                configController.createConfig(
                  configController.ten_cau_hinh.text,
                  configController.ma_giang_vien.value,
                  configController.ma_phong_ban.value,
                  configController.ma_phong_hoc.value,
                  configController.ma_ca.value,
                  configController.ma_hoc_phan.value,
                  configController.danh_sach_sinh_vien,
                  configController.ghi_chu.text,
                );
                Get.back();
              },
          )
        ],
      );
  }

  void _editItem(Item item) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Edit Item"),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                initialValue: item.name,
                decoration: InputDecoration(labelText: "Name"),
                validator: (value) => value!.isEmpty ? "Please enter name" : null,
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                initialValue: item.description,
                decoration: InputDecoration(labelText: "Description"),
                onSaved: (value) =>_description = value!,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final editedItem = Item(
                  id: item.id,
                  name: _name,
                  description: _description,
                );
                setState(() {
                  final index = items.indexWhere((element) => element.id == item.id);
                  items[index] = editedItem;
                });
                Navigator.pop(context);
              }
            },
          child: Text("Save"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
        ],
      ),
    );    
  }

Widget _deleteItem(Item item) {
  return Container(
    height: 100,
    width: 100,
    child: AlertDialog(
      title: Center(child: Text("Delete")),
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
            setState(() {
              items.removeWhere((element) => element.id == item.id);
            });
            Get.back();
          },
        )
      ],
    ),
  );
}
Widget _view(List<ConfigModel> item,int index){
  return AlertDialog(
      title: Center(child: Text("Delete")),
      content: Container(
        height: 600,
        width: 800,
        child: ListView.builder(
          itemCount: item.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Text("${item[index].cccd}"),
                Text("${item[index].maca.MaCa}"),
                Text("${item[index].maca.TenCa}"),
                Text("${item[index].madv.TenDV}"),
                Text("${item[index].magv.TenGV}"),
                Text("${item[index].mahocphan.TenHocPhan}"),
                Text("${item[index].maphong.TenPhong}"),
              ],
            );
          },
        ),
      ),
      actions: [
        CustomButtonAlert(
          titileDisable: 'Huỷ',
          titileEnable: 'Xong',
          onPressedDisable: () => Get.back(),
          onPressedEnable: () => Get.back(),
        )
      ],
    );
}

@override
Widget build(BuildContext context) {
return Scaffold(
  body:Container(
    height: Get.height,
    width: Get.width,
    padding: EdgeInsets.all(appPadding*2),
    child: Column(
      children: [
        CustomAppbar(),
        Divider(),
        Expanded(
          flex: 2,
          child: CustomWidgetAction(),
        ),
        Container(
          height: 50,
          width: Get.width,
          margin: EdgeInsets.all(appPadding*3),
          color: darkTextColor.withOpacity(0.1),
          child: Center(child: Text("Danh sách giảng dạy",style: AppStyle.txtInterMedium24,),),
        ),
        Expanded(
          flex: 8,
          child: Obx(() => Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.all(appPadding*3),
            child: GridView.builder(
              itemCount: controller.getConfigList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 450,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1
                  ),
                  itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        margin: EdgeInsets.all(appPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: bgColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(decoration: BoxDecoration(color: cardD,borderRadius: BorderRadius.only(topLeft: Radius.circular(8.0),topRight: Radius.circular(8.0)),),),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(height: 30.0),
                                      Text(controller.getConfigList.value[index].tenGV,style: AppStyle.txtInterMedium24,),
                                      SizedBox(height: 15.0),
                                      CustomWidgetRow(
                                        left: Icon(Icons.email),
                                        right: Text(controller.getConfigList.value[index].email),
                                        distance: 15,
                                        paddingLeft: appPadding*4,
                                      ),
                                      SizedBox(height: 15.0),
                                      CustomWidgetRow(
                                        left: Icon(Icons.qr_code_2),
                                        right: Text(controller.getConfigList.value[index].maGV),
                                        distance: 15,
                                        paddingLeft: appPadding*4,
                                      ),
                                      SizedBox(height: 15.0),
                                      CustomWidgetRow(
                                        left: Icon(Icons.phone),
                                        right: Text(controller.getConfigList.value[index].soDT),
                                        distance: 15,
                                        paddingLeft: appPadding*4,
                                      ),
                                      SizedBox(height: 15.0),
                                      CustomWidgetRow(
                                        left: Icon(Icons.subject),
                                        right: Text(controller.getConfigList.value[index].chuyenNganh),
                                        distance: 15,
                                        paddingLeft: appPadding*4,
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                        onPressed: () =>Get.dialog(_view(controller.getConfigList.value,index)),
                                        icon: Icon(Icons.account_box,color: cardA,size: 35,),
                                        tooltip: 'Chi tiết',
                                      ),
                                      IconButton(
                                        onPressed: () =>_editItem(item),
                                        icon: Icon(Icons.edit,color: cardD,size: 35),
                                        tooltip: 'Chỉnh sửa',
                                      ),
                                      IconButton(
                                        onPressed: () =>Get.dialog(_deleteItem(item)),
                                        icon: Icon(Icons.delete,color: cardC,size: 35),
                                        tooltip: 'Xoá',
                                      ),
                                    ],
                                  )
                                ),
                            ],),
                            Positioned(
                              left: 100,
                              right: 100,
                              top: 12,
                              child: Container(
                                padding: EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: bgColor
                                ),
                                child: controller.getConfigList.value[index].url!=''?Container(
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
                                        controller.getConfigList.value[index].url,
                                      ),
                                    )
                                  ),
                                ):Container(
                                  height: 100,
                                  child: Icon(
                                    Icons.person,
                                    color: darkTextColor,
                                    size: 60,
                                  ),
                                )
                              ),
                            ),
                          ],
                        )
                    );
              },
            ),
          ),)
        )
      ],
    ),
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () => Get.dialog(_addNewItem()),
    child: Icon(Icons.add),
    tooltip: 'Thêm cấu hình mới',
  ));  
  }
}
DropdownMenuItem _childDropDownItem(String title,String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(
      title,
      style: AppStyle.textData,
    ),
  );
}

