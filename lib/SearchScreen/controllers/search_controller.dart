import 'package:get/get.dart';
import 'package:quanyi/SearchScreen/models/search_products.dart';
import 'package:quanyi/SearchScreen/service/network.dart';

class SearchController extends GetxController {
  var searchProducts = RxList<SearchProduct>();
  RxBool isLoading = true.obs;
  RxString searchText = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    // getHistory();
    super.onInit();
  }

  void fetchSearchProducts(String search) async {
    searchText = search.obs;
    int lastID = 0;
    if (searchProducts.isNotEmpty)
      lastID = searchProducts[searchProducts.length - 1].id;
    try {
      print("Fetch");
      isLoading(true);
      var products =
          await SearchApi.fetchProducts(searchText: search, lastID: lastID);
      if (products != []) {
        searchProducts.addAll(products);
      } else
        searchProducts.assignAll([]);
    } finally {
      isLoading(false);
    }
  }
}
