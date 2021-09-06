import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/product_detail.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/number_formatter.dart';

class ProductList extends StatelessWidget {
  final int id;
  ProductList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              // 해당 상품 이미지
              child: Container(
                height: 75,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.indigo,
                ),
              ),
            ),
            // 해당 상품 정보
            Flexible(
              flex: 5,
              child: Container(
                width: 270,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 상품 이름
                    Text(
                      "상품의 이름들",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: kTextColor),
                    ),
                    SizedBox(height: 5),
                    // 판매 위치
                    Text(
                      "地址",
                      textScaleFactor: 0.9,
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(height: 5),
                    // 상품 가격
                    Text(
                      numFormatter.format(2020.20),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.to(() => ProductDetailScreen());
      },
    );
  }
}
