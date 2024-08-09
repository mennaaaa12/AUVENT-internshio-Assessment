import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Features/auth/cubit/cubit/auth_cubit.dart';
import 'package:store/Features/auth/ui/widgets/button.dart';
import 'package:store/Features/auth/ui/widgets/email_and_password.dart';
import 'package:store/Features/home/ui/home_page.dart';
import 'package:store/Themes/text_style.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = emailcontroller.text;
      final password = passcontroller.text;
print(' this isss ${email} and ${password}');
      if (email == 'mor_2314' && password == '83r5^_') {
        print(' this isss ${email} and ${password}');
        BlocProvider.of<AuthCubit>(context).login(email, password);
      } else {
        if (email != 'mor_2314') {
          emailFocusNode.requestFocus();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Incorrect email.'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (password != '83r5^_') {
          passwordFocusNode.requestFocus();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Incorrect password.'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          // Show loading indicator or a snackbar if needed
        } else if (state is AuthLoaded) {
          // Navigate to HomePage when login is successful
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else if (state is AuthError) {
          // Show an error message if login fails
          CustomSnackbar.showError(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: AppTextButton(
            buttonText: state is AuthLoading ? 'Loading...' : 'Login',
            textStyle: TextStyles.font12semiboldwhit,
            onPressed: state is AuthLoading ? null : _login,
          ),
        );
      },
    );
  }
}

class CustomSnackbar {
  static void showError(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
