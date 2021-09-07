import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';

class ProductBasicInfo extends StatelessWidget {
  final name;
  final createdAt;
  final content;
  final status;
  ProductBasicInfo({
    Key? key,
    required this.name,
    required this.createdAt,
    required this.content,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final productData = productController.product;

    // 상품의 기본적인 정보들을 보여준다
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // 상품의 이름을 보여준다
        Row(
          children: [
            status == "sell"
                ? Text(
                    "판매중",
                    style: TextStyle(
                        color: kTextLightColor, fontWeight: FontWeight.bold),
                  )
                : Text(
                    "판매완료",
                    style: TextStyle(
                        color: kTextLightColor, fontWeight: FontWeight.bold),
                  ),
            SizedBox(width: 8),
            Text(
              name,
              textScaleFactor: 1.2,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            createdAt,
            textScaleFactor: 1.1,
            style: TextStyle(color: kTextLightColor),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            content,
            textScaleFactor: 1.1,
            style: TextStyle(color: kTextColor),
          ),
        ),
      ],
    );
  }
}
