import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/upload.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/kdivider.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'components/product_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackGroundColor,
      appBar: NormalAppbar(
        title: "主页",
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(CupertinoIcons.bell),
            onPressed: () {},
          )
        ],
      ),
      // 상품 리스트 목록
      body: ListView.separated(
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: ProductList(id: index));
          },
          separatorBuilder: (BuildContext ctx, int index) {
            return KDivider(height: 10);
          },
          itemCount: 10),
      // 상품 올리기 버튼
      floatingActionButton: FloatingActionButton(
        tooltip: "上传我的货",
        backgroundColor: kAccentColor,
        elevation: 1,
        child: Icon(Icons.add_outlined, size: 30),
        onPressed: () async {
          Get.to(() => UploadScreen());
        },
      ),
    );
  }
}

class HomeController extends GetxController {}
