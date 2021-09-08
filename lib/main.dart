import 'package:quanyi/models/constants.dart';
import 'package:quanyi/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(quanyi());
}

class quanyi extends StatelessWidget {
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
