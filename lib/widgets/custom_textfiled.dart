import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

import '../theme/app_style.dart';

// ignore: must_be_immutable
class CustomTextForm extends StatelessWidget {
  CustomTextForm(
      {super.key,
      this.labelTop,
      this.paddingTop,
      this.controller,
      this.validator,
      this.onChanged,
      required this.obscureText,
      this.prefixIcon,
      this.suffixIcon,
      this.colorBorder = Colors.blue, required this.label,
      this.ontap,
      this.enabled
      });
  final String? labelTop;
  final double? paddingTop;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  bool obscureText = false;
  Widget? prefixIcon;
  Widget? suffixIcon;
  Color colorBorder;
  final String label;
  final VoidCallback? ontap;
  final bool? enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //check if labelTop!=null to show Text top
        if (labelTop != null) ...[
          Container(
            padding: EdgeInsets.only(top: paddingTop!),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                labelTop!,
                style: AppStyle.txtInterMedium12.copyWith(color: context.theme.colorScheme.onBackground),
              ),
            ),
          ),
        ],
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: TextFormField(
            onTap: ontap,
            enabled: enabled,
            obscureText: obscureText,
            onChanged: onChanged,
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: prefixIcon,
              prefixIcon: suffixIcon,
              labelText: label,
              fillColor: context.theme.colorScheme.onBackground,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                  color: Colors.blueAccent,
                  width: 2.0,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: BorderSide(
                  color: context.theme.dividerColor,
                  width: 1.0,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 1.0,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4.0),
                borderSide: const BorderSide(
                  color: Colors.red,
                  width: 2.0,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
