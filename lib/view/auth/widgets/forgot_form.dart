import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/color_manager.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/styles_manager.dart';
import '../../widget/custom_text_field.dart';
import '../../widget/widget_spacing.dart';

class ForgotForm extends StatelessWidget {

  final TextEditingController controller;
  final Function() onTap;

  const ForgotForm({Key? key, required this.controller, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.lock, size: 18.w,),
                  const WidgetWidthSpacing(),
                  Text(
                    AppStrings.forgotPassword,
                    style: getBoldStyle(color: blackColor, fontSize: 18.sp),
                  ),
                ],
              ),
              const WidgetHeightSpacing(),
              Text(AppStrings.forgotPasswordDesc, style: getMediumStyle(color: greyColor),),
              const WidgetHeightSpacing(),
              InputTextField(
                  labelText: AppStrings.email,
                  prefixIcon: Icons.email_outlined,
                  controller: controller),
            ],
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32.0.w), bottomRight: Radius.circular(32.0.w)),
            ),
            child: Text(
              AppStrings.SUBMIT,
              style: getSemiBoldStyle(color: whiteColor),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
