import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  final serverUrl = "http://d9eb-124-14-224-4.ngrok.io/";
  final String userToken =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjMxMDQxOTM2LCJleHAiOjE2NjI1Nzc5MzZ9.QyHWPs-K83p_Y-FZLbeSwtUtyX8ofZOp-HqABcvwDz4";

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
      var request =
          http.MultipartRequest("POST", Uri.parse(serverUrl + "product"));
      var headers = {
        "Content-Type": "multipart/form-data",
        'Authorization': userToken
      };
      request.headers.addAll(headers);
      request.fields["name"] = productData["name"];
      request.fields["price"] = productData["price"].toString();
      request.fields["content"] = productData["content"];
      await request.send();
    } catch (e) {
      print(e);
      Get.snackbar("网络异常", "产品上传失败！");
    }
  }
}

ApiHelper apiHelper = ApiHelper();
