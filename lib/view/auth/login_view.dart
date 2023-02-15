import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_log/utils/assets_manager.dart';
import 'package:workout_log/view/auth/sign_up_view.dart';

import '../../services/auth_service.dart';
import '../dashboard_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {

    showDialog(context: context, builder: (context) {
      return const Center(child: CircularProgressIndicator(),);
    });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => DashboardView()), (route) => false);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == "user-not-found") {
        print("No user found for that email");
      } else if (e.code == "wrong-password") {
        print("wrong-password");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Image.asset(
        //   AssetsManager.AppBackgroundImage,
        //   height: MediaQuery.of(context).size.height,
        //   width: MediaQuery.of(context).size.width,
        //   fit: BoxFit.cover,
        // ),
        Scaffold(
          // backgroundColor: Colors.transparent,
          body: Column(
            children: [
              TextFormField(
                controller: _emailController,
              ),
              TextFormField(
                controller: _passwordController,
              ),
              TextButton(onPressed: () {
                loginUser();
              }, child: Text("Sign In")),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context, MaterialPageRoute(builder: (_) => SignUpView()), (Route<dynamic> route) => false);
                  },
                  child: Text("Sign Up")),
              TextButton(onPressed: () => AuthService().signInWithGoogle(), child: Text('Sign In with google'))
            ],
          ),
        ),
      ],
    );
  }
}
