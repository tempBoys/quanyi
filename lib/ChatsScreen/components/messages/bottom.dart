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
  final messageController = Get.put(MessageController());
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
            messageController.loadImages();
          },
        ),
        SizedBox(width: kDefaultPadding * 0.75),
        Expanded(
          child: Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: TextField(
              maxLines: 1,
              controller: textController,
              onSubmitted: (value) async {
                await messageController.sendMessage(
                    sender: myId,
                    receriver: chatController.user["id"],
                    productId: chatController.product["id"],
                    message: value);
                chatController.storeChat(message: value);
                textController.clear();
              },
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kIconColor)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: kIconColor)),
                contentPadding: EdgeInsets.symmetric(horizontal: 5),
                suffixIcon: GestureDetector(
                    child: Icon(
                      Icons.close,
                      size: 25,
                      color: kIconColor,
                    ),
                    onTap: () {
                      textController.clear();
                    }),

                // counter: Container(),
                // contentPadding: EdgeInsets.symmetric(
                //     horizontal: kDefaultPadding, vertical: 5),
                // hintText: "最多15个字",
                // hintStyle: TextStyle(fontSize: 10),
              ),
            ),
          ),
        ),
        // SizedBox(width: kDefaultPadding * 0.75),
        // GestureDetector(
        //   child: Icon(
        //     Icons.navigate_next_outlined,
        //     size: 25,
        //     color: kIconColor,
        //   ),
        //   onTap: () {
        //     try {
        //       messageController.sendMessage(
        //           sender: myId,
        //           receriver: chatController.user["id"],
        //           productId: chatController.product["id"],
        //           message: textController.text);
        //       chatController.storeChat(message: textController.text);
        //       textController.clear();
        //     } catch (e) {
        //       Get.snackbar("传送失败", "请检查一下网络状态");
        //     }
        //   },
        // )
      ],
    );
  }
}
