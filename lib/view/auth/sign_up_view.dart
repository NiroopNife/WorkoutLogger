import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:workout_log/services/auth_service.dart';
import 'package:workout_log/view/auth/login_view.dart';
import 'package:workout_log/view/dashboard_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void signUpUser() async {

    if (_confirmPasswordController.text == _passwordController.text) {
      showDialog(context: context, builder: (context) {
        return const Center(child: CircularProgressIndicator(),);
      });

      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
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
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Passwords does not match')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: _emailController,
          ),
          TextFormField(
            controller: _passwordController,
          ),
          TextFormField(
            controller: _confirmPasswordController,
          ),
          TextButton(onPressed: () {
            signUpUser();
          }, child: Text("Sign Up")),
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context, MaterialPageRoute(builder: (_) => LoginView()), (Route<dynamic> route) => false);
              },
              child: Text("Sign In")),
          TextButton(onPressed: () => AuthService().signInWithGoogle(), child: Text('Sign In with google'))
        ],
      ),
    );
  }
}
