import 'package:flutter/material.dart';

// 얇은 디바이더
class KDivider extends StatelessWidget {
  final double height;
  final double thickness;
  KDivider({Key? key, this.height = 0, this.thickness = 3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: this.height,
      color: Colors.grey.shade100,
      thickness: thickness,
    );
  }
}
