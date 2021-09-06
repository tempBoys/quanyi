import 'package:quanyi/models/constants.dart';
import 'package:flutter/material.dart';

BoxDecoration linedBox(
    {Color color = Colors.white,
    bool all = false,
    bool left = false,
    bool top = false,
    bool right = false,
    bool bottom = false}) {
  return BoxDecoration(
    color: color,
    border: all == true
        ? Border(
            left: kBorderLine,
            right: kBorderLine,
            bottom: kBorderLine,
            top: kBorderLine,
          )
        : Border(
            left: left == true ? kBorderLine : BorderSide.none,
            right: right == true ? kBorderLine : BorderSide.none,
            bottom: bottom == true ? kBorderLine : BorderSide.none,
            top: top == true ? kBorderLine : BorderSide.none,
          ),
  );
}
