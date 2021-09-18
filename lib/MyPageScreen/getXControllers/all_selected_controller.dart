import 'package:get/get.dart';
import 'package:quanyi/MyPageScreen/models/product_data.dart';

class AllSelectedController {
  AllSelectedController({required this.allProductsSelected});
  RxBool allProductsSelected;

  bool areAllSelected(List<Map<String, dynamic>> productList) {
    if (productList.isEmpty) {
      return false;
    }
    for (int i = 0; i < productList.length; i++) {
      if (productList[i]["selected"] == false) {
        return false;
      }
    }
    return true;
  }

  changeStatusWithData() {
    allProductsSelected(areAllSelected(favoritesProductData));
  }

  changeStatus(bool value) {
    allProductsSelected(value);
  }
}
