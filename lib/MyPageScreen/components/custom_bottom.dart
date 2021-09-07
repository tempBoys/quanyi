import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.onPressed, required this.iconData, required this.text});

  Function() onPressed;
  IconData iconData;
  String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Column(
        children: [
          Icon(
            iconData,
            color: kAccentColor,
            size: 50.h,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
