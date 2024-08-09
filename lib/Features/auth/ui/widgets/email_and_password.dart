import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/Features/auth/ui/widgets/text_form_field.dart';
import 'package:store/text_widget.dart';
import 'package:store/Features/home/ui/home_page.dart';

final TextEditingController emailcontroller = TextEditingController();
final TextEditingController passcontroller = TextEditingController();
final FocusNode emailFocusNode = FocusNode();
final FocusNode passwordFocusNode = FocusNode();

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = false;
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailcontroller.text;
      final password = passcontroller.text;

      if (email == 'mor_2314' && password == '83r5^_') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      } else {
        if (email != 'mor_2314') {
          emailFocusNode.requestFocus();
        } else if (password != '83r5^_') {
          passwordFocusNode.requestFocus();
        }
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Incorrect email or password.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Align(
              alignment: Alignment.bottomLeft,
              child: TextWidget(
                text: 'Email Address',
              )),
          SizedBox(height: 5.h),
          CustomTextFormField(
            textEditingController: emailcontroller,
            focusNode: emailFocusNode,
           
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          SizedBox(height: 25.h),
          const Align(
              alignment: Alignment.bottomLeft,
              child: TextWidget(
                text: 'Password',
              )),
          SizedBox(height: 5.h),
          CustomTextFormField(
            textEditingController: passcontroller,
            focusNode: passwordFocusNode,
           
            isObScure: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
         
        ],
      ),
    );
  }
}
