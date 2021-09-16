import 'dart:async';
import 'package:quanyi/LoginScreen/screens/sign_up_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:quanyi/LoginScreen/components/default_button.dart';
import 'package:quanyi/LoginScreen/components/sign_up_text_input_card.dart';
import 'package:quanyi/LoginScreen/models/send_sign_up_data.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';

import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:flutter/services.dart';

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();

  String confirmPassword = '';

  bool firstVisitforPhoneNum = true;
  bool firstVisitforPW = true;
  bool firstCreatePassword = true;
  bool firstVisitforName = true;

  @override
  void initState() {
    super.initState();
    SignUpScreen.phoneNum = '';
    SignUpScreen.password = '';
    SignUpScreen.name = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextInputWithoutBorder(
            obscureText: false,
            textInputType: TextInputType.number,
            onSaved: (newValue) => SignUpScreen.phoneNum = newValue!,
            onChanged: (value) {
              if (firstVisitforPhoneNum == true) {
                firstVisitforPhoneNum = false;
              }
              setState(() {
                SignUpScreen.phoneNum = value;
              });
            },
            validator: (value) {
              if (firstVisitforPhoneNum) {
                return null;
              } else if (value!.isEmpty) {
                return kRequestInputPhoneNum;
              } else if (!legalChinesePhoneNum.hasMatch(value)) {
                return kInvalidTelnumError;
              }
              return null;
            },
            hintText: kInputPhoneNum,
          ),
          SizedBox(height: 30.h),
          TextInputWithoutBorder(
            obscureText: true,
            onSaved: (newValue) => SignUpScreen.password = newValue!,
            onChanged: (value) {
              if (firstVisitforPW == true) {
                firstVisitforPW = false;
              }
              setState(() {
                SignUpScreen.password = value;
              });
            },
            validator: (value) {
              if (firstVisitforPW) {
                return null;
              } else if (value!.isEmpty) {
                return kRequestInputPassword;
              } else if (value.length < 8) {
                return kShortPassError;
              }
              return null;
            },
            hintText: kInputPassword,
          ),
          SizedBox(height: 30.h),
          TextInputWithoutBorder(
            obscureText: true,
            onSaved: (newValue) => confirmPassword = newValue!,
            onChanged: (value) {
              if (firstCreatePassword == true) {
                firstCreatePassword = false;
              }
              setState(() {
                confirmPassword = value;
              });
            },
            validator: (value) {
              if (firstCreatePassword) {
                return null;
              } else if (value!.isEmpty) {
                return kRequestInputPassword;
              } else if ((SignUpScreen.password != value)) {
                return kMatchPassError;
              }
              return null;
            },
            hintText: kCheckPassword,
          ),
          SizedBox(height: 30.h),
          TextInputWithoutBorder(
            obscureText: false,
            onSaved: (newValue) => SignUpScreen.name = newValue!,
            onChanged: (value) {
              if (firstVisitforName == true) {
                firstVisitforName = false;
              }
              setState(() {
                SignUpScreen.name = value;
              });
            },
            validator: (value) {
              if (firstVisitforName) {
                return null;
              } else if (value!.isEmpty) {
                return kRequestInputName;
              }
              return null;
            },
            hintText: kInputName,
          ),
          SizedBox(height: 30.h),
          SizedBox(height: getProportionateScreenHeight(10)),
          DefaultButton(
            text: kSignUp,
            press: () {
              if (_formKey.currentState!.validate() &&
                  !firstVisitforPhoneNum &&
                  !firstVisitforPW &&
                  !firstCreatePassword &&
                  !firstVisitforName) {
                _formKey.currentState!.save();
                sendSignUpData(context);
              }
              setState(() {
                firstVisitforPhoneNum = false;
                firstVisitforPW = false;
                firstCreatePassword = false;
                firstVisitforName = false;
              });
            },
            backgroundColor: (_formKey.currentState == null)
                ? Color(0xFFCCCCCC)
                : ((_formKey.currentState!.validate() &&
                        !firstVisitforPhoneNum &&
                        !firstVisitforPW &&
                        !firstCreatePassword &&
                        !firstVisitforName)
                    ? Colors.black
                    : Color(0xFFCCCCCC)),
            textColor: (_formKey.currentState == null)
                ? Color(0xFF9E9E9E)
                : ((_formKey.currentState!.validate() &&
                        !firstVisitforPhoneNum &&
                        !firstVisitforPW &&
                        !firstCreatePassword &&
                        !firstVisitforName)
                    ? Colors.white
                    : Color(0xFF9E9E9E)),
          ),
        ],
      ),
    );
  }
}
