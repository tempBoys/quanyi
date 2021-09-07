import 'package:flutter/material.dart';
import 'package:quanyi/ProductDetailScreen/components/shopper_info/gpa_graph.dart';
import 'package:quanyi/ProductDetailScreen/components/shopper_info/info_card.dart';
import 'package:quanyi/ProductDetailScreen/components/shopper_info/shopper_review_list.dart';
import 'package:quanyi/models/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ShopperInfo extends StatelessWidget {
  final userName;
  final location;
  ShopperInfo({
    Key? key,
    required this.userName,
    this.location: "北京大学中关新园3号楼",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InfoCard(
                userName: userName,
                location: location,
              ),
              // 판매자 평가를 보여준다
              Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      child: Text(
                        "交易GPA",
                        textScaleFactor: 0.8,
                      ),
                    ),
                    GpaGraph(
                      satisfication: "满意",
                      percentage: 8,
                    ),
                    GpaGraph(
                      satisfication: "一般",
                      percentage: 3,
                    ),
                    GpaGraph(
                      satisfication: "不好",
                      percentage: 2,
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 18),
          child: ShopperReviewList(),
        ),
      ],
    );
  }
}
