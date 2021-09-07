import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ChattingScreen/models/Chat.dart';
import 'package:quanyi/ChattingScreen/screens/messages.dart';
import 'package:quanyi/models/constants.dart';

class ChatCard extends StatelessWidget {
  final Chat chat;
  ChatCard({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding, vertical: kDefaultPadding * 0.75),
        child: Row(
          children: [
            // 프로필 이미지
            CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(chat.image),
            ),
            // 이름과 최근 메시지
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(chat.name),
                    SizedBox(height: 8),
                    Text(chat.lastMessage,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                  ],
                ),
              ),
            ),
            // 최근 연락한 시간
            Text(chat.time),
          ],
        ),
      ),
      onTap: () {
        Get.to(() => MessagesScreen());
      },
    );
  }
}
