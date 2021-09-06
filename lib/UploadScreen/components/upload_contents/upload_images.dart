import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/getxControllers/description_controller.dart';
import 'package:quanyi/models/size_config.dart';

class UploadImages extends StatefulWidget {
  const UploadImages({Key? key}) : super(key: key);

  @override
  _UploadImagesState createState() => _UploadImagesState();
}

class _UploadImagesState extends State<UploadImages> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = SizeConfig.screenWidth;
    final reviewController = Get.put(DescriptionController());
    return Obx(() => Container(
          height: 75,
          width: screenWidth - 50, // 좌우의 패딩값 2*(15+10)
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                reviewController.images.length != 0
                    ? reviewController.generateImages()
                    : Container(),
                GestureDetector(
                  child: reviewController.addImageIcon,
                  onTap: reviewController.loadImages,
                ),
              ],
            ),
          ),
        ));
  }
}
