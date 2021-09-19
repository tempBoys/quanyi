import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/MyPageScreen/screens/favorites_screen.dart';
import 'package:quanyi/MyPageScreen/screens/profile_screen.dart';
import 'package:quanyi/MyPageScreen/screens/purchase_history_screen.dart';
import 'package:quanyi/MyPageScreen/screens/sale_history_screen.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/MyPageScreen/components/custom_bottom.dart';
import 'package:quanyi/models/utils/api_helper.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'package:quanyi/widgets/normal_button.dart';

class MyPageMainScreen extends StatelessWidget {
  MyPageMainScreen({Key? key}) : super(key: key);

  static String userName = "User Name";
  static String address = "北京市海淀区燕园街道";
  static String phoneNum = "13512345678";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(title: "我的信息"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.w,
                  backgroundImage: NetworkImage(
                      "http://cdn.cnn.com/cnnnext/dam/assets/191201230412-01-mohe-china-super-tease.jpg"),
                ),
                SizedBox(width: 20.0),
                Text(
                  userName,
                  style: TextStyle(
                    fontSize: 20.w,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            BottomBarButton(
              text: "查看用户信息",
              textScaleFactor: 1.5.h,
              height: 50.h,
              onTap: () {
                Get.to(() => ProfileScreen(), arguments: {
                  "name": userName,
                  "address": address,
                  "phoneNum": phoneNum
                });
              },
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                  onPressed: () {
                    Get.to(() => SalesHistoryScreen());
                  },
                  iconData: Icons.receipt,
                  text: "销售明细",
                ),
                CustomButton(
                  onPressed: () {
                    Get.to(() => PurchaseHistoryScreen());
                  },
                  iconData: Icons.local_mall_outlined,
                  text: "购买明细",
                ),
                CustomButton(
                  onPressed: () {
                    Get.to(() => FavoritesScreen());
                  },
                  iconData: Icons.favorite_outline,
                  text: "收藏",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
