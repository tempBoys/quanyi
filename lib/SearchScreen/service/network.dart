import 'package:http/http.dart' as http;
import 'package:quanyi/SearchScreen/models/search_products.dart';
import 'package:quanyi/models/constants.dart';

class SearchApi {
  static var client = http.Client();

  static Future<List<SearchProduct>> fetchProducts(
      {String searchText = '', int lastID = 0}) async {
    String url = kServerAddress + "product/search/" + searchText + '/$lastID';
    var response = await client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return searchProductsFromJson(jsonString);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception("Can\'t get data");
    }
  }
}
