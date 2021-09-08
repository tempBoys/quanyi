import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/components/upload_contents/upload_images.dart';
import 'package:quanyi/UploadScreen/components/upload_contents/upload_texts.dart';
import 'package:quanyi/UploadScreen/getxControllers/description_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/widgets/kdivider.dart';

class UploadContents extends StatefulWidget {
  const UploadContents({Key? key}) : super(key: key);

  @override
  _UploadContentsState createState() => _UploadContentsState();
}

class _UploadContentsState extends State<UploadContents> {
  final double screenWidth = SizeConfig.screenWidth;
  final postController = Get.put(PostController());
  bool _switchValue = false;
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
              children: [
                UploadTexts(upload: Upload.price),
                Row(
                  children: [
                    CupertinoSwitch(
                      value: _switchValue,
                      onChanged: (value) {
                        setState(() {
                          _switchValue = value;
                        });
                      },
                    ),
                    Text("협상 가능")
                  ],
                ),
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
