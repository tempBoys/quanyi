import 'package:flutter/material.dart';
import 'package:quanyi/MyPageScreen/components/favorites_product_box.dart';
import 'package:quanyi/MyPageScreen/components/purchased_product_box.dart';
import 'package:quanyi/MyPageScreen/components/sold_product_list.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/kdivider.dart';

createProductBoxes(
    List<Map<String, dynamic>> productsData, ProductsListType type) {
  var marketBoxes = <Widget>[];
  bool firstMarket = true;
  if (productsData.isEmpty) {
    firstMarket = true;
    return Center(
      child: Container(
        child: Text("暂无商品"),
      ),
    );
  } else
    productsData.forEach((element) {
      if (firstMarket) {
        firstMarket = false;
      } else {
        marketBoxes.add(KDivider(
          height: 10,
        ));
      }
      if (type == ProductsListType.favorites) {
        marketBoxes.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: ProductBox(info: element),
          ),
        );
      } else if (type == ProductsListType.purchased) {
        marketBoxes.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: PurchasedProductBox(info: element),
          ),
        );
      } else if (type == ProductsListType.sold) {
        marketBoxes.add(
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: SoldProductBox(info: element),
          ),
        );
      }
    });
  return CustomScrollView(
    slivers: <Widget>[
      SliverList(
        delegate: SliverChildListDelegate(marketBoxes),
      ),
    ],
  );
}
