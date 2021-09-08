import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/api_helper.dart';
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
              onTap: () async {
                await apiHelper.postProduct(productData: {
                  "name": "젤다 팝니다3",
                  "price": 230,
                  "content": "군대 간 아버지가 남겨놓은 마지막 물건입니다. 선착순 띱",
                });
                print("object");
              },
            ),
          )
        ],
      ),
    );
  }
}
