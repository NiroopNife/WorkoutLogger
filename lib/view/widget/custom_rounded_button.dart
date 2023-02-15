import 'package:flutter/material.dart';
import 'package:workout_log/utils/color_manager.dart';
import 'package:workout_log/utils/value_manager.dart';

class CustomRoundedButton extends StatelessWidget {
  final String title;
  VoidCallback? onPressed;
  Color? buttonColor;
  Color? disabledButtonColor;
  Color? textColor;
  Color? disabledTextColor;
  bool? isLoading;
  BorderRadiusGeometry? borderRadius;

  CustomRoundedButton(
      {Key? key,
      required this.title,
      this.onPressed,
      this.isLoading,
      this.borderRadius,
      this.buttonColor = primaryColor,
      this.textColor = whiteColor,
      this.disabledButtonColor = disabledColor,
      this.disabledTextColor = disabledColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          elevation: 0,
          minimumSize: const Size(120, 50),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(AppValues.roundedBorder))),
          backgroundColor: buttonColor,
          foregroundColor: textColor,
          disabledForegroundColor: disabledTextColor,
          disabledBackgroundColor: disabledButtonColor,
          side: BorderSide(
              color: onPressed == null ? (disabledButtonColor ?? disabledColor) : (buttonColor ?? primaryColor))),
      child: (isLoading ?? false)
          ? const SizedBox(width: 24, height: 24, child: CircularProgressIndicator())
          : AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final inAnimation =
                    Tween<Offset>(begin: const Offset(0.0, 1.0), end: const Offset(0.0, 0.0)).animate(animation);
                final outAnimation =
                    Tween<Offset>(begin: const Offset(0.0, -1.0), end: const Offset(0.0, 0.0)).animate(animation);

                if (child.key == ValueKey(title)) {
                  return ClipRect(
                    child: SlideTransition(
                      position: inAnimation,
                      child: child,
                    ),
                  );
                } else {
                  return ClipRect(
                    child: SlideTransition(
                      position: outAnimation,
                      child: child,
                    ),
                  );
                }
              },
              child: KeyedSubtree(
                key: ValueKey(title),
                child: Text(title),
              ),
            ),
    );
  }
}
