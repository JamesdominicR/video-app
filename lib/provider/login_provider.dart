import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_video_app/core/settings.dart';
import 'package:machine_test_video_app/view/screens/home_screen.dart';
import 'package:machine_test_video_app/view/screens/login_screen.dart';

class LoginProvider extends ChangeNotifier {
final emailController = TextEditingController();
final passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
FirebaseAuth auth = FirebaseAuth.instance;
bool isLoading = false;
bool isHidden = true;

Future<bool> login() async {
  isLoading = true;
  notifyListeners();
  UserCredential? user = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  try {
    isLoading = false;
    notifyListeners();
    if(user.user?.email?.isNotEmpty == true) {
    notifyListeners();
    textFieldClear();
    return Future.value(true);
  }
  }
  on FirebaseAuthException catch(e) {
    isLoading = false;
    notifyListeners();
    log(e.toString());
    return Future.value(false);
  }
  return Future.value(false);
}

Future signOut() async{
  await auth.signOut();
  notifyListeners();
}

void togglePasswordView() {
  isHidden = !isHidden;
  notifyListeners();
}

void textFieldClear() {
  emailController.clear();
  passwordController.clear();
}

}
