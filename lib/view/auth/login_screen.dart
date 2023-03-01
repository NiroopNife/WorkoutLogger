import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/provider/auth_provider.dart';
import 'package:workout_log/utils/color_manager.dart';
import 'package:workout_log/view/auth/widgets/auth_header.dart';
import 'package:workout_log/view/auth/widgets/login_form.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthProvider? provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final forgotPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: blackColor,
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            const AuthHeader(),
            SingleChildScrollView(
              child: SizedBox(
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LoginForm(
                      emailController: emailController,
                      passwordController: passwordController,
                      forgotPasswordController: forgotPasswordController,
                      loginFunction: () async {
                        await provider!.signInUser(emailController.text, passwordController.text, context);
                      },
                      forgotPasswordFunction: () async {
                        await provider!.forgotPassword(forgotPasswordController.text, context);
                      },
                      googleFunction: () async {
                        await provider!.signInWithGoogle();
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
