import 'package:desafio_snapfi/core/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomSVGPicture extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Decoration? decoration;
  final double? widthContainer;
  final double? heightContainer;
  final double? widthSVG;
  final double? heightSVG;
  final double? size;
  final String ulr;
  final void Function()? onTap;

  const CustomSVGPicture({
    super.key,
    required this.ulr,
    this.margin,
    this.padding,
    this.decoration,
    this.size,
    this.widthContainer,
    this.heightContainer,
    this.widthSVG,
    this.heightSVG,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: heightContainer,
        width: widthContainer,
        decoration: decoration,
        margin: margin,
        padding: padding,
        child: SvgPicture.asset(
          ulr,
          height: size ?? heightSVG,
          width: size ?? widthSVG,
          placeholderBuilder: (context) {
            return Container(
              height: size ?? heightSVG,
              width: size ?? widthSVG,
              color: CustomColors.transparent,
            );
          },
        ),
      ),
    );
  }
}
