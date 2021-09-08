import 'dart:convert';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart' as dio;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'package:uri_to_file/uri_to_file.dart';

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
      request.fields["name"] = productData["name"];
      request.fields["price"] = productData["price"].toString();
      request.fields["content"] = productData["content"];
      request.fields["negotiable"] = productData["negotiable"];

      // var request = http.MultipartRequest(
      //     'POST', Uri.parse(serverUrl + "product/image/test"));
      for (var file in productData["images"]) {
        Uri uri = Uri.parse(file.identifier);
        File tempFile = await toFile(uri);
        print(tempFile.path);
        request.files
            .add(await http.MultipartFile.fromPath('images', tempFile.path));
      }

      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        Get.off(() => Scaffold(
              appBar: NormalAppbar(title: "上传成功"),
              body: Center(
                child: Text("感谢使用！"),
              ),
            ));
      } else {
        Get.snackbar("上传失败", "请检查一下网络状态");
      }

      // // create multipart request
      // for (Asset asset in productData["images"]) {
      //   ByteData byteData = await asset.getByteData();
      //   List<int> imageData = byteData.buffer.asUint8List();

      //   http.MultipartFile multipartFile = http.MultipartFile.fromBytes(
      //     'image',
      //     imageData,
      //     filename: 'some-file-name.jpg',
      //   );
      //   multipartFileList.add(multipartFile);
      // }
      // request.fields["images"] = multipartFileList.toString();
      // // request.fields["images"] = productData["images"];

      // await request.send();
    } catch (e) {
      print(e);
    }
  }
}

ApiHelper apiHelper = ApiHelper();
