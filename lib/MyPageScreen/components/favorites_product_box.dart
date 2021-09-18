import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/MyPageScreen/getXControllers/all_selected_controller.dart';
import 'package:quanyi/MyPageScreen/getXControllers/product_box_controller.dart';
import 'package:quanyi/MyPageScreen/models/product_data.dart';
import 'package:quanyi/ProductDetailScreen/product_detail.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/number_formatter.dart';

class ProductBox extends StatefulWidget {
  final Map<String, dynamic> info;
  ProductBox({Key? key, required this.info}) : super(key: key);

  @override
  _ProductBoxState createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Center(
            child: Checkbox(
              activeColor: kPrimaryColor,
              value: widget.info["selected"],
              shape: CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  widget.info["selected"] = value!;
                });
                Get.find<AllSelectedController>().changeStatusWithData();
                //saveCartData();
                Get.find<ProductBoxController>().refreshProductBox(
                    favoritesProductData, ProductsListType.favorites);
              },
            ),
          ),
        ),
        Flexible(
          flex: 7,
          child: GestureDetector(
            child: Container(
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 2,
                    // 해당 상품 이미지
                    child: Container(
                      height: 75,
                      width: 75,
                      child: Image.network(
                        widget.info["images"].isEmpty
                            ? "https://i2.wp.com/www.agoda.com/wp-content/uploads/2021/01/EXPO-Park-daejeon-itinerary-south-korea.jpg?ssl=1"
                            : widget.info["images"][0]["image"],
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                  // 해당 상품 정보
                  Flexible(
                    flex: 5,
                    child: Container(
                      width: 270,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 상품 이름
                          Text(
                            widget.info["name"],
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: kTextColor),
                          ),
                          SizedBox(height: 5),
                          // 판매 위치
                          Text(
                            (widget.info["user"] == null)
                                ? "地址"
                                : (widget.info["user"]["location"] ?? "地址"),
                            textScaleFactor: 0.9,
                            style: TextStyle(color: kTextLightColor),
                          ),
                          SizedBox(height: 5),
                          // 상품 가격
                          Text(
                            numFormatter.format(2020.20),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: kTextColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            onTap: () {
              Get.to(() => ProductDetailScreen());
            },
          ),
        ),
      ],
    );
  }
}
