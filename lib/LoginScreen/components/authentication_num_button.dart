import 'package:flutter/material.dart';

class AuthenticationNumButton extends StatelessWidget {
  AuthenticationNumButton(
      {required this.backgroundColor,
      required this.buttonText,
      required this.textColor,
      this.borderSide,
      this.fontSize,
      this.onPressed});

  final Color backgroundColor;
  final String buttonText;
  final Color textColor;
  final BorderSide? borderSide;
  final double? fontSize;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side: borderSide,
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: fontSize,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
