import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/MyPageScreen/getXControllers/all_selected_controller.dart';
import 'package:quanyi/MyPageScreen/getXControllers/product_box_controller.dart';
import 'package:quanyi/MyPageScreen/models/product_data.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';

class FavoritesBottomBar extends StatefulWidget {
  const FavoritesBottomBar({Key? key}) : super(key: key);

  @override
  _FavoritesBottomBarState createState() => _FavoritesBottomBarState();
}

class _FavoritesBottomBarState extends State<FavoritesBottomBar> {
  bool allSelected = false;

  void selectAllProducts(
      List<Map<String, dynamic>> productsList, bool selected) {
    productsList.forEach((element) {
      element["selected"] = selected;
    });
  }

  void deleteSelectedProducts(List<Map<String, dynamic>> productsList) {
    var removeProducts = [];
    var removeIDs = [];
    productsList.forEach((element) {
      if (element["selected"]) {
        removeProducts.add(element);
        removeIDs.add(element["id"]);
      }
    });
    productsList.removeWhere((p) => removeProducts.contains(p));
    favorites.removeWhere((id) => removeIDs.contains(id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kBottomNavigationBarHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(
          horizontal: BorderSide(
            color: Colors.grey.shade100,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Obx(
                () => Checkbox(
                  value: Get.find<AllSelectedController>()
                      .allProductsSelected
                      .value,
                  shape: CircleBorder(),
                  onChanged: (bool? value) {
                    Get.find<AllSelectedController>()
                        .changeStatus(value ?? false);
                    selectAllProducts(favoritesProductData, value ?? false);
                    //saveCartData();
                    Get.find<ProductBoxController>().refreshProductBox(
                        favoritesProductData, ProductsListType.favorites);
                  },
                  activeColor: kPrimaryColor,
                ),
              ),
              Text("全选"),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 16.0, 5.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
              onPressed: () {
                if (favoritesProductData.isNotEmpty) {
                  deleteSelectedProducts(favoritesProductData);
                  Get.find<AllSelectedController>().changeStatusWithData();
                  Get.find<ProductBoxController>().refreshProductBox(
                      favoritesProductData, ProductsListType.favorites);
                }
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Center(
                  child: Text(
                    "删除",
                    style: TextStyle(
                      fontSize: 15.w,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
