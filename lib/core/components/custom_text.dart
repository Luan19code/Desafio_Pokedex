import 'package:desafio_snapfi/core/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Decoration? decoration;
  final double? width;
  final double? height;
  final String description;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextStyle? style;
  final CustomTextVariant? variant;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? fontColor;
  final void Function()? onTap;

  const CustomText({
    super.key,
    required this.description,
    this.margin,
    this.padding,
    this.decoration,
    this.width,
    this.height,
    this.overflow,
    this.textAlign,
    this.maxLines,
    this.style,
    this.variant,
    this.fontWeight,
    this.fontSize,
    this.fontColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: decoration,
        margin: margin,
        padding: padding,
        child: Text(
          description,
          overflow: overflow,
          textAlign: textAlign,
          maxLines: maxLines,
          style: style ??
              getVariant(
                variant: variant,
                fontWeight: fontWeight,
                fontSize: fontSize,
                fontColor: fontColor,
              ),
        ),
      ),
    );
  }
}

enum CustomTextVariant {
  variant1,
  variant2,
}

TextStyle getVariant({
  CustomTextVariant? variant,
  FontWeight? fontWeight,
  double? fontSize,
  Color? fontColor,
}) {
  switch (variant) {
    case CustomTextVariant.variant1:
      return GoogleFonts.poppins(
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: fontColor ?? CustomColors.white,
      );
    case CustomTextVariant.variant2:
      return GoogleFonts.lato(
        fontSize: fontSize ?? 12,
        fontWeight: fontWeight ?? FontWeight.w400,
        color: fontColor ?? CustomColors.grey,
      );
    default:
      return GoogleFonts.poppins(
        fontSize: fontSize ?? 24,
        fontWeight: fontWeight ?? FontWeight.w700,
        color: fontColor ?? CustomColors.white,
      );
  }
}
