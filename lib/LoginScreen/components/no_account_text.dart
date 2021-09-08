import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/LoginScreen/models/texts.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 56.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   kDontHaveAccount,
            //   style: TextStyle(fontSize: 16.w),
            //   //16.w
            // ),
            // SizedBox(
            //   width: 10.0,
            // ),
            // GestureDetector(
            //   onTap: () => Get.toNamed("/SignUp"),
            //   child: Text(
            //     kSignUp,
            //     style: TextStyle(fontSize: 16.w, color: kPrimaryColor),
            //     //16.w
            //   ),
            // ),
            Text(
              kSignUp,
              style: TextStyle(fontSize: 18.w),
              //16.w
            ),
          ],
        ),
      ),
      onTap: () => Get.toNamed("/SignUp"),
    );
  }
}
