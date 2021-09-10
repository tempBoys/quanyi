import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:quanyi/ChatsScreen/getxControllers/chat_controller.dart';
import 'package:quanyi/models/constants.dart';

class MessagesScreenBottom extends StatefulWidget {
  const MessagesScreenBottom({Key? key}) : super(key: key);

  @override
  _MessagesScreenBottomState createState() => _MessagesScreenBottomState();
}

class _MessagesScreenBottomState extends State<MessagesScreenBottom> {
  TextEditingController textController = TextEditingController();
  final chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          child: Icon(Icons.camera_alt_outlined, size: 25, color: kIconColor),
          onTap: () {
            chatController.loadImages();
          },
        ),
        SizedBox(width: kDefaultPadding * 0.75),
        Expanded(
          child: Container(
              height: 45,
              width: 120,
              child: TextFormField(
                cursorColor: kTextColor,
                maxLines: 1,
                maxLength: 15,
                controller: textController,
                decoration: InputDecoration(
                    suffixIcon: textController.text.length != 0
                        ? GestureDetector(
                            child: Icon(
                              Icons.close,
                              size: 25,
                              color: kIconColor,
                            ),
                            onTap: () {
                              textController.clear();
                            })
                        : Container(),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6)),
                    counter: SizedBox(),
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: kDefaultPadding, vertical: 5),
                    hintText: "最多15个字",
                    hintStyle: TextStyle(fontSize: 10)),
                onChanged: (text) {
                  chatController.updateText(text: text);
                },
              )),
        ),
        SizedBox(width: kDefaultPadding * 0.75),
        GestureDetector(
          child: Icon(
            Icons.navigate_next_outlined,
            size: 25,
            color: kIconColor,
          ),
          onTap: () {
            print(chatController.text);
            print(textController.text);
            Get.defaultDialog(title: "", middleText: chatController.text);
          },
        )
      ],
    );
  }
}
