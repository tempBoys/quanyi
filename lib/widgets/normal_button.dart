import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';

class BottomBarButton extends StatelessWidget {
  final double height;
  final double? width;
  final Color backgroundColor;
  final onTap;
  final String text;
  final double textScaleFactor;
  final Color textColor;
  BottomBarButton(
      {Key? key,
      this.height = 60,
      this.width,
      this.backgroundColor = Colors.white,
      required this.onTap,
      this.text = "",
      this.textScaleFactor = 1,
      this.textColor = kTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffbbbbbb)),
            borderRadius: BorderRadius.circular(6),
            color: backgroundColor),
        child: Center(
          child: Text(
            text,
            textScaleFactor: textScaleFactor,
            style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
