import 'package:flutter/material.dart';
import 'package:quanyi/MyPageScreen/components/favorites_product_box.dart';
import 'package:quanyi/MyPageScreen/components/purchased_product_box.dart';
import 'package:quanyi/MyPageScreen/components/sold_product_list.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/kdivider.dart';

import '../components/buyer_box.dart';

createBuyerBoxes(List<Map<String, dynamic>> data) {
  var buyerBoxes = <Widget>[];
  if (data.isEmpty) {
    return Center(
      child: Container(
        child: Text("暂无"),
      ),
    );
  } else
    data.forEach((element) {
      buyerBoxes.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: BuyerBox(info: element),
        ),
      );
    });
  return CustomScrollView(
    slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate(buyerBoxes),
      ),
    ],
  );
}
