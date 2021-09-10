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
            SizedBox(width: kDefaultPadding * 1.5),
            Text(
              "판매자 이름",
              style: TextStyle(color: kTextColor),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            children: [
              // 상품 이미지
              Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: kAccentColor,
                ),
              ),
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "상품 이름",
                    textScaleFactor: 0.9,
                    style: TextStyle(color: kTextColor),
                  ),
                  Text(
                    "상품 가격",
                    style: TextStyle(
                        color: kTextColor, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: MessagesScreenBody(),
    );
  }
}
