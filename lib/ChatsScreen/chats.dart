import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ChatsScreen/components/chats/chats_body.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class ChatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(title: "聊天"),
      body: ChatsScreenBody(),
    );
  }
}

class ChattingController extends GetxController {}
