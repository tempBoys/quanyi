import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/components/product_detail_appbar.dart';
import 'package:quanyi/ProductDetailScreen/components/product_detail_bottombar.dart';
import 'package:quanyi/ProductDetailScreen/components/user_info.dart';
import 'package:quanyi/ProductDetailScreen/components/product_detail_product_basic_info.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_detail_scroll_controller.dart';
import 'package:quanyi/widgets/kdivider.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({Key? key}) : super(key: key);

  final scrollController = Get.put(
      ProductDetailScreenScrollController()); // 상품 상세 스크린의 스크롤 컨트롤러 (앱바나 바텀바에서의 에니메이션 처리를 위한 것)

  @override
  Widget build(BuildContext context) {
    final productData = Get.arguments;
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
          controller: scrollController.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              // 상품 이미지와 애니메이션 효과가 있는 앱바 (스크롤하면서 서서히 생긴다)
              ProductDetailScreenAppBar(
                images: productData["images"],
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              children: [
                KDivider(height: 1),
                // 상품의 이름, 게시 날짜, 게시 내용을 보여준다
                Padding(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
                    child: ProductBasicInfo(
                      name: productData["name"],
                      content: productData["content"],
                      createdAt: productData["created_at"],
                      status: productData["status"],
                    )),
                KDivider(height: 20),
                // 배송 정보를 보여준다
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 21.5),
                  child: UserInfo(
                    userName: productData["user"]["user_name"],
                  ),
                ),

                KDivider(height: 10, thickness: 6.5),
              ],
            ),
          ),
        ),

        // 찜 버튼과 구매하기 버튼이 있는 바텀바
        bottomNavigationBar: ProductDetailScreenBottomBar(
          productId: productData["id"],
          productName: productData["name"],
          productImage: productData["images"][0]["image"] ?? "",
          userData: productData["user"],
          price: productData["price"],
          negotiable: productData["negotiable"],
          view: productData["view"],
        ));
  }
}
