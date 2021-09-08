import 'package:flutter/material.dart';
import 'package:quanyi/ChatsScreen/components/messages/body.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/normal_appbar_with_bottom.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbarWithBottom(
        isTitleText: false,
        title: Row(
          children: [
            CircleAvatar(),
            SizedBox(
              width: kDefaultPadding * 1.5,
            ),
            Text(
              "판매자 이름",
              style: TextStyle(color: kTextColor),
            )
          ],
        ),
      ),
      body: MessagesScreenBody(),
    );
  }
}
