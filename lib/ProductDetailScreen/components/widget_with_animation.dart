import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_detail_scroll_controller.dart';

class WidgetWithAnimation extends StatelessWidget {
  final widget;
  final textScaleFactor;
  WidgetWithAnimation(
      {Key? key, required this.widget, this.textScaleFactor = 1})
      : super(key: key);
  final controller = Get.put(ProductDetailScreenScrollController());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller.iconColorTween.value,
      builder: (context, child) => widget is IconData
          ? IconButton(
              icon: Icon(widget),
              color: controller.iconColorTween.value.value,
              onPressed: () {},
            )
          : Text(
              widget,
              textScaleFactor: textScaleFactor,
              style: TextStyle(
                  color: controller.textColorTween.value.value,
                  fontWeight: FontWeight.bold),
            ),
    );
  }
}
