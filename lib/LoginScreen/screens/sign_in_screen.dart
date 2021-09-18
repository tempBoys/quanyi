import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/LoginScreen/components/no_account_text.dart';
import 'package:quanyi/LoginScreen/components/sign_form.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

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
      appBar: NormalAppbar(title: kSignIn),
      body: GestureDetector(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
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
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
