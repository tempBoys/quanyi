import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/product_detail.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/api_helper.dart';
import 'package:quanyi/models/utils/number_formatter.dart';

class ProductList extends StatelessWidget {
  final int id;
  ProductList({Key? key, required this.id}) : super(key: key);

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
                  color: kAccentColor,
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
                      "상품 이름",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: kTextColor),
                    ),
                    SizedBox(height: 5),
                    // 유저의 주소 | 게시 날짜
                    Text(
                      "유저의 주소 | 게시한 날짜",
                      textScaleFactor: 0.9,
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(height: 5),
                    // 상품 가격 | 협상여부
                    Text(
                      "${numFormatter.format(2020.20)} 元 | 협상 가능 여부", // 가격
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.5),
                    // 상품을 구경한 횟수
                    Container(
                      width: double.infinity,
                      child: Text(
                        "X 명이 이 상품을 클릭했어요",
                        textScaleFactor: 0.9,
                        textAlign: TextAlign.right,
                        style: TextStyle(color: kTextLightColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: () async {
        // 상품을 불러와 상세 스크린으로 이동한다
        final productData = await apiHelper.getProduct(id: id);
        Get.to(() => ProductDetailScreen(), arguments: productData);
      },
      onDoubleTap: () {},
    );
  }
}
