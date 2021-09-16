import 'package:flutter/material.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/models/constants.dart';

class DefaultButton extends StatelessWidget {
  DefaultButton({
    Key? key,
    required this.text,
    this.press,
    this.backgroundColor,
    this.textColor,
  });

  final String text;
  final Function()? press;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor ?? kPrimaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18.w,
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
