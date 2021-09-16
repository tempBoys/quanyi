import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:quanyi/LoginScreen/components/default_button.dart';
import 'package:quanyi/LoginScreen/components/custom_surfix_icon.dart';
import 'package:quanyi/LoginScreen/models/send_login_data.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/models/constants.dart';
import 'package:get/get.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String phoneNum = '';
  String password = '';

  bool firstVisitforPhoneNum = true;
  bool firstVisitforPW = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          buildPhoneNumFormField(),
          SizedBox(height: 30.h),
          buildPasswordFormField(),
          SizedBox(height: 50.h),
          DefaultButton(
            text: kSignIn,
            press: () {
              if (_formKey.currentState!.validate() &&
                  !firstVisitforPhoneNum &&
                  !firstVisitforPW) {
                _formKey.currentState!.save();
                sendLoginData(context, phoneNum, password);
              }
              setState(() {
                firstVisitforPhoneNum = false;
                firstVisitforPW = false;
              });
            },
            backgroundColor: (_formKey.currentState == null)
                ? Color(0xFFCCCCCC)
                : ((_formKey.currentState!.validate() &&
                        !firstVisitforPhoneNum &&
                        !firstVisitforPW)
                    ? Colors.black
                    : Color(0xFFCCCCCC)),
            textColor: (_formKey.currentState == null)
                ? Color(0xFF9E9E9E)
                : ((_formKey.currentState!.validate() &&
                        !firstVisitforPhoneNum &&
                        !firstVisitforPW)
                    ? Colors.white
                    : Color(0xFF9E9E9E)),
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value) {
        if (firstVisitforPW == true) {
          firstVisitforPW = false;
        }
        setState(() {
          password = value;
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
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        labelText: kPassword,
        hintText: kInputPassword,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/images/Lock.svg"),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
    );
  }

  TextFormField buildPhoneNumFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => phoneNum = newValue!,
      onChanged: (value) {
        setState(() {
          if (firstVisitforPhoneNum == true) {
            firstVisitforPhoneNum = false;
          }
          phoneNum = value;
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
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        labelText: kPhoneNum,
        hintText: kInputPhoneNum,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/images/Phone.svg"),
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ),
    );
  }

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: Color(0xFF757575)),
    gapPadding: 10,
  );
}
