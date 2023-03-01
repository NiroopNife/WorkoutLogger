import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_log/view/auth/widgets/forgot_form.dart';
import 'package:workout_log/view/widget/widget_spacing.dart';

import '../../../utils/assets_manager.dart';
import '../../../utils/color_manager.dart';
import '../../../utils/route_manager.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/styles_manager.dart';
import '../../widget/custom_divider.dart';
import '../../widget/custom_text_field.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController forgotPasswordController;
  final Function() loginFunction;
  final Function() forgotPasswordFunction;
  final Function() googleFunction;

  const LoginForm(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.forgotPasswordController,
      required this.loginFunction,
      required this.forgotPasswordFunction,
      required this.googleFunction})
      : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.65,
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 32.w),
      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(32.w)),
      child: Column(
        children: [
          Text(
            AppStrings.login,
            style: getSemiBoldStyle(color: blackColor),
          ),
          const WidgetHeightSpacing(),
          InputTextField(
              labelText: AppStrings.email, prefixIcon: Icons.email_outlined, controller: widget.emailController),
          const WidgetHeightSpacing(),
          PasswordTextField(
              labelText: AppStrings.password, prefixIcon: Icons.lock_outline, controller: widget.passwordController),
          const WidgetHeightSpacing(),
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0.w))),
                        contentPadding: EdgeInsets.only(top: 10.0.h),
                        content: ForgotForm(
                            controller: widget.forgotPasswordController, onTap: widget.forgotPasswordFunction),
                      );
                    });
              },
              child: Text(AppStrings.forgotPassword),
            ),
          ),
          const WidgetHeightSpacing(),
          ElevatedButton(onPressed: widget.loginFunction, child: Text(AppStrings.login)),
          const WidgetHeightSpacing(),
          const AuthDivider(),
          const WidgetHeightSpacing(),
          GestureDetector(
            onTap: widget.googleFunction,
            child: Image.asset(
              AssetsManager.GoogleLogo,
              fit: BoxFit.contain,
            ),
          ),
          const WidgetHeightSpacing(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.notHavingAccount,
                style: getRegularStyle(color: blackColor),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, Routes.signUpRoute);
                  },
                  child: Text(
                    AppStrings.signUpNow,
                    style: getSemiBoldStyle(color: primaryColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
