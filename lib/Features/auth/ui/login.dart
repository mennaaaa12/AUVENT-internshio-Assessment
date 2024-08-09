import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store/Features/auth/cubit/cubit/auth_cubit.dart';
import 'package:store/Features/auth/ui/widgets/donot_have_register.dart';
import 'package:store/Features/auth/ui/widgets/email_and_password.dart';
import 'package:store/Features/auth/ui/widgets/login_app_bar.dart';
import 'package:store/Features/auth/ui/widgets/login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: BlocProvider(
        create: (context) => BlocProvider.of<AuthCubit>(context),
        child: const Padding(
          padding:  EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
               SizedBox(height: 20),
               EmailAndPassword(),
               SizedBox(height: 20),
               LoginButton(),
               SizedBox(height: 20),
               DontHaveAccountText(),
            ],
          ),
        ),
      ),
    );
  }
}
