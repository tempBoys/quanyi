import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/LoginScreen/components/no_account_text.dart';
import 'package:quanyi/LoginScreen/components/sign_form.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0.0,
        title: Text(
          kSignIn,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                NoAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
