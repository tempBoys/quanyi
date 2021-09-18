import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ReviewScreen/models/buyer_box_controller.dart';
import 'package:quanyi/ReviewScreen/models/dummy_data.dart';
import 'package:quanyi/ProductDetailScreen/product_detail.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/number_formatter.dart';

class BuyerBox extends StatefulWidget {
  final Map<String, dynamic> info;
  BuyerBox({Key? key, required this.info}) : super(key: key);

  @override
  _BuyerBoxState createState() => _BuyerBoxState();
}

class _BuyerBoxState extends State<BuyerBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 7,
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
                  child: CircleAvatar(
                    radius: 37.5,
                    backgroundImage: NetworkImage(widget.info["profile_image"]),
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
                          widget.info["user_name"],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: kTextColor),
                        ),
                        SizedBox(height: 5),
                        // 판매 위치
                        Text(
                          widget.info["location"],
                          textScaleFactor: 0.9,
                          style: TextStyle(color: kTextLightColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Flexible(
          child: Center(
            child: Checkbox(
              activeColor: kPrimaryColor,
              value: widget.info["selected"],
              shape: CircleBorder(),
              onChanged: (bool? value) {
                Get.find<BuyerBoxController>().selectAllProducts(buyers);
                setState(() {
                  widget.info["selected"] = value!;
                });
                //saveCartData();
                Get.find<BuyerBoxController>().refreshBuyerBox(buyers);
              },
            ),
          ),
        ),
      ],
    );
  }
}
