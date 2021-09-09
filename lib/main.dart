import 'package:quanyi/models/constants.dart';
import 'package:quanyi/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(QuanYi());
}

class QuanYi extends StatefulWidget {
  @override
  _QuanYiState createState() => _QuanYiState();
}

class _QuanYiState extends State<QuanYi> {
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
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppScreens.list,
      debugShowCheckedModeBanner: true,
    );
  }
}
