import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/components/custom_appbar.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/controller/dashboard_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/config_management/controller/config_controller.dart';
import 'package:do_an_tot_nghiep/presentation/dashboard_screen/page/config_management/widget/config_sources.dart';
import 'package:do_an_tot_nghiep/widgets/custom_table.dart';
import 'package:do_an_tot_nghiep/widgets/custom_widget_action.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_button_alert.dart';
import '../../../../widgets/custom_dropdow_button.dart';
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
  var selectedOptions = '';
  Widget _addNewItem() {
    controller.getTeacherList.map((element) {
      selectedOptions = element.TenGV!;
    },).toList();
    return AlertDialog(
        title: Center(child: Text("Thêm một cấu hình mới")),
        content: Form(
          key: _formKey,
          child: Container(
            height: Get.height*0.7,
            width: Get.width*0.5,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "Name"),
                  validator: (value) => value!.isEmpty ? "Please enter name" : null,
                  onSaved: (value) => _name = value!,
                ),
                CustomDropDownButton(
                  hintText: 'Lựa chọn giảng viên',
                  items: controller.getTeacherList.map((element) => element.TenGV.toString()).toList(),
                  onChangedlistSelect: (p0) {
                    selectedOptions = p0 as String;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: "Description"),
                  onSaved: (value) => _description = value!,
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
            if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                final newItem = Item(
                  id: items.length + 1,
                  name: _name,
                  description: _description,
                );
                setState(() {
                  items.add(newItem);
                });
                Get.back();
              }
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
        child: Text('Bạn có chắc muốn xoá ${item.name} không?')
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
        Expanded(
          flex: 8,
          child: Container(
            height: Get.height,
            width: Get.width,
            padding: EdgeInsets.all(appPadding*3),
            child: GridView.builder(
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) {
                      final item = items[index];
                      return Container(
                        height: 200,
                        width: 200,
                        margin: EdgeInsets.all(appPadding),
                        padding: EdgeInsets.all(appPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: bgColor,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 2,
                              offset: Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(item.name!),
                                  SizedBox(height: 8.0),
                                  Text(item.description!),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    onPressed: () =>_editItem(item),
                                    icon: Icon(Icons.account_box,color: cardA,),
                                    tooltip: 'Chi tiết',
                                  ),
                                  IconButton(
                                    onPressed: () =>_editItem(item),
                                    icon: Icon(Icons.edit,color: cardD,),
                                    tooltip: 'Chỉnh sửa',
                                  ),
                                  IconButton(
                                    onPressed: () =>Get.dialog(_deleteItem(item)),
                                    icon: Icon(Icons.delete,color: cardC,),
                                    tooltip: 'Xoá',
                                  ),
                                ],
                              )
                            ),
                        ],),
                    );
              },
            ),
          ),
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

