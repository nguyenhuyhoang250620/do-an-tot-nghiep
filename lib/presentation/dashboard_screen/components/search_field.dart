import 'package:do_an_tot_nghiep/presentation/dashboard_screen/constants/constants.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key,this.texthint}) : super(key: key);
  final String? texthint;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0)
      ),
      child: TextField(
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
          prefixIcon: Icon(Icons.search,color: darkTextColor,)
        ),
      ),
    );
  }
}
