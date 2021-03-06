import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'package:uri_to_file/uri_to_file.dart';

class ApiHelper {
  final serverUrl = "http://d9eb-124-14-224-4.ngrok.io/";
  final String userToken =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjMxMjkwOTQxLCJleHAiOjE2NjI4MjY5NDF9.aFtlKbh43NaF41NzvOwQ_cY2Okzb3ZheeycE2QIDZ38";

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

  // 유저의 졍보를 업데이트 한다
  Future<void> putUser({
    required int id,
    required String phoneNumber,
    required String password,
    required String userName,
    required String profileImage,
    required String location,
  }) async {
    Map<String, dynamic> userData = {
      "phone_number": phoneNumber,
      "password": password,
      "user_name": userName,
      "profile_image": profileImage,
      "location": location,
      "pushy_token": deviceToken,
    };
    String jsonData = jsonEncode(userData);
    await http.put(Uri.parse(serverUrl + "user/$id"),
        body: jsonData, headers: {"Content-Type": "application/json"});
  }

  // 채팅을 보낸다
  Future<void> postChat({
    required int sender,
    required int receriver,
    required int productId,
    required String message,
  }) async {
    await http.post(Uri.parse(serverUrl + "chat"), body: {
      "message": message,
      "sender": sender,
      "receiver": receriver,
      "product": productId,
    });
  }

  // 상품을 등록한다
  Future<void> postProduct({required Map<String, dynamic> productData}) async {
    Get.defaultDialog(title: "正在上传中", middleText: "请稍后");
    try {
      var request =
          http.MultipartRequest("POST", Uri.parse(serverUrl + "product"));
      var headers = {
        "Content-Type": "multipart/form-data",
        'Authorization': userToken
      };
      request.fields["name"] = productData["name"];
      request.fields["price"] = productData["price"].toString();
      request.fields["content"] = productData["content"];
      request.fields["negotiable"] =
          productData["negotiable"] == true ? "1" : "0";
      print(request.fields["negotiable"]);

      for (var file in productData["images"]) {
        Uri uri = Uri.parse(file.identifier);
        File tempFile = await toFile(uri);
        request.files
            .add(await http.MultipartFile.fromPath('images', tempFile.path));
      }

      request.headers.addAll(headers);
      await request.send();
      Get.back();
      Get.off(() => Scaffold(
            appBar: NormalAppbar(title: "上传成功"),
            body: Center(
              child: Text("感谢使用！"),
            ),
          ));
    } catch (e) {
      Get.back();
      Get.snackbar("上传失败", "请检查一下网络状态");
    }
  }

  // 본인의 id를 저장한다
  Future<void> getMyId() async {
    var userId = await http.post(Uri.parse(serverUrl + "login/user/token"),
        headers: {'Authorization': userToken});
    myId = jsonDecode(userId.body)["id"];
  }

  ApiHelper() {
    getMyId();
  }
}

ApiHelper apiHelper = ApiHelper();
