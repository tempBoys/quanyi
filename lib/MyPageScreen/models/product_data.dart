import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quanyi/models/constants.dart';

List<int> favorites = [11, 12, 13];
List<int> purchased = [11, 12, 13];
List<int> sold = [11, 12, 13];

List<Map<String, dynamic>> favoritesProductData = [];
List<Map<String, dynamic>> purchasedProductData = [];
List<Map<String, dynamic>> soldProductData = [];

Future<Map<String, dynamic>> getProduct({required int id}) async {
  http.Response response =
      await http.get(Uri.parse("${kServerAddress}product/$id"));
  if (response.statusCode == 200) {
    //print(response.body);
    return jsonDecode(response.body);
  } else {
    throw Exception("Error during getting product!");
  }
}
