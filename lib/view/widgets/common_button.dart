import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  const CommonButton({super.key,required this.title,required this.backgroundColor,required this.onPressed,this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 125,vertical: 14),
      ),
      onPressed: onPressed,
     child: Text(title,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white
      ),
      ),
    );
  }
}