import 'package:flutter/material.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/router/app_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:quanyi/models/utils/server_address.dart';

class SignInLoadingScreen extends StatefulWidget {
  const SignInLoadingScreen({Key? key}) : super(key: key);
  static final storage = new FlutterSecureStorage();
  @override
  _SignInLoadingScreenState createState() => _SignInLoadingScreenState();
}

class _SignInLoadingScreenState extends State<SignInLoadingScreen> {
  @override
  void initState() {
    super.initState();
    _getToken();
  }

  void _getToken() async {
    var token = await SignInLoadingScreen.storage.read(key: 'token');
    if (token != null) {
      const String tokenLoginUrl = "${kServerAddress}login/user/token";
      final _res = await http.post(
        Uri.parse(tokenLoginUrl),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      print(_res.body);
      if (_res.statusCode == 201) {
        Get.offAllNamed(AppRoutes.DASHBOARD);
      } else {
        Get.offAllNamed("${AppRoutes.DASHBOARD}SignIn");
      }
    } else {
      Get.offAllNamed("${AppRoutes.DASHBOARD}SignIn");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
