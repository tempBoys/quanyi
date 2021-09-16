import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quanyi/LoginScreen/models/texts.dart';
import 'package:quanyi/LoginScreen/models/keyboard.dart';
import 'package:quanyi/LoginScreen/screens/sign_up_screen.dart';
import 'package:get/get.dart';
import 'package:quanyi/models/constants.dart';

void sendSignUpData(BuildContext context) async {
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
                Text(kSigningUp),
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
          Uri.parse("${kServerAddress}user"),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(<String, String?>{
            "phone_number": SignUpScreen.phoneNum,
            "password": SignUpScreen.password,
            "user_name": SignUpScreen.name,
          }),
        )
        .timeout(const Duration(seconds: 5));
    print(_res.body);
    if (_res.statusCode == 201) {
      Get.offAllNamed('/SignUpSuccess');
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
