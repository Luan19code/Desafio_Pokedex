import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Decoration? decoration;
  final double? widthContainer;
  final double? heightContainer;
  final double? size;
  final Color? color;
  final IconData ulr;
  final void Function()? onTap;

  const CustomIcon({
    super.key,
    required this.ulr,
    this.margin,
    this.padding,
    this.decoration,
    this.size,
    this.widthContainer,
    this.heightContainer,
    this.color,
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
        child: Icon(
          ulr,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
