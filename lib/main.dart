import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/router/app_page.dart';

void main() {
  runApp(QuanYi());
}

class QuanYi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppScreens.list,
      debugShowCheckedModeBanner: false,
    );
  }
}
