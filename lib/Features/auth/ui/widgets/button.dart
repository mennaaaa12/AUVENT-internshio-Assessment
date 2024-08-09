import 'package:flutter/material.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;  // Nullable function

  const AppTextButton({
    super.key,
    required this.buttonText,
    this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
        backgroundColor: WidgetStateProperty.all<Color>(
          Colors.yellow,
        ),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 14,
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          const Size(double.maxFinite, 60),
        ),
      ),
      onPressed: onPressed,  // This can now be null
      child: Text(
        buttonText,
        style: textStyle,
      ),
    );
  }
}
