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
        height: 120,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 상품 이름
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            "产品名字",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: kTextColor),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          height: 18,
                          width: 65,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(6)),
                          child: Text(
                            "是否已售完",
                            textScaleFactor: 0.7,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: kTextColor, fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 5),
                    // 유저의 주소 | 게시 날짜
                    Text(
                      "地址 | 上传时间",
                      textScaleFactor: 0.9,
                      style: TextStyle(color: kTextLightColor),
                    ),
                    SizedBox(height: 5),
                    // 상품 가격 | 협상여부
                    Text(
                      "${numFormatter.format(2020.20)} 元 | 可不可协商", // 가격
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: kTextColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 2.5),
                    // 상품을 구경한 횟수
                    Container(
                      width: double.infinity,
                      child: Text(
                        "已经有 X 个人看过",
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
        final productData = await apiHelper.getProduct(id: 1);
        Get.to(() => ProductDetailScreen(), arguments: productData);
      },
      onDoubleTap: () {},
    );
  }
}
