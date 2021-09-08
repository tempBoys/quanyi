import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/getxControllers/post_controller.dart';
import 'package:quanyi/models/size_config.dart';

class UploadImages extends StatelessWidget {
  const UploadImages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = SizeConfig.screenWidth;
    final postController = Get.put(PostController());
    return Obx(() => Container(
          height: 75,
          width: screenWidth - 50, // 좌우의 패딩값 2*(15+10)
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                postController.images.length != 0
                    ? postController.generateImages()
                    : Container(),
                GestureDetector(
                    child: postController.addImageIcon,
                    onTap: postController.loadImages),
              ],
            ),
          ),
        ));
  }
}
