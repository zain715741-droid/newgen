import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final List<Shadow>? shadows;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;

  const CustomText({super.key, required this.text, this.style, this.textAlign, this.overflow, this.shadows, required this.color, required this.fontSize, required this.fontWeight, });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ?? TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}