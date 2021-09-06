import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_controller.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_detail_scroll_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/number_formatter.dart';
import 'package:quanyi/widgets/lined_box.dart';
import 'package:quanyi/widgets/normal_button.dart';

class ProductDetailScreenBottomBar extends StatelessWidget {
  ProductDetailScreenBottomBar({
    Key? key,
  }) : super(key: key);
  final productController = Get.put(ProductController());
  final bottombarController = Get.put(ProductDetailScreenScrollController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 100.0 + bottombarController.scrollPosition.value / 8,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: linedBox(top: true, bottom: true),
              height: 1.0 + bottombarController.scrollPosition.value / 8,
              width: double.infinity,
              child: Center(
                child: Text(
                  "다른 추가 정보를 표시할 수 있음",
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    color: kTextLightColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Flexible(
                        flex: 2,
                        child: GestureDetector(
                          child: productController.isFav.value == false
                              ? Icon(Icons.favorite_border_outlined,
                                  color: kIconColor)
                              : Icon(
                                  Icons.favorite,
                                  color: kAccentColor,
                                ),
                          onTap: () {
                            productController.isFav.value =
                                !productController.isFav.value;
                          },
                        ),
                      )),
                  Flexible(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                            child: Text(
                              "${numFormatter.format(45.4)} 元",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              "협상 가능",
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                  Flexible(
                    flex: 3,
                    child: BottomBarButton(
                      backgroundColor: kAccentColor,
                      text: "开始聊天",
                      textScaleFactor: 1.5,
                      textColor: Colors.white,
                      onTap: () {
                        // 채팅화면으로 전환
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
