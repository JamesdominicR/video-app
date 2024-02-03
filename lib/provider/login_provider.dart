import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
  UserCredential? user = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  print("cred:${emailController.text}");
  print("cred:${passwordController.text}");
  try {
    isLoading = false;
    print("yes:${user.credential}");
      if(user.credential != null) {
        
    print("User is successfully created");
    notifyListeners();
    return Future.value(true);
  } else {
    isLoading = false;
    print("Some error happened");
    return Future.value(false);
  }
  }
  catch(e) {
    isLoading = false;
    print(e.toString());
    return Future.value(false);
  }
}

void signOut(BuildContext context) {
  auth.signOut();
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
  notifyListeners();
}

void togglePasswordView() {
  isHidden = !isHidden;
  notifyListeners();
}

}
