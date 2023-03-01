import 'package:flutter/material.dart';
import 'package:workout_log/utils/color_manager.dart';

class LoadingButton extends StatefulWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {

  bool checkLoading = false;
  bool success = false;


  @override
  Widget build(BuildContext context) {
    return !checkLoading ? MaterialButton(onPressed: () async {
      setState(() {
        checkLoading = true;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        success = true;
      });
      Navigator.pop(context);
    }, child: Text('SUBMIT'), color: primaryColor,) : !success ? CircularProgressIndicator() : Icon(Icons.check);
  }
}
