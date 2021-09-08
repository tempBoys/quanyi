import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/HomeScreen/components/custom_list_tile.dart';
import 'package:quanyi/MyPageScreen/screens/favorites_screen.dart';
import 'package:quanyi/MyPageScreen/screens/profile_screen.dart';
import 'package:quanyi/MyPageScreen/screens/purchase_history_screen.dart';
import 'package:quanyi/MyPageScreen/screens/sale_history_screen.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/MyPageScreen/components/custom_bottom.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'package:quanyi/widgets/normal_button.dart';
import 'package:quanyi/widgets/kdivider.dart';

class MyPageMainScreen extends StatelessWidget {
  MyPageMainScreen({Key? key}) : super(key: key);

  String userName = "User Name";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(
        title: "我的信息",
        actions: [
          IconButton(
            icon: Icon(Icons.location_searching),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(13.w),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.w,
                  backgroundImage: NetworkImage(
                      "http://cdn.cnn.com/cnnnext/dam/assets/191201230412-01-mohe-china-super-tease.jpg"),
                ),
                SizedBox(
                  width: 20.0,
                ),
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
                Get.to(() => ProfileScreen(), arguments: userName);
              },
            ),
            SizedBox(
              height: 25.h,
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
            KDivider(
              height: 50.h,
            ),
            Flexible(
              child: ListView(
                children: [
                  CustomListTile(
                    iconData: Icons.location_on_outlined,
                    text: "设置我的地区",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomListTile(
                    iconData: Icons.location_searching_outlined,
                    text: "验证我的地区",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomListTile(
                    iconData: Icons.local_offer_outlined,
                    text: "关键词通知",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  CustomListTile(
                    iconData: Icons.menu_outlined,
                    text: "菜单",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}