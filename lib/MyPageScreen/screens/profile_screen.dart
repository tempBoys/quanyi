import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/widgets/normal_appbar.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/widgets/normal_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userName = "${Get.arguments}";
  String tempUserName = "${Get.arguments}";

  Future<bool?> showWarning(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("你确定要离开吗"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              "取消",
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              "确定",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (tempUserName != userName) {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: NormalAppbar(
          title: "我的信息",
        ),
        body: Padding(
          padding: EdgeInsets.all(13.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 40.w,
                backgroundImage: NetworkImage(
                    "http://cdn.cnn.com/cnnnext/dam/assets/191201230412-01-mohe-china-super-tease.jpg"),
              ),
              TextFormField(
                initialValue: "${Get.arguments}",
                onSaved: (newValue) => tempUserName = newValue!,
                onChanged: (value) {
                  setState(() {
                    tempUserName = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "名字不能为空";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "请输入名字",
                  hintStyle: TextStyle(height: 2, fontWeight: FontWeight.bold),
                  hintText: "",
                ),
              ),
              SizedBox(
                height: 30.h,
                //height: 15.h,
              ),
              BottomBarButton(
                onTap: () {
                  Get.back();
                },
                backgroundColor: Colors.black,
                text: "确定",
                textColor: Colors.white,
                textScaleFactor: 1.5.h,
                height: 60.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
