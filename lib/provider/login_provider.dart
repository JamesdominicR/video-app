import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_video_app/view/screens/home_screen.dart';
import 'package:machine_test_video_app/view/screens/login_screen.dart';

class LoginProvider extends ChangeNotifier {
final emailController = TextEditingController();
final passwordController = TextEditingController();
final GlobalKey<FormState> formKey = GlobalKey<FormState>();
FirebaseAuth auth = FirebaseAuth.instance;
bool isLoading = false;
bool isHidden = true;

Future<bool> login(BuildContext context) async {
  isLoading = true;
  UserCredential? user = await auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
  try {
    isLoading = false;
    if(context.mounted) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
      if(user.credential != null) {
    notifyListeners();
    return Future.value(true);
  } else {
    isLoading = false;
    return Future.value(false);
  }
  }
  catch(e) {
    isLoading = false;
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
