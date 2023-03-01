import 'package:flutter/material.dart';

showToastMessage(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}