import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class RegisterProvider extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  bool passwordHidden = true;
  bool confirmPasswordHidden = true;

  void togglePasswordView() {
    passwordHidden = !passwordHidden;
    notifyListeners();
  }

  void toggleConfirmPasswordView() {
    confirmPasswordHidden = !confirmPasswordHidden;
    notifyListeners();
  }

  Future<bool> register() async {
    isLoading = true;
    notifyListeners();
    UserCredential? user = await auth.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    try {
      isLoading = false;
      notifyListeners();
      if(user.additionalUserInfo?.isNewUser == true) {
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

  void textFieldClear() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }
}