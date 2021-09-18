import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ReviewScreen/components/buyer_box.dart';
import 'package:quanyi/ReviewScreen/models/buyer_box_controller.dart';
import 'package:quanyi/ReviewScreen/models/create_buyer_boxes.dart';
import 'package:quanyi/ReviewScreen/models/dummy_data.dart';
import 'package:quanyi/HomeScreen/components/product_list.dart';
import 'package:quanyi/ReviewScreen/screens/review_writing_screen.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';
import 'package:quanyi/widgets/kdivider.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class ChooseBuyerScreen extends StatefulWidget {
  const ChooseBuyerScreen({Key? key}) : super(key: key);

  @override
  _ChooseBuyerScreenState createState() => _ChooseBuyerScreenState();
}

class _ChooseBuyerScreenState extends State<ChooseBuyerScreen> {
  @override
  Widget build(BuildContext context) {
    BuyerBoxController buyerBoxController =
        Get.put(BuyerBoxController(buyerBoxes: createBuyerBoxes(buyers)));
    return Scaffold(
      appBar: NormalAppbar(
        title: "选择购买者",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
            child: ProductList(id: 1),
          ),
          KDivider(
            height: 10.0,
          ),
          Flexible(
            child: GetBuilder<BuyerBoxController>(
              builder: (controller) => controller.buyerBoxes,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: kBottomNavigationBarHeight,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.symmetric(
            horizontal: BorderSide(
              color: Colors.grey.shade100,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 5.0),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                ),
                onPressed: () {
                  Get.to(() => ReviewWritingScreen());
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: Center(
                    child: Text(
                      "删除",
                      style: TextStyle(
                        fontSize: 15.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
