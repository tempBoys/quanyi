import 'package:flutter/material.dart';

// Icon 관련
const kIconSearch = Icons.search;
const kIconHeart = Icons.favorite_border_outlined;
const kIconAlarm = Icons.alarm_add_outlined;
const kIconCart = Icons.shopping_cart_outlined;

// Text 관련
const kTitleTextStyle =
    TextStyle(color: kTextColor, fontWeight: FontWeight.bold);
const kSubTitleTextStyle =
    TextStyle(color: kTextColor, fontWeight: FontWeight.bold, fontSize: 20);
const kTextLightStyle = TextStyle(color: Colors.black26);
const kAppBarTextScaleFactor = 1.15;
const kTextScaleFactor = 1.2;

// Color
const kAppBarColor = Colors.white;
const kBackGroundColor = Colors.white;
const kAccentColor = Color(0xFFFF6024);
const kPrimaryColor = Color(0xFF384483);
const kSecondaryColor = Color(0xFFCBE1EC);

const kBoxLightColor = Colors.black12;
const kIconColor = Color(0xFF707070);

const kTextColor = Color(0xFF333333);
const kTextLightColor = Color(0xFF999999);

// Padding
const double kDefaultPadding = 15.0;

// Size
const kMarketProfileImageSize = 25.0;
const kProductOptionSelectHeight = 45.0;
final kInfoCardHeight = 80.0;

// Widget 관련
BorderSide kBorderLine = BorderSide(color: Color(0xFFF2F2F2), width: 1);

// 상품 업로드 관련
enum Upload { name, content, price }
enum ProductsListType { favorites, purchased, sold }

enum Authentication { SignUp, ResetPassword }

final RegExp onlyDigits = RegExp("[0-9]+");

final RegExp legalChinesePhoneNum = RegExp(
    '^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$');

const String kServerAddress = "http://7534-124-14-224-4.ngrok.io/";
String deviceToken = "";
int myId = 1;
