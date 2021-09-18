import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';
import 'package:quanyi/LoginScreen/components/sign_up_form.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class SignUpScreen extends StatelessWidget {
  static String phoneNum = '';
  static String password = '';
  static String name = '';
  static String address = '';
  Future<bool?> showWarning(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('是否退出？\n您所写的内容会消失！'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              kCancel,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              '退出',
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
        if (SignUpScreen.phoneNum != '' ||
            SignUpScreen.password != '' ||
            SignUpScreen.name != '' ||
            SignUpScreen.address != '') {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: NormalAppbar(title: kSignUp),
        body: GestureDetector(
          child: SafeArea(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                      SignUpForm(),
                      SizedBox(height: SizeConfig.screenHeight * 0.04),
                    ],
                  ),
                ),
              ),
            ),
          ),
          onTap: () {
            FocusScope.of(context).unfocus();
          },
        ),
      ),
    );
  }
}
