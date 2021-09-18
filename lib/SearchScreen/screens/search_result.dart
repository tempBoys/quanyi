import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/product_detail.dart';
import 'package:quanyi/SearchScreen/controllers/search_controller.dart';
import 'package:quanyi/SearchScreen/models/search_products.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/utils/number_formatter.dart';
import 'package:quanyi/widgets/kdivider.dart';

class SearchResult extends StatelessWidget {
  SearchResult({Key? key, required this.searchText}) : super(key: key);
  final controller = Get.put(SearchController());
  final String searchText;
  @override
  Widget build(BuildContext context) {
    controller.fetchSearchProducts(this.searchText);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            ),
          ),
          title: Text(
            controller.searchText.value,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Obx(
          () => controller.isLoading.value == false
              ? ListView.separated(
                  itemBuilder: (BuildContext ctx, int index) {
                    return Padding(
                        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
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
          height: 100,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                // 해당 상품 이미지
                child: controller.searchProducts[index].images.isNotEmpty
                    ? ClipRRect(
                        child: Swiper(
                          itemBuilder: (context, i) => Image.network(
                              controller.searchProducts[index].images[i]),
                          itemCount:
                              controller.searchProducts[index].images.length,
                          autoplay: true,
                          autoplayDelay: 3000,
                        ),
                        borderRadius: BorderRadius.circular(4))
                    : Container(
                        height: 75,
                        width: 75,
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
                        controller.searchProducts[index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: kTextColor),
                      ),
                      SizedBox(height: 5),
                      // 판매 위치
                      Text(
                        noData, //"地址",
                        textScaleFactor: 0.9,
                        style: TextStyle(color: kTextLightColor),
                      ),
                      SizedBox(height: 5),
                      // 상품 가격
                      Text(
                        numFormatter
                            .format(controller.searchProducts[index].price),
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
      );
}
