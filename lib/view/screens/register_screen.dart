import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:machine_test_video_app/provider/register_provider.dart';
import 'package:machine_test_video_app/view/screens/login_screen.dart';
import 'package:provider/provider.dart';
import '../../core/string_constants.dart';
import '../widgets/common_button.dart';
import '../widgets/common_input_box.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 15,right: 15,top: screenHeight * 0.10),
            child: Consumer<RegisterProvider>(
                builder: (context,registerProvider,_) {
                  return registerProvider.isLoading == true
                      ? const Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(color: Colors.green))
                      : Form(
                    key: registerProvider.formKey,
                    child: Column(
                      children: <Widget>[
                        const Text(StringConstants.REGISTER,
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),
                        ),
                        SizedBox(height: screenHeight * 0.08),
                        CommonInputBox(
                          title: StringConstants.EMAIL,
                          controller: registerProvider.emailController,
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
                            controller: registerProvider.passwordController,
                            prefixIcon: const Icon(Icons.lock,
                              size: 20,
                            ),
                            obscureText: registerProvider.passwordHidden,
                            suffixIcon: InkWell(
                              onTap: () {
                                registerProvider.togglePasswordView();
                              },
                              child: Icon(registerProvider.passwordHidden
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
                        const SizedBox(height: 20),
                        CommonInputBox(
                            title: StringConstants.CONFIRM_PASSWORD,
                            controller: registerProvider.confirmPasswordController,
                            prefixIcon: const Icon(Icons.lock,
                              size: 20,
                            ),
                            obscureText: registerProvider.confirmPasswordHidden,
                            suffixIcon: InkWell(
                              onTap: () {
                                registerProvider.toggleConfirmPasswordView();
                              },
                              child: Icon(registerProvider.confirmPasswordHidden
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                                size: 20,
                              ),
                            ),
                            validator: (value) {
                              if(value.toString().isEmpty) {
                                return StringConstants.PLEASE_ENTER_CONFIRM_PASSWORD;
                              }
                              return null;
                            }
                        ),
                        SizedBox(height: screenHeight * 0.05),
                        CommonButton(
                          title: StringConstants.REGISTER,
                          backgroundColor: Colors.green,
                          onPressed: () {
                            if(registerProvider.formKey.currentState?.validate() == true) {
                              if(registerProvider.passwordController.text != registerProvider.confirmPasswordController.text) {
                                Fluttertoast.showToast(msg: StringConstants.PASSWORD_NOT_MATCH);
                              } else {
                                registerProvider.register().then((value) =>
                                value == true
                                    ? Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (
                                        context) => const LoginScreen()))
                                    : Fluttertoast.showToast(msg: StringConstants.REGISTRATION_FAILED),
                                );
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  );
                }
            ),
          ),
        ),
      ),
    );
  }
}
