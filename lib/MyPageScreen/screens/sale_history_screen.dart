import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quanyi/MyPageScreen/models/product_data.dart';
import 'package:quanyi/MyPageScreen/getXControllers/product_box_controller.dart';

class SalesHistoryScreen extends StatefulWidget {
  const SalesHistoryScreen({Key? key}) : super(key: key);

  @override
  _SalesHistoryScreenState createState() => _SalesHistoryScreenState();
}

class _SalesHistoryScreenState extends State<SalesHistoryScreen> {
  Future<List<Map<String, dynamic>>> getList() async {
    http.Response response =
        await http.get(Uri.parse("${kServerAddress}product/$myId/sell/0"));
    if (response.statusCode == 200) {
      if (response.body == "[]") {
        return [];
      } else {
        return (json.decode(response.body) as List)
            .map((i) => Map<String, dynamic>.from(i))
            .toList();
      }
    } else {
      throw Exception("Error during getting product!");
    }
  }

  Future<bool> getData(ProductBoxController productBoxController) async {
    soldProductData = await getList();
    if (sold.isEmpty) {
      return true;
    }
    productBoxController.refreshProductBox(
        soldProductData, ProductsListType.sold);
    return true;
  }

  @override
  void initState() {
    soldProductData = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductBoxController productBoxController = Get.put(ProductBoxController());
    return Scaffold(
      appBar: NormalAppbar(
        title: "销售明细",
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
