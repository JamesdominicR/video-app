import 'package:flutter/material.dart';
import 'package:machine_test_video_app/core/string_constants.dart';
import 'package:machine_test_video_app/provider/login_provider.dart';
import 'package:machine_test_video_app/view/screens/home_screen.dart';
import 'package:machine_test_video_app/view/widgets/common_button.dart';
import 'package:machine_test_video_app/view/widgets/common_input_box.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<LoginProvider>(
            builder: (context,loginProvider,_) {
            return loginProvider.isLoading == true
            ? const Center(child: CircularProgressIndicator())
            : Padding(
              padding: EdgeInsets.only(left: 15,right: 15,top: screenHeight * 0.10),
              child: Form(
                key: loginProvider.formKey,
                child: Column(
                  children: <Widget>[
                    const Text(StringConstants.LOGIN,
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                    ),
                    SizedBox(height: screenHeight * 0.08),
                     CommonInputBox(
                      title: StringConstants.EMAIL,
                      controller: loginProvider.emailController,
                      prefixIcon: const Icon(Icons.email,
                      size: 20,
                      ),
                      validator: (value) {
                        if(value.toString().isEmpty) {
                          return StringConstants.PLEASE_ENTER_EMAIL;
                        }
                        return null;
                      },
                      ),
                      const SizedBox(height: 20),
                        CommonInputBox(
                      title: StringConstants.PASSWORD,
                      controller: loginProvider.passwordController,
                      prefixIcon: const Icon(Icons.lock,
                      size: 20,
                      ),
                      obscureText: loginProvider.isHidden,
                      suffixIcon: InkWell(
                        onTap: () {
                          loginProvider.togglePasswordView();
                        },
                        child: Icon(loginProvider.isHidden
                        ? Icons.visibility_off
                        : Icons.visibility,
                        size: 20,
                        ),
                      ),
                      validator: (value) {
                       if(value.toString().isEmpty) {
                          return StringConstants.PLEASE_ENTER_PASSWORD;
                        }
                        return null;
                      }
                      ),
                      SizedBox(height: screenHeight * 0.05),
                    CommonButton(
                      title: "Login",
                      backgroundColor: Colors.green,
                      onPressed: () {
                        if(loginProvider.formKey.currentState?.validate() == true) {
                           loginProvider.login(context).then((value) => value == true
                        ? Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()))
                        : const IgnorePointer(),
                        );
                        }
                      },
                      ),
                  ],
                ),
              ),
            );
            }
          ),
        ),
      ),
    );
  }
}
