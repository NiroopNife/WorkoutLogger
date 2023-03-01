import 'package:flutter/material.dart';
import 'package:workout_log/model/choice_chip_model.dart';

class Constants {

  static const String username = "Username";
  static const String email = "Email";
  static const String password = "Password";
  static const String confirmPassword = "Confirm Password";
  static const String forgotPassword = "Forgot Password";
  static const String passwordNotMatch = "Passwords does not match";
  static const String login = "LOGIN";
  static const String dontHaveAccount = "Don't have an account? Sign up";
  static const String loginWelcomeText = "Welcome";
  static const String registrationWelcomeText = "Welcome";
  static const String continueWith = "Or Continue with";
  static const String signUp = "SIGN UP";

  final List<ChoiceChipModel> choiceChipsList = [
    ChoiceChipModel("Cycling", Colors.green, "distance"),
    ChoiceChipModel("Yoga", Colors.green, "exercises"),
    ChoiceChipModel("Dumbbells", Colors.green, "exercises"),
    ChoiceChipModel("Plank", Colors.green, "exercises"),
    ChoiceChipModel("Warm up exercise", Colors.green, "exercises"),
    ChoiceChipModel("Walking", Colors.green, "distance"),
    ChoiceChipModel("Step count", Colors.green, "count"),
  ];
}