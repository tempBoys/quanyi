import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ChatsScreen/components/messages/message_ballon.dart';
import 'package:quanyi/ChatsScreen/getxControllers/chat_controller.dart';
import 'package:quanyi/models/constants.dart';

class ChatField extends StatelessWidget {
  ChatField({Key? key}) : super(key: key);
  final chatController = Get.put(ChatController());
  @override
  Widget build(BuildContext context) {
    return Obx(() => Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: ListView.builder(
              itemCount: chatController.storedChat.length,
              itemBuilder: (ctx, index) => MessageBallon(
                message: chatController.storedChat[index],
              ),
            ),
          ),
        ));
  }
}
