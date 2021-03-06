import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/components/upload_bottombar.dart';
import 'package:quanyi/UploadScreen/components/upload_contents.dart';
import 'package:quanyi/UploadScreen/getxControllers/post_controller.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class UploadScreen extends StatefulWidget {
  UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(title: "上传我的货"),
      body: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: UploadContents(),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      ),
      bottomNavigationBar: UploadScreenBottomBar(),
    );
  }
}
