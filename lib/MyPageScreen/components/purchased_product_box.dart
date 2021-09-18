import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/MyPageScreen/getXControllers/all_selected_controller.dart';
import 'package:quanyi/MyPageScreen/getXControllers/product_box_controller.dart';
import 'package:quanyi/MyPageScreen/models/product_data.dart';
import 'package:quanyi/ProductDetailScreen/product_detail.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/number_formatter.dart';

class PurchasedProductBox extends StatefulWidget {
  final Map<String, dynamic> info;
  PurchasedProductBox({Key? key, required this.info}) : super(key: key);

  @override
  _PurchasedProductBoxState createState() => _PurchasedProductBoxState();
}

class _PurchasedProductBoxState extends State<PurchasedProductBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 100,
        color: Colors.white,
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
              flex: 3,
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
            Flexible(
              flex: 2,
              child: Container(
                height: 30,
                width: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey,
                ),
                child: Center(
                  child: Text(
                    (widget.info["status"] == "complete") ? "交易完成" : "交易中",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
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