import 'package:flutter/material.dart';
import 'package:quanyi/ProductDetailScreen/components/shopper_info/shopper_review_list_template.dart';
import 'package:quanyi/models/constants.dart';

class ShopperReviewList extends StatelessWidget {
  const ShopperReviewList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return index != 4
              ? Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ShopperReviewListTemplate(),
                )
              : GestureDetector(
                  child: Container(
                    padding: const EdgeInsets.only(left: 15.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                        child: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: kIconColor,
                    )),
                  ),
                );
        },
      ),
    );
  }
}
