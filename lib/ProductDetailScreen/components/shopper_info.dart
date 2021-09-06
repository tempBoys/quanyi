import 'package:flutter/material.dart';
import 'package:quanyi/ProductDetailScreen/components/shopper_info/info_card.dart';
import 'package:quanyi/ProductDetailScreen/components/shopper_info/shopper_review_list.dart';
import 'package:quanyi/models/constants.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ShopperInfo extends StatelessWidget {
  const ShopperInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: kInfoCardHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InfoCard(),
              // 판매자 평가를 보여준다
              ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext ctx, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Container(
                            height: 55,
                            child: SfLinearGauge(
                                orientation: LinearGaugeOrientation.vertical,
                                showTicks: false,
                                showLabels: false,
                                axisTrackStyle: LinearAxisTrackStyle(
                                    thickness: 5,
                                    edgeStyle: LinearEdgeStyle.bothCurve),
                                minimum: 0,
                                maximum: 10,
                                barPointers: index == 2
                                    ? [
                                        LinearBarPointer(
                                          value: 7,
                                          thickness: 5,
                                          edgeStyle: LinearEdgeStyle.bothCurve,
                                          color: Colors.redAccent[400],
                                        )
                                      ]
                                    : [
                                        LinearBarPointer(
                                          value: 2.4,
                                          thickness: 5,
                                          edgeStyle: LinearEdgeStyle.bothCurve,
                                          color: Colors.grey[400],
                                        )
                                      ]),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${index + 1}",
                            textScaleFactor: 0.9,
                            style: TextStyle(color: kTextColor),
                          )
                        ],
                      ),
                    );
                  })
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
