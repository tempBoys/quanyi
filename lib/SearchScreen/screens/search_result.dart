import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/product_detail.dart';
import 'package:quanyi/SearchScreen/controllers/search_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/api_helper.dart';
import 'package:quanyi/models/utils/number_formatter.dart';
import 'package:quanyi/widgets/kdivider.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class SearchResult extends StatelessWidget {
  SearchResult({Key? key, required this.searchText}) : super(key: key);
  final controller = Get.put(SearchController());
  final String searchText;
  @override
  Widget build(BuildContext context) {
    controller.fetchSearchProducts(this.searchText);
    return Scaffold(
        appBar: NormalAppbar(
          isTitleText: false,
          centerTitle: false,
          title: Text(
            controller.searchText.value,
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: kBackGroundColor,
        body: Obx(
          () => controller.isLoading.value == false
              ? ListView.separated(
                  itemBuilder: (BuildContext ctx, int index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 20),
                        child: searchView(index));
                  },
                  separatorBuilder: (BuildContext ctx, int index) {
                    return KDivider(height: 10);
                  },
                  itemCount: controller.searchProducts.length)
              : Center(child: CircularProgressIndicator()),
        ));
  }

  Widget searchView(int index) => GestureDetector(
        child: Container(
          height: 120,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 2,
                // 해당 상품 이미지
                child: Container(
                  height: 75,
                  width: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.transparent,
                  ),
                  child: Image.network(
                    controller.searchProducts[index].images[0]["image"] ??
                        "https://www.figma.com/file/WlmsKmghOWd5bPFZWaAADi/BLY?node-id=202%3A926",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // 해당 상품 정보
              Flexible(
                flex: 5,
                child: Container(
                  width: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 상품 이름
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              controller.searchProducts[index].name,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(color: kTextColor),
                            ),
                          ),
                          SizedBox(width: 5),
                          Container(
                            height: 18,
                            width: 65,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(6)),
                            child: Text(
                              controller.searchProducts[index].status == "sell"
                                  ? "出售中"
                                  : "出售完",
                              textScaleFactor: 0.7,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: kTextColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 5),
                      // 유저의 주소 | 게시 날짜
                      Text(
                        "${controller.searchProducts[index].user.location} | ${controller.searchProducts[index].createdAt}",
                        textScaleFactor: 0.9,
                        style: TextStyle(color: kTextLightColor),
                      ),
                      SizedBox(height: 5),
                      // 상품 가격
                      Text(
                        "${numFormatter.format(controller.searchProducts[index].price)} 元 | ${controller.searchProducts[index].negotiable == false ? "不可协商" : "可协商"}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: kTextColor, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 2.5),
                      // 상품을 구경한 횟수
                      Container(
                        width: double.infinity,
                        child: Text(
                          "已经有 ${controller.searchProducts[index].view} 个人看过",
                          textScaleFactor: 0.9,
                          textAlign: TextAlign.right,
                          style: TextStyle(color: kTextLightColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        onTap: () async {
          final productData = await apiHelper.getProduct(
              id: controller.searchProducts[index].id);
          Get.to(() => ProductDetailScreen(), arguments: productData);
        },
      );
}
