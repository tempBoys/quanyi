import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:quanyi/LoginScreen/screens/sign_in_loading_screen.dart';
import 'package:quanyi/LoginScreen/models/keyboard.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';
import 'package:quanyi/router/app_page.dart';
import 'package:quanyi/models/utils/server_address.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

void sendLoginData(
    BuildContext context, String phoneNum, String password) async {
  KeyboardUtil.hideKeyboard(context);
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        content: Builder(
          builder: (context) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(kSigningIn),
                CircularProgressIndicator(),
              ],
            );
          },
        ),
      );
    },
    barrierDismissible: false,
  );
  try {
    final _res = await http
        .post(
          Uri.parse("${kServerAddress}login/user/local"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(<String, String>{
            "phone_number": phoneNum,
            "password": password,
          }),
        )
        .timeout(const Duration(seconds: 5));
    print(_res.body);
    if (_res.statusCode == 201) {
      final _token = _res.body;
      SignInLoadingScreen.storage.write(key: 'token', value: _token);
      Get.offAllNamed(AppRoutes.DASHBOARD);
    } else if (jsonDecode(_res.body)["message"] == "Unauthorized") {
      Get.back();
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Builder(
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Center(
                        child: Text(kUnregisteredUser),
                      ),
                    ),
                  ],
                );
              },
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  kConfirm,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        },
        barrierDismissible: false,
      );
    } else {
      Get.back();
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Builder(
              builder: (context) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Center(
                        child: Text(_res.body),
                      ),
                    ),
                  ],
                );
              },
            ),
            actions: [
              CupertinoDialogAction(
                child: Text(
                  kConfirm,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                onPressed: () {
                  Get.back();
                },
              ),
            ],
          );
        },
        barrierDismissible: false,
      );
    }
  } on TimeoutException catch (e) {
    Get.back();
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: Builder(
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    child: Center(
                      child: Text(kTimeoutError),
                    ),
                  ),
                ],
              );
            },
          ),
          actions: [
            CupertinoDialogAction(
              child: Text(
                kConfirm,
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
              onPressed: () {
                Get.back();
              },
            ),
          ],
        );
      },
      barrierDismissible: false,
    );
  }
}
