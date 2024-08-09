import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:store/Themes/text_style.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account ?',
            style: TextStyles.font12greybold,
          ),
          TextSpan(
              text: ' Register',
              style: TextStyles.font12greenbold,
              recognizer: TapGestureRecognizer()..onTap = () {}),
        ],
      ),
    );
  }
}
