import 'package:flutter/material.dart';

class CommonInputBox extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  final Widget prefixIcon;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  const CommonInputBox({super.key,required this.title,required this.controller,required this.prefixIcon,this.obscureText,this.suffixIcon,this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //style: const TextStyle(),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green
          )
        ),
        hintText: title,
        hintStyle: const TextStyle(fontSize: 14),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      controller: controller,
      obscureText: obscureText ?? false,
      validator: validator,
    );
  }
}
