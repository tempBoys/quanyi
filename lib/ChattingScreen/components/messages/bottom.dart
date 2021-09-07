import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';

class MessagesScreenBottom extends StatefulWidget {
  const MessagesScreenBottom({Key? key}) : super(key: key);

  @override
  _MessagesScreenBottomState createState() => _MessagesScreenBottomState();
}

class _MessagesScreenBottomState extends State<MessagesScreenBottom> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.camera_alt_outlined,
          size: 50,
          color: kIconColor,
        ),
        SizedBox(width: kDefaultPadding * 0.75),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
                color: kBoxLightColor.withOpacity(0.05),
                borderRadius: BorderRadius.circular(6)),
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: 50,
                    width: 160,
                    child: TextFormField(
                      maxLines: 3,
                      controller: textController,
                      decoration: InputDecoration(border: InputBorder.none),
                    )),
                Icon(
                  Icons.sentiment_satisfied_alt_outlined,
                  size: 50,
                  color: kIconColor,
                ),
              ],
            ),
          ),
        ),
        Icon(
          Icons.navigate_next_outlined,
          size: 50,
          color: kIconColor,
        )
      ],
    );
  }
}
