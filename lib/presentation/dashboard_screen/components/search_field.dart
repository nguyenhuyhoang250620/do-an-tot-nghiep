import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key,this.texthint,this.onChanged,this.controller,this.suffixIcon}) : super(key: key);
  final String? texthint;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText:texthint,
          helperStyle: TextStyle(
            color: textColor.withOpacity(0.5),fontSize: 15,
          ),
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
          ),
          prefixIcon: Icon(Icons.search,color: darkTextColor,),
          suffixIcon:suffixIcon 
        ),
      ),
    );
  }
}
