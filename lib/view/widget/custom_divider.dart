import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';
import '../../utils/strings_manager.dart';
import '../../utils/styles_manager.dart';

class AuthDivider extends StatelessWidget {
  const AuthDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
              thickness: 1,
              height: 1,
              color: greyColor,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            AppStrings.or, style: getSemiBoldStyle(color: blackColor),
          ),
        ),
        const Expanded(
            child: Divider(
              thickness: 1,
              height: 1,
              color: greyColor,
            )),
      ],
    );
  }
}

class WidgetDivider extends StatelessWidget {
  const WidgetDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      height: 4.0,
    );
  }
}
