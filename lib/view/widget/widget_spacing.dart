import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetHeightSpacing extends StatelessWidget {
  const WidgetHeightSpacing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
    );
  }
}

class WidgetDoubleHeightSpacing extends StatelessWidget {
  const WidgetDoubleHeightSpacing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
    );
  }
}

class WidgetWidthSpacing extends StatelessWidget {
  const WidgetWidthSpacing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10.w,
    );
  }
}
