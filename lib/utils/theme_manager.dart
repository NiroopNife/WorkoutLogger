import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:workout_log/utils/color_manager.dart';
import 'package:workout_log/utils/styles_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(

      // Main colors of the App
      primaryColor: primaryColor,
      primaryColorDark: primaryDarkColor,
      primaryColorLight: primaryLightColor,
      disabledColor: disabledColor,
      splashColor: primaryColor.withOpacity(.7),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: greyColor),

      // Card view theme
      cardTheme: const CardTheme(color: whiteColor, shadowColor: greyColor, elevation: 4),

      // Appbar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: primaryColor,
        elevation: 4,
        shadowColor: primaryColor.withOpacity(.7),
        titleTextStyle: getRegularStyle(color: whiteColor, fontSize: 16.sp),
      ),

      // Button theme
      buttonTheme: ButtonThemeData(
          shape: const StadiumBorder(),
          disabledColor: disabledColor,
          buttonColor: primaryColor,
          splashColor: primaryColor.withOpacity(.7)),

      // Elevated Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              textStyle: getRegularStyle(color: whiteColor),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.w)))),

      // Text Button theme
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: primaryColor.withOpacity(0.7), textStyle: getSemiBoldStyle(color: primaryColor))),

      // Text theme
      textTheme: TextTheme(
          displayLarge: getSemiBoldStyle(color: whiteDarkColor), 
          bodyMedium: getMediumStyle(color: greyColor),
          bodyLarge: getRegularStyle(color: whiteDarkColor)),

      // Input decoration theme (text form field)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(8.w),
        hintStyle: getRegularStyle(color: greyColor),
        labelStyle: getRegularStyle(color: primaryColor.withOpacity(0.7)),
        errorStyle: getRegularStyle(color: redColor),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: greyColor), borderRadius: BorderRadius.all(Radius.circular(12.w))),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor), borderRadius: BorderRadius.all(Radius.circular(12.w))),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: redColor), borderRadius: BorderRadius.all(Radius.circular(12.w))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: redColor), borderRadius: BorderRadius.all(Radius.circular(12.w))),
      ));
}
