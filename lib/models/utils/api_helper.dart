import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  final serverUrl = "http://d9eb-124-14-224-4.ngrok.io/";
  final String userToken =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwicGhvbmVfbnVtYmVyIjoiMTM2NTExMzM4MzAiLCJyb2xlIjoidXNlciIsImlhdCI6MTYyOTk2MjkwNSwiZXhwIjoxNjYxNDk4OTA1fQ.uIqMUSx06pJ_JjseJJWFyicv2riL89bZdJg4WT4vKUo";

  // 유저 정보를 불러온다
  Future<Map<String, dynamic>> getUser({required int id}) async {
    http.Response response = await http.get(Uri.parse(serverUrl + "user/$id"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error during getting user!");
    }
  }

  // 상품 정보를 불러온다
  Future<Map<String, dynamic>> getProduct({required int id}) async {
    http.Response response =
        await http.get(Uri.parse(serverUrl + "product/$id"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error during getting product!");
    }
  }

  // 상품을 등록한다
  Future<void> postProduct({required Map<String, dynamic> productData}) async {
    try {
      await http.post(Uri.parse(serverUrl + "product"),
          headers: {
            "Content-Type": "application/json",
            'Authorization': userToken
          },
          body: json.encode(productData));
    } catch (e) {
      print(e);
      Get.snackbar("网络异常", "产品上传失败！");
    }
  }

  // 리뷰를 불러온다
  Future<Map<String, dynamic>> getReview({required int id}) async {
    http.Response response =
        await http.get(Uri.parse(serverUrl + "review/$id"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Error during getting product options!");
    }
  }
}

ApiHelper apiHelper = ApiHelper();
