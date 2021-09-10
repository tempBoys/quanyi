import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class NormalAppbarWithBottom extends NormalAppbar
    implements PreferredSizeWidget {
  final title;
  final bool isTitleText;
  final List<Widget>? actions;
  final height;
  final bottomHeight;
  final child;
  NormalAppbarWithBottom({
    Key? key,
    this.title = '',
    this.actions,
    this.isTitleText = true,
    this.height = 60.0,
    this.bottomHeight = 65.0,
    required this.child,
  }) : super(key: key) {
    NormalAppbar(
      title: title,
      isTitleText: isTitleText,
      actions: actions,
      height: height,
    );
  }
  @override
  Size get preferredSize => Size(double.infinity, height + bottomHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: kIconColor),
      backgroundColor: kAppBarColor,
      elevation: 0,
      title: isTitleText
          ? Text(
              title,
              textScaleFactor: kAppBarTextScaleFactor,
              style: TextStyle(color: kTextColor),
            )
          : title,
      centerTitle: true,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size(double.infinity, bottomHeight),
        child: Container(
          height: bottomHeight,
          decoration: BoxDecoration(
              color: Colors.white, border: Border(top: kBorderLine)),
          child: child,
        ),
      ),
      shape: Border(bottom: kBorderLine),
    );
  }
}
