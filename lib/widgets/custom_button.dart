import 'package:do_an_tot_nghiep/core/app_export.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.shape, this.padding, this.variant, this.fontStyle, this.alignment, this.onTap, this.width, this.height, this.margin, this.text});

  ButtonShape? shape;

  ButtonPadding? padding;

  ButtonVariant? variant;

  ButtonFontStyle? fontStyle;

  Alignment? alignment;

  VoidCallback? onTap;

  double? width;
  double? height;

  EdgeInsetsGeometry? margin;

  String? text;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: _buildButtonWidget(),
          )
        : _buildButtonWidget();
  }

  _buildButtonWidget() {
    // return InkWell(
    //   onTap: onTap,
    //   child: Container(
    //     width: getHorizontalSize(width ?? 0),
    //     margin: margin,
    //     padding: _setPadding(),
    //     decoration: _buildDecoration(),
    //     child: Text(
    //       text ?? "",
    //       textAlign: TextAlign.center,
    //       style: _setFontStyle(),
    //     ),
    //   ),
    // );
    return TextButton(
      onPressed: onTap,
      child: Container(
        height: height,
        width: getHorizontalSize(width ?? 0),
        margin: margin,
        padding: _setPadding(),
        decoration: _buildDecoration(),
        child: Text(
          text ?? "",
          textAlign: TextAlign.center,
          style: _setFontStyle(),
        ),
      ),
    );
  }

  _buildDecoration() {
    return BoxDecoration(
      color: _setColor(),
      border: _setBorder(),
      borderRadius: _setBorderRadius(),
    );
  }

  _setBorder() {
    switch (variant) {
      case ButtonVariant.OutlineIndigoA400:
        return Border.all(
          color: ColorConstant.indigoA400,
          width: getHorizontalSize(
            1.00,
          ),
        );
      case ButtonVariant.OutlineIndigoA100:
        return Border.all(
          color: ColorConstant.indigoA400,
          width: getHorizontalSize(
            0.10,
          ),
        );
      default:
        return null;
    }
  }

  _setPadding() {
    switch (padding) {
      case ButtonPadding.PaddingAll8:
        return getPadding(
          all: 8,
        );
      case ButtonPadding.PaddingAll3:
        return getPadding(
          all: 3,
        );
      case ButtonPadding.PaddingAll12:
        return getPadding(
          all: 12,
        );
      case ButtonPadding.PaddingAll7:
        return getPadding(
          all: 7,
        );
      default:
        return getPadding(
          all: 5,
        );
    }
  }

  _setColor() {
    switch (variant) {
      case ButtonVariant.OutlineIndigoA400:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillWhiteA700:
        return ColorConstant.whiteA700;
      case ButtonVariant.FillLightblueA700:
        return ColorConstant.lightBlueA700;
      case ButtonVariant.FillIndigoA400:
        return ColorConstant.indigoA400;
      default:
        return ColorConstant.whiteA7007f;
    }
  }

  _setBorderRadius() {
    switch (shape) {
      case ButtonShape.RoundedBorder8:
        return BorderRadius.circular(
          getHorizontalSize(
            8.00,
          ),
        );
      case ButtonShape.CircleBorder16:
        return BorderRadius.circular(
          getHorizontalSize(
            16.00,
          ),
        );
      case ButtonShape.Square:
        return BorderRadius.circular(0);
      default:
        return BorderRadius.circular(
          getHorizontalSize(
            12.00,
          ),
        );
    }
  }

  _setFontStyle() {
    switch (fontStyle) {
      case ButtonFontStyle.InterRegular10:
        return TextStyle(
          color: ColorConstant.gray500C4,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.InterRegular20:
        return TextStyle(
          color: ColorConstant.gray500C4,
          fontSize: getFontSize(
            20,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.InterRegular16:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.InterRegular10Indigo900:
        return TextStyle(
          color: ColorConstant.indigo900,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
      case ButtonFontStyle.InterMedium16:
        return TextStyle(
          color: ColorConstant.indigo800,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterMedium14:
        return TextStyle(
          color: ColorConstant.indigo800,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterMedium14Blue600:
        return TextStyle(
          color: ColorConstant.blue600,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterMedium14Red300:
        return TextStyle(
          color: ColorConstant.red300,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterMedium16WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            16,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      case ButtonFontStyle.InterMedium10WhiteA700:
        return TextStyle(
          color: ColorConstant.whiteA700,
          fontSize: getFontSize(
            10,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
        );
      default:
        return TextStyle(
          color: ColorConstant.indigo800,
          fontSize: getFontSize(
            14,
          ),
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
        );
    }
  }
}

enum ButtonShape {
  Square,
  CircleBorder12,
  CircleBorder16,
  RoundedBorder2,
  RoundedBorder8,
}

enum ButtonPadding {
  PaddingAll7,
  PaddingAll3,
  PaddingAll12,
  PaddingAll5,
  PaddingAll8,
}

enum ButtonVariant {
  OutlineIndigoA400,
  OutlineIndigoA100,
  FillWhiteA7007f,
  FillWhiteA700,
  FillLightblueA700,
  FillIndigoA400,
}

enum ButtonFontStyle {
  InterMedium10WhiteA700,
  InterMedium16WhiteA700,
  InterRegular10Indigo900,
  InterRegular10,
  InterRegular16,
  InterRegular20,
  InterRegular14,
  InterMedium16,
  InterMedium14,
  InterMedium14Blue600,
  InterMedium14Red300,
}
