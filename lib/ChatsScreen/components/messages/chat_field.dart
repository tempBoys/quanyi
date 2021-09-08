import 'package:flutter/material.dart';
import 'package:quanyi/ChatsScreen/components/messages/message_ballon.dart';
import 'package:quanyi/ChatsScreen/models/ChatMessage.dart';
import 'package:quanyi/models/constants.dart';

class ChatField extends StatelessWidget {
  const ChatField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: ListView.builder(
          itemCount: demeChatMessages.length,
          itemBuilder: (ctx, index) => MessageBallon(
            message: demeChatMessages[index],
          ),
        ),
      ),
    );
  }
}
