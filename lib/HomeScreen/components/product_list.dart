import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/dividers.dart';

class ProductList extends StatelessWidget {
  final int id;
  ProductList({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            height: 75,
            width: 270,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상품 이름
                Text(
                  "상품 이름",
                  textScaleFactor: 1.1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: kTextColor),
                ),
                SizedBox(height: 5),
                // 판매 위치
                Text(
                  "판매 위치",
                  textScaleFactor: 1.1,
                  style: TextStyle(color: kTextLightColor),
                ),
                SizedBox(height: 5),
                // 상품 가격
                Text(
                  "상품 가격",
                  textScaleFactor: 1.1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: kTextLightColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        KDivider(height: 10),
      ],
    );
  }
}
