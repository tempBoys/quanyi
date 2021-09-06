import 'package:quanyi/models/constants.dart';
import 'package:flutter/material.dart';

class NormalAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  NormalAppbar({Key? key, this.title = '', this.actions}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 60);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: kIconColor),
      backgroundColor: kAppBarColor,
      elevation: 0,
      title: Text(
        title,
        textScaleFactor: kAppBarTextScaleFactor,
        style: TextStyle(color: kTextColor),
      ),
      centerTitle: true,
      actions: actions,
      shape: Border(bottom: kBorderLine),
    );
  }
}
