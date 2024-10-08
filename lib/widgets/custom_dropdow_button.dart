import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../theme/app_style.dart';

class CustomDropDownButton extends StatelessWidget{
  CustomDropDownButton({this.items,this.hintText,this.onChangedlistSelect,this.icon});
  final String? hintText;
  final Function(dynamic)? onChangedlistSelect;
  final Widget?icon;
  List<DropdownMenuItem<dynamic>>? items;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: icon,
            labelStyle: AppStyle.txtInterRegular18.copyWith(color: darkTextColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide.none,
            ),
          ),
          items: items,
          buttonDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
          ),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
          ),
          style: AppStyle.textData.copyWith(color: Colors.black),
          // controller.selectedGioiTinh.value,
          isDense: true,
          onChanged:onChangedlistSelect,
          // (value) {
          //     // debugPrint('TungVD: selectedFormType - $value');
          //   controller.selectedGioiTinh.value = value as String;
          // },
        );
  }

}
