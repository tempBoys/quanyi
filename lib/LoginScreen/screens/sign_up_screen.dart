import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:flutter/material.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';
import 'package:quanyi/LoginScreen/components/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  static String phoneNum = '';
  static String password = '';
  static String name = '';
  Future<bool?> showWarning(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('페이지를 나가시겠습니까?\n변경 사항은 저장되지 않습니다'),
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
              '나가기',
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
            SignUpScreen.name != '') {
          final shouldPop = await showWarning(context);
          return shouldPop ?? false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          title: Text(
            kSignUp,
            style: TextStyle(
              color: kTextColor,
            ),
          ),
          backgroundColor: kAppBarColor,
        ),
        body: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
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
      ),
    );
  }
}
