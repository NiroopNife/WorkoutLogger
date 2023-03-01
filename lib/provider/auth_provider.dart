import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:workout_log/utils/strings_manager.dart';
import 'package:workout_log/view/widget/showMessage.dart';

class AuthProvider extends ChangeNotifier {

  int pageState = 0;
  bool keyboardVisible = false;


  signInUser(String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToastMessage(context, AppStrings.noUserFound);
      } else if (e.code == 'wrong-password') {
        showToastMessage(context, AppStrings.wrongPassord);
      }
    }
  }

  signUpUser(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      log(e.message.toString());
    }
  }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  forgotPassword(String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) =>
          showToastMessage(context, AppStrings.forgotPasswordSent));
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      log(e.message.toString());
    }
  }

  signOut() {
    FirebaseAuth.instance.signOut();
  }

}