import 'package:flutter/material.dart';
import 'package:quanyi/ChatsScreen/components/messages/image_message.dart';
import 'package:quanyi/ChatsScreen/components/messages/text_message.dart';
import 'package:quanyi/ChatsScreen/models/ChatMessage.dart';
import 'package:quanyi/models/constants.dart';

class MessageBallon extends StatelessWidget {
  final ChatMessage message;
  MessageBallon({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget messageContaint(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.video:
          return ImageMessage();
        default:
          return SizedBox();
      }
    }

    return Padding(
      padding: EdgeInsets.only(top: kDefaultPadding),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender)
            CircleAvatar(
              radius: 12,
            ),
          SizedBox(width: kDefaultPadding / 2),
          messageContaint(message)
        ],
      ),
    );
  }
}
