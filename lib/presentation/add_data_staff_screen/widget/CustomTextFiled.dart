
import 'package:do_an_tot_nghiep/presentation/add_data_staff_screen/controller/add_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';


class CustomTextFiled extends StatefulWidget{
     
  CustomTextFiled({
    Key? key,
    this.title,
    this.titlehint,
    this.myController,
    this.width,
    this.title_case,
    this.obscureText,
    this.inputFormatters,
    this.onTap
  }) : super(key: key);
  String? title;
  String? titlehint;
  dynamic width;
  String? title_case;
  bool ? obscureText;
  dynamic inputFormatters;
  dynamic onTap;
  TextEditingController? myController = TextEditingController();
  ValueChanged<String>? onSubmit;
  @override
  State<StatefulWidget> createState()=>_CustomTextFiled();

}
class _CustomTextFiled extends State<CustomTextFiled> {

  final adddataController = Get.find<AddDataController>();
 
  final _formKey = GlobalKey<FormState>();
  bool _submitted = true;
  String _name = '';
  void _submit() {
    setState(() => _submitted = true);
    if (_formKey.currentState!.validate()) {
      widget.onSubmit!(_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),child: Text(widget.title!,style:TextStyle(fontWeight: FontWeight.w600,fontSize: 18),))),
          Container(
            width: widget.width,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
              child: TextFormField(   
                  onTap: widget.onTap,
                  inputFormatters: widget.inputFormatters,
                  obscureText: widget.obscureText!,
                  controller:widget.myController,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  fillColor: Colors.white70),
                  autovalidateMode: _submitted
                  ? AutovalidateMode.onUserInteraction
                  : AutovalidateMode.disabled,
                  validator: (text) {
                    switch (widget.title) {
                      case "EmployeeID":
                            return null;
                      case "Fullname":
                            if (text == null || text.isEmpty) {
                              return 'Can\'t be empty';
                            }
                            if (text.length < 6) {
                              return 'Too short';
                            }
                            return null;
                      case "Nickname":
                            if (text == null || text.isEmpty) {
                              return 'Can\'t be empty';
                            }
                            return null;
                      case "Password":
                            if (text == null || text.isEmpty) {
                              return 'Can\'t be empty';
                            }
                            if (text.length < 4) {
                              return 'Too short';
                            }
                            return null;
                      case "Email":
                            if (text == null || text.isEmpty) {
                              return 'Can\'t be empty';
                            }
                            if (text.length < 4) {
                              return 'Too short';
                            }
                            if(!text.contains("@gmail.com")){
                              return 'Incorrect email format';
                            }
                            return null;                            
                        break;
                      default:
                    }
                  },
                  onChanged: (text) => setState(() => _name = text),
            ),
            ),
          )
        ],
      ),
    );
  }
}