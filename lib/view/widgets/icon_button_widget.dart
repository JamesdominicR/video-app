import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color iconTextColor;
  final Size? fixedSize;
  final BorderSide? side;
  final VoidCallback? onPressed;
  const IconButtonWidget({super.key,required this.onPressed,required this.title,required this.backgroundColor,required this.iconTextColor,this.side,this.fixedSize});

  @override
  Widget build(BuildContext context) {
    return Center(
               child: ElevatedButton.icon(
                onPressed: onPressed, 
                style: ElevatedButton.styleFrom(
                  side: side,
                  backgroundColor: backgroundColor,
                  fixedSize: fixedSize
                  ),
                icon: Icon(Icons.add,
                color: iconTextColor,
                size: 22,
                ), 
                label: Text(title,
                style: TextStyle(color: iconTextColor,fontSize: 14,),
                ),
                ),
             );
  }
}