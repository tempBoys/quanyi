import 'package:flutter/material.dart';
import 'package:quanyi/models/constants.dart';

class InfoCard extends StatelessWidget {
  final userName;
  final location;
  final profileImage;
  InfoCard({
    Key? key,
    required this.userName,
    required this.location,
    this.profileImage = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kInfoCardHeight,
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
                      userName,
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        color: kTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      location,
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
                      child: profileImage != ""
                          ? Image.network(profileImage)
                          : Container()),
                ),
              ))
        ],
      ),
    );
  }
}
