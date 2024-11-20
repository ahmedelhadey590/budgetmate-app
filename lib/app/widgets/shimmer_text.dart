import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerText extends StatelessWidget {
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final String text;
  const ShimmerText(
      {required this.text,
      this.fontSize,
      this.fontWeight,
      this.textColor,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white,
      highlightColor: Colors.grey[600]!,
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
