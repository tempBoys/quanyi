import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/getxControllers/post_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/lined_box.dart';
import 'package:quanyi/widgets/normal_button.dart';

class UploadScreenBottomBar extends StatelessWidget {
  UploadScreenBottomBar({Key? key}) : super(key: key);
  final postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: linedBox(top: true),
      child: Column(
        children: [
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: BottomBarButton(
              backgroundColor: kAccentColor,
              text: "上传我的货",
              textScaleFactor: 1.5,
              textColor: Colors.white,
              onTap: () async {
                await postController.upload(productData: {
                  "name": postController.name,
                  "price": postController.price,
                  "content": postController.content,
                  "negotiable": postController.negotiable.value,
                  "images": postController.images
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
