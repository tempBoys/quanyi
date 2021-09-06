import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';

class ShopperReviewListTemplate extends StatelessWidget {
  const ShopperReviewListTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        elevation: 1.8,
        child: Container(
          width: 275,
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 31,
                      child: Text(
                        "满意",
                        textScaleFactor: 1.1,
                        style: TextStyle(
                            color: kTextColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      height: 31,
                      child: Text(
                        "非常好！！值得推荐",
                        textScaleFactor: 0.9,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(color: kTextColor),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
