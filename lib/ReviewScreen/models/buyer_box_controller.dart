import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quanyi/ReviewScreen/models/create_buyer_boxes.dart';
import 'package:quanyi/MyPageScreen/models/create_product_boxes.dart';
import 'package:quanyi/MyPageScreen/models/product_data.dart';
import 'package:quanyi/models/constants.dart';

class BuyerBoxController extends GetxController {
  BuyerBoxController({required this.buyerBoxes});
  Widget buyerBoxes;

  void selectAllProducts(List<Map<String, dynamic>> buyers) {
    buyers.forEach((element) {
      element["selected"] = false;
    });
  }

  refreshBuyerBox(List<Map<String, dynamic>> list) {
    buyerBoxes = createBuyerBoxes(list);
    update();
  }
}
