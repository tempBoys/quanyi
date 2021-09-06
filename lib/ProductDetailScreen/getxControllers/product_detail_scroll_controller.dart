import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/models/constants.dart';

class ProductDetailScreenScrollController extends GetxController
    with SingleGetTickerProviderMixin {
  late RxDouble scrollPosition = 0.0.obs;
  late ScrollController scrollController;
  late AnimationController animationController;
  late Rx<Animation> iconColorTween;
  late Rx<Animation> textColorTween;
  late Rx<Animation> bottomTween;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    animationController = AnimationController(vsync: this);
    iconColorTween = ColorTween(begin: Colors.white, end: kIconColor)
        .animate(animationController)
        .obs;
    textColorTween = ColorTween(
            begin: kTextColor.withAlpha(0), end: kTextColor.withAlpha(255))
        .animate(animationController)
        .obs;
    bottomTween = SizeTween(
            begin: Size(double.infinity, 0), end: Size(double.infinity, 40))
        .animate(animationController)
        .obs;
    scrollController.addListener(() {
      if (scrollController.offset > 255) {
        scrollPosition.value = 255.0;
      } else if (scrollController.hasClients) {
        scrollPosition.value = scrollController.offset;
      }
      animationController.value = scrollPosition.value / 255;
    });
  }
}
