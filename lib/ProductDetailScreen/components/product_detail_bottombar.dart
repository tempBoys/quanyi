import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ChatsScreen/screens/messages.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_controller.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_detail_scroll_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/fav_storage.dart';
import 'package:quanyi/models/utils/number_formatter.dart';
import 'package:quanyi/widgets/lined_box.dart';
import 'package:quanyi/widgets/normal_button.dart';

class ProductDetailScreenBottomBar extends StatelessWidget {
  final int productId;
  final Map<String, dynamic> userData;
  final String productName;
  final String productImage;
  final num price;
  final bool negotiable;
  final int view;
  ProductDetailScreenBottomBar(
      {Key? key,
      required this.productId,
      required this.userData,
      required this.productName,
      required this.productImage,
      required this.price,
      required this.negotiable,
      required this.view})
      : super(key: key);
  final productController = Get.put(ProductController());
  final bottombarController = Get.put(ProductDetailScreenScrollController());
  final favStroage = Get.put(FavStorage());

  @override
  Widget build(BuildContext context) {
    final nego = negotiable == true ? "可协商" : "不可协商";
    productController.isFav.value = favStroage.contain(id: productId);
    print(productController.isFav.value);
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
                  "已经有 $view 个人看过",
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
                            productController.isFav.value == false
                                ? favStroage.add(id: productId)
                                : favStroage.delete(id: productId);
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
                              "${numFormatter.format(price)} 元",
                              textScaleFactor: 1.5,
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            child: Text(
                              nego,
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
                      onTap: () async {
                        // 채팅화면으로 전환
                        Get.to(() => MessagesScreen(), arguments: {
                          "productID": productId,
                          "productName": productName,
                          "productImage": productImage,
                          "price": price,
                          "user": userData,
                        });
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
