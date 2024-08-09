import 'package:flutter/material.dart';
import 'package:store/core/Themes/text_style.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text, this.textStyle});
  final TextStyle? textStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle ?? TextStyles.font12greybold,
    );
  }
}
