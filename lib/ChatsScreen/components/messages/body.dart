import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ChatsScreen/components/messages/bottom.dart';
import 'package:quanyi/ChatsScreen/components/messages/chat_field.dart';
import 'package:quanyi/ChatsScreen/components/messages/message_ballon.dart';
import 'package:quanyi/ChatsScreen/getxControllers/chat_controller.dart';
import 'package:quanyi/models/constants.dart';

class MessagesScreenBody extends StatelessWidget {
  MessagesScreenBody({Key? key}) : super(key: key);
  final chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => chatController.generateChats()),
        // 채팅을 입력하는 곳
        Container(
          height: 90,
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding / 1.5),
          decoration: BoxDecoration(
            border: Border(top: kBorderLine),
            color: kBackGroundColor,
          ),
          child: MessagesScreenBottom(),
        )
      ],
    );
  }
}
