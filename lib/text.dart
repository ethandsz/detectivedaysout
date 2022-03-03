import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class NewText extends StatelessWidget {
  final String? text;
  final double? size;
  final FontWeight? fontWeight;
  final Color? color;
  final double? wordSpacing;

  const NewText({
    @required this.text,
    this.size,
    this.fontWeight,
    this.color,
    this.wordSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Text(
      text!,
      style: TextStyle(
        fontSize: size ?? 16,
        fontWeight: fontWeight ?? FontWeight.w500,
        color: color ?? Colors.black87,
        wordSpacing: wordSpacing,
      ),
    ));
  }
}
