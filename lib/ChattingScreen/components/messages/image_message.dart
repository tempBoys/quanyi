import 'package:flutter/material.dart';
import 'package:quanyi/models/size_config.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.45,
      child: AspectRatio(
        aspectRatio: 1.6,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset("assets/images/Video Place Here.png"),
        ),
      ),
    );
  }
}
