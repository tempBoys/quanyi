import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/number_formatter.dart';

class ProductBasicInfo extends StatelessWidget {
  ProductBasicInfo({Key? key}) : super(key: key);
  // final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    // final productData = productController.product;

    // 상품의 기본적인 정보들을 보여준다
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 상품의 이름을 보여준다
        Text(
          "상품의 이름",
          // productData.name,
          textScaleFactor: 1.2,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "게시 날짜",
            textScaleFactor: 1.1,
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            "게시 내용",
            textScaleFactor: 1.1,
            style: TextStyle(color: kTextColor),
          ),
        ),
      ],
    );
  }
}
