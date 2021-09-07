import 'package:quanyi/ChattingScreen/chatting.dart';
import 'package:quanyi/HomeScreen/home.dart';
import 'package:quanyi/MyPageScreen/my_page.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  RxInt tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}

class DashboardScreen extends StatelessWidget {
  final dashboardController = Get.put(DashboardController());
  _bottomNavigationBarItem({required IconData icon, String label = ''}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(() => Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: IndexedStack(
              index: dashboardController.tabIndex.value,
              children: [
                HomeScreen(),
                ChatsScreen(),
                MyPageScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: kIconColor,
            selectedItemColor: kAccentColor,
            onTap: dashboardController.changeTabIndex,
            currentIndex: dashboardController.tabIndex.value,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: CupertinoIcons.home,
                label: '主页',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.chat_bubble_text,
                label: '聊天',
              ),
              _bottomNavigationBarItem(
                icon: CupertinoIcons.person,
                label: '我的信息',
              ),
            ],
          ),
        ));
  }
}

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ChattingController>(() => ChattingController());
    Get.lazyPut<MyPageController>(() => MyPageController());
  }
}
