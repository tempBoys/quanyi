import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quanyi/MyPageScreen/components/favorites_bottom_bar.dart';
import 'package:quanyi/MyPageScreen/getXControllers/all_selected_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/server_address.dart';
import 'package:quanyi/MyPageScreen/models/product_data.dart';
import 'package:quanyi/MyPageScreen/getXControllers/product_box_controller.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  Future<bool> getData(ProductBoxController productBoxController) async {
    for (int id in favorites) {
      Map<String, dynamic> singleProductInfo = await getProduct(id: id);
      singleProductInfo.addAll({"selected": false});
      print(singleProductInfo);
      favoritesProductData.add(singleProductInfo);
    }
    productBoxController.refreshProductBox(
        favoritesProductData, ProductsListType.favorites);
    return true;
  }

  @override
  void initState() {
    favoritesProductData = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductBoxController productBoxController = Get.put(ProductBoxController());
    Get.put(AllSelectedController(allProductsSelected: false.obs));
    return FutureBuilder(
      future: getData(productBoxController),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return Scaffold(
            appBar: NormalAppbar(
              title: "收藏",
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return Scaffold(
          appBar: NormalAppbar(
            title: "收藏",
          ),
          body: GetBuilder<ProductBoxController>(
            builder: (controller) => controller.marketBoxes,
          ),
          bottomNavigationBar: FavoritesBottomBar(),
        );
      },
    );
  }
}
