import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quanyi/MyPageScreen/models/product_data.dart';
import 'package:quanyi/MyPageScreen/getXControllers/product_box_controller.dart';

class PurchaseHistoryScreen extends StatefulWidget {
  const PurchaseHistoryScreen({Key? key}) : super(key: key);

  @override
  _PurchaseHistoryScreenState createState() => _PurchaseHistoryScreenState();
}

class _PurchaseHistoryScreenState extends State<PurchaseHistoryScreen> {
  Future<List<Map<String, dynamic>>> getList() async {
    http.Response response =
        await http.get(Uri.parse("${kServerAddress}product/$userID/bought/0"));
    if (response.statusCode == 200) {
      if (response.body == "[]") {
        return [];
      } else
        return jsonDecode(response.body);
    } else {
      throw Exception("Error during getting product!");
    }
  }

  Future<bool> getData(ProductBoxController productBoxController) async {
    purchasedProductData = await getList();
    if (purchasedProductData.isEmpty) {
      return true;
    }
    productBoxController.refreshProductBox(
        purchasedProductData, ProductsListType.purchased);
    return true;
  }

  @override
  void initState() {
    purchasedProductData = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductBoxController productBoxController = Get.put(ProductBoxController());
    return Scaffold(
      appBar: NormalAppbar(
        title: "购买明细",
      ),
      body: FutureBuilder(
        future: getData(productBoxController),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GetBuilder<ProductBoxController>(
            builder: (controller) => controller.marketBoxes,
          );
        },
      ),
    );
  }
}
