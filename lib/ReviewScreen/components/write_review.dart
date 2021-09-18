import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quanyi/UploadScreen/components/upload_contents/upload_texts.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/widgets/kdivider.dart';

class WriteReview extends StatefulWidget {
  const WriteReview({Key? key}) : super(key: key);

  @override
  _WriteReviewState createState() => _WriteReviewState();
}

class _WriteReviewState extends State<WriteReview> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              '제목',
              textScaleFactor: 1.5,
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          UploadTexts(upload: Upload.name),
          KDivider(height: 20),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              '게시물 내용',
              textScaleFactor: 1.5,
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          UploadTexts(upload: Upload.content),
        ],
      ),
    );
  }
}
