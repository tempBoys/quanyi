import 'package:flutter/material.dart';
import 'package:quanyi/ChatsScreen/components/messages/bottom.dart';
import 'package:quanyi/ChatsScreen/components/messages/chat_field.dart';
import 'package:quanyi/models/constants.dart';

class MessagesScreenBody extends StatelessWidget {
  const MessagesScreenBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ChatField(),
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
      ),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
    );
  }
}
