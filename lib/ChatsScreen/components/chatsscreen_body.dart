import 'package:flutter/material.dart';
import 'package:quanyi/ChatsScreen/components/chat_card.dart';
import 'package:quanyi/ChatsScreen/models/Chat.dart';

class ChatsScreenBody extends StatelessWidget {
  const ChatsScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: chatsData.length,
      itemBuilder: (context, index) => ChatCard(
        chat: chatsData[index],
      ),
    );
  }
}
