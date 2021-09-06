import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/getxControllers/description_controller.dart';
import 'package:quanyi/models/constants.dart';

class UploadTexts extends StatefulWidget {
  final Upload upload;
  UploadTexts({Key? key, required this.upload}) : super(key: key);

  @override
  _UploadTextsState createState() => _UploadTextsState();
}

class _UploadTextsState extends State<UploadTexts> {
  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    final reviewController = Get.put(DescriptionController());
    return Container(
      height: 120,
      child: TextFormField(
        maxLines: 10,
        controller: textController,
        decoration: InputDecoration(border: InputBorder.none),
        onChanged: (text) {
          widget.upload == Upload.description
              ? reviewController.updateDescription(text: text)
              : reviewController.updateTitle(text: text);
        },
      ),
    );
  }
}
