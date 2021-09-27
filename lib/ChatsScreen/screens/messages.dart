import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ChatsScreen/components/messages/body.dart';
import 'package:quanyi/ChatsScreen/getxControllers/chat_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/number_formatter.dart';
import 'package:quanyi/widgets/normal_appbar_with_bottom.dart';

class MessagesScreen extends StatelessWidget {
  final messageController = Get.put(ChatController());
  final int userId;
  final int productId;
  MessagesScreen({
    Key? key,
    this.userId = 0,
    this.productId = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    messageController.loadData(
        receiverId: Get.arguments["user"]["id"],
        productId: Get.arguments["productID"]);
    return Scaffold(
      appBar: NormalAppbarWithBottom(
        isTitleText: false,
        title: Row(
          children: [
            CircleAvatar(),
            SizedBox(width: kDefaultPadding * 1.5),
            Text(
              Get.arguments["user"]["user_name"],
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
                ),
                child: Image.network(
                  Get.arguments["productImage"],
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Get.arguments["productName"],
                    textScaleFactor: 0.9,
                    style: TextStyle(color: kTextColor),
                  ),
                  Text(
                    "${numFormatter.format(Get.arguments["price"])} 元",
                    style: TextStyle(
                        color: kTextColor, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: GestureDetector(
        child: MessagesScreenBody(),
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      ),
    );
  }
}
