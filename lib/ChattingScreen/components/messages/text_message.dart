import 'package:flutter/material.dart';
import 'package:quanyi/ChattingScreen/models/ChatMessage.dart';
import 'package:quanyi/models/constants.dart';

class TextMessage extends StatelessWidget {
  final ChatMessage message;
  TextMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding * 0.75, vertical: kDefaultPadding / 2),
      decoration: BoxDecoration(
          color: kAccentColor.withOpacity(message.isSender ? 1 : 0.1),
          borderRadius: BorderRadius.circular(6)),
      child: Text(
        message.text,
        style: TextStyle(color: message.isSender ? Colors.white : kTextColor),
      ),
    );
  }
}
