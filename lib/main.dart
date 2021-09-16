import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/api_helper.dart';
import 'package:quanyi/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushy_flutter/pushy_flutter.dart';

void main() {
  runApp(QuanYi());
}

void backgroundNotificationListener(Map<String, dynamic> data) async {
  // Print notification payload data
  var tempData = jsonDecode(data["data"]);
  var senderId = await apiHelper.getUser(id: tempData["sender"]);
  var productId = await apiHelper.getUser(id: tempData["product"]);
  print("senderId : $senderId");
  print("productId : $productId");
  // Attempt to extract the "message" property from the payload: {"message":"Hello World!"}
  String notificationText = tempData['data'] ?? 'Hello World!';
  // Android: Displays a system notification
  // iOS: Displays an alert dialog
  Pushy.notify(senderId["user_name"], notificationText, data);
  // Clear iOS app badge number
  Pushy.clearBadge();
}

class QuanYi extends StatefulWidget {
  @override
  _QuanYiState createState() => _QuanYiState();
}

class _QuanYiState extends State<QuanYi> {
  Future pushyRegister() async {
    try {
      // Register the user for push notifications
      deviceToken = await Pushy.register();
      print(deviceToken);
    } on PlatformException {}
  }

  @override
  void initState() {
    super.initState();
    // Start the Pushy service
    Pushy.listen();
    pushyRegister();
    Pushy.setNotificationListener(backgroundNotificationListener);
    Pushy.setNotificationClickListener((Map<String, dynamic> data) {
      String message = data["data"] ?? '';

      // Display an alert with the "message" payload value
      Get.defaultDialog(title: "판매자 이름", middleText: message);

      // Clear iOS app badge number
      Pushy.clearBadge();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      theme: ThemeData(
          fontFamily: "NotoSansSC", backgroundColor: kBackGroundColor),
      initialRoute: "${AppRoutes.DASHBOARD}SignInLoading",
      getPages: AppScreens.list,
      debugShowCheckedModeBanner: false,
    );
  }
}
