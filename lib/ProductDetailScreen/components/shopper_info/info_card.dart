import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Container(
            width: 200,
            child: Card(
              elevation: 1.8,
              child: Container(
                height: kInfoCardHeight,
                padding: EdgeInsetsDirectional.only(start: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "판매자 이름",
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "현재 거주지",
                      textScaleFactor: 0.8,
                      style: TextStyle(color: kTextLightColor),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              right: 0,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[50],
                    ),
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "交易GPA",
                          textScaleFactor: 0.7,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("3.4")
                      ],
                    )),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
