import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/components/upload_contents/upload_images.dart';
import 'package:quanyi/UploadScreen/components/upload_contents/upload_texts.dart';
import 'package:quanyi/UploadScreen/getxControllers/post_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/widgets/kdivider.dart';

class UploadContents extends StatelessWidget {
  UploadContents({Key? key}) : super(key: key);

  final double screenWidth = SizeConfig.screenWidth;
  final postController = Get.put(PostController());

  Widget customHint({required String title}) {
    return Text(
      title,
      textScaleFactor: 1.5,
      style: TextStyle(
        color: kTextColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 이미지를 업로드 한다
          Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: customHint(title: '图像')),
          UploadImages(),
          KDivider(height: 40),
          // 제목을 업로드 한다
          customHint(title: '标题'),
          UploadTexts(upload: Upload.name),
          KDivider(height: 40),
          // 금액을 입력한다 & 협상 가능 여부
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UploadTexts(upload: Upload.price),
                Obx(() => Row(
                      children: [
                        CupertinoSwitch(
                          value: postController.negotiable.value,
                          activeColor: kAccentColor,
                          onChanged: (value) {
                            postController.updateNego();
                          },
                        ),
                        Container(
                          width: 60,
                          child: Text(
                            postController.negotiable.value == true
                                ? "可协商"
                                : "不可协商",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: kTextColor),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
          KDivider(height: 40),
          // 본 게시물 내용을 입력한다
          customHint(title: '内容'),
          UploadTexts(upload: Upload.content),
        ],
      ),
    );
  }
}
