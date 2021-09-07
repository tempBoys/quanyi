import 'package:flutter/material.dart';
import 'package:quanyi/models/size_config.dart';

class CustomListTile extends StatelessWidget {
  CustomListTile(
      {required this.iconData, required this.text, required this.onTap});
  IconData iconData;
  String text;
  Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 20.w,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20.w,
        ),
      ),
      onTap: onTap,
    );
  }
}
