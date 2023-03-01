import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout_log/utils/constants.dart';
import 'package:workout_log/utils/route_manager.dart';
import 'package:workout_log/view/auth/widgets/auth_header.dart';
import 'package:workout_log/view/auth/widgets/sign_up_form.dart';
import 'package:workout_log/view/widget/showMessage.dart';

import '../../provider/auth_provider.dart';
import '../../utils/color_manager.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthProvider? provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<AuthProvider>(context, listen: false);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

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
                    SignUpForm(
                        emailController: emailController,
                        passwordController: passwordController,
                        confirmPasswordController: confirmPasswordController,
                        signUpFunction: () async {
                          if (confirmPasswordController.text.trim() == passwordController.text.trim()) {
                            showDialog(context: context, builder: (_) {
                              return const Center(child: CircularProgressIndicator(),);
                            });
                            try {
                              await provider!.signUpUser(emailController.text, passwordController.text);
                              Navigator.pushReplacementNamed(context, Routes.dashboardRoute);
                            } catch (e) {
                              log(e.toString());
                            }
                          } else {
                            showToastMessage(context, Constants.passwordNotMatch);
                          }
                        },
                        googleFUnction: () async {
                          await provider!.signInWithGoogle();
                          Navigator.pushReplacementNamed(context, Routes.dashboardRoute);
                        },)
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
