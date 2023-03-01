import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/assets_manager.dart';
import '../../../utils/color_manager.dart';
import '../../../utils/strings_manager.dart';
import '../../../utils/styles_manager.dart';
import '../../widget/widget_spacing.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2,
      width: double.infinity,
      padding: EdgeInsets.all(50.w),
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60.w), bottomRight: Radius.circular(60.w))),
      child: Column(
        children: [
          SizedBox(
            child: Image.asset(
              AssetsManager.AppLogo,
              scale: 1.5,
            ),
          ),
          const WidgetHeightSpacing(),
          Text(AppStrings.appSubTitle, style: getBoldStyle(color: Colors.white), textAlign: TextAlign.center,),
          const WidgetDoubleHeightSpacing(),
        ],
      ),
    );
  }
}
