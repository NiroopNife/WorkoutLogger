import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/assets_manager.dart';
import '../../../utils/color_manager.dart';
import '../../../utils/route_manager.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/styles_manager.dart';
import '../../widget/custom_divider.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/widget_spacing.dart';

class SignUpForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final Function() signUpFunction;
  final Function() googleFUnction;

  const SignUpForm(
      {Key? key,
      required this.emailController,
      required this.passwordController,
      required this.confirmPasswordController,
      required this.signUpFunction,
      required this.googleFUnction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 1.7,
      margin: EdgeInsets.all(20.w),
      padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 32.w),
      decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(32.w)),
      child: Column(
        children: [
          Text(
            AppStrings.signUp,
            style: getSemiBoldStyle(color: blackColor),
          ),
          const WidgetHeightSpacing(),
          InputTextField(labelText: AppStrings.email, prefixIcon: Icons.email_outlined, controller: emailController),
          const WidgetHeightSpacing(),
          PasswordTextField(
              labelText: AppStrings.password, prefixIcon: Icons.lock_outline, controller: passwordController),
          const WidgetHeightSpacing(),
          InputTextField(
              labelText: AppStrings.confirmPassword, prefixIcon: Icons.lock_outline, controller: confirmPasswordController),
          const WidgetHeightSpacing(),
          ElevatedButton(onPressed: signUpFunction, child: Text(AppStrings.signUp)),
          const WidgetHeightSpacing(),
          const AuthDivider(),
          const WidgetHeightSpacing(),
          GestureDetector(
            onTap: googleFUnction,
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
                AppStrings.havingAccount,
                style: getRegularStyle(color: blackColor),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.login,
                    style: getSemiBoldStyle(color: primaryColor),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
