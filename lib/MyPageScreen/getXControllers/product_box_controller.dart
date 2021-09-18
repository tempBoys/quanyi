import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quanyi/MyPageScreen/models/create_product_boxes.dart';
import 'package:quanyi/MyPageScreen/models/product_data.dart';
import 'package:quanyi/models/constants.dart';

class ProductBoxController extends GetxController {
  Widget marketBoxes = Center(
    child: Container(
      child: Text("暂无商品"),
    ),
  );

  refreshProductBox(List<Map<String, dynamic>> list, ProductsListType type) {
    marketBoxes = createProductBoxes(list, type);
    update();
  }
}
