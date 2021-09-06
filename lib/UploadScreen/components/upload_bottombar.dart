import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/lined_box.dart';
import 'package:quanyi/widgets/normal_button.dart';

class UploadScreenBottomBar extends StatelessWidget {
  const UploadScreenBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: linedBox(top: true),
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: BottomBarButton(
              backgroundColor: kAccentColor,
              text: "上传我的货",
              textScaleFactor: 1.5,
              textColor: Colors.white,
              onTap: () {
                // 채팅화면으로 전환
              },
            ),
          )
        ],
      ),
    );
  }
}
