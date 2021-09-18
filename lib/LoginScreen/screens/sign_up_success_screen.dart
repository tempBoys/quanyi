import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quanyi/LoginScreen/components/default_button.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class SignUpSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(title: kSignUpComplete),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/Success.svg",
              height: SizeConfig.screenHeight * 0.2,
              color: Colors.black,
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            Text(
              kSignUpComplete,
              style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
            SizedBox(
              width: SizeConfig.screenWidth * 0.6,
              child: DefaultButton(
                text: kReturntoLoginPage,
                press: () {
                  Get.offAllNamed('SignIn');
                },
              ),
            ),
            SizedBox(height: SizeConfig.screenHeight * 0.08),
          ],
        ),
      ),
    );
  }
}
