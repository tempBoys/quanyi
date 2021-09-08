import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quanyi/UploadScreen/getxControllers/post_controller.dart';
import 'package:quanyi/models/constants.dart';

class UploadTexts extends StatefulWidget {
  final Upload upload;
  UploadTexts({Key? key, required this.upload}) : super(key: key);

  @override
  _UploadTextsState createState() => _UploadTextsState();
}

class _UploadTextsState extends State<UploadTexts> {
  final TextEditingController textController = TextEditingController();
  final postController = Get.put(PostController());

  @override
  Widget build(BuildContext context) {
    var price;
    var count;
    final maxPrice = 10000.0;
    var height;
    var width = double.infinity;
    switch (widget.upload) {
      case Upload.content:
        count = 250;
        height = 120.0;
        break;
      case Upload.name:
        count = 30;
        height = 60.0;
        break;
      case Upload.price:
        count = 5;
        width = 150;
        height = 50.0;
    }
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        cursorColor: kTextColor,
        keyboardType: widget.upload == Upload.price
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        maxLines: widget.upload == Upload.content ? 10 : 1,
        maxLength: count,
        controller: textController,
        decoration: widget.upload == Upload.price
            ? InputDecoration(
                border: InputBorder.none,
                counter: SizedBox(),
                hintText: "最多 $maxPrice 元")
            : InputDecoration(
                border: InputBorder.none, hintText: "最多 $count 个字"),
        onChanged: (text) {
          switch (widget.upload) {
            case Upload.content:
              return postController.updateContent(text: text);
            case Upload.name:
              return postController.updateName(text: text);
            default:
              price = double.parse(text);
              return postController.updatePrice(text: price);
          }
        },
      ),
    );
  }
}
