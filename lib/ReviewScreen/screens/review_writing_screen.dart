import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ReviewScreen/components/buyer_box.dart';
import 'package:quanyi/ReviewScreen/components/review_bottombar.dart';
import 'package:quanyi/ReviewScreen/components/write_review.dart';
import 'package:quanyi/ReviewScreen/models/buyer_box_controller.dart';
import 'package:quanyi/ReviewScreen/models/create_buyer_boxes.dart';
import 'package:quanyi/ReviewScreen/models/dummy_data.dart';
import 'package:quanyi/HomeScreen/components/product_list.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/widgets/kdivider.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class ReviewWritingScreen extends StatefulWidget {
  const ReviewWritingScreen({Key? key}) : super(key: key);

  @override
  _ReviewWritingScreenState createState() => _ReviewWritingScreenState();
}

class _ReviewWritingScreenState extends State<ReviewWritingScreen> {
  @override
  Widget build(BuildContext context) {
    BuyerBoxController buyerBoxController =
        Get.put(BuyerBoxController(buyerBoxes: createBuyerBoxes(buyers)));
    return Scaffold(
      appBar: NormalAppbar(
        title: "填写评价",
      ),
      body: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
          child: WriteReview(),
        ),
        onTap: () {
          FocusScope.of(context).unfocus();
        },
      ),
      bottomNavigationBar: ReviewBottomBar(),
    );
  }
}
