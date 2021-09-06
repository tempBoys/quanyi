import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';
import 'package:quanyi/ProductDetailScreen/components/widget_with_animation.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_controller.dart';
import 'package:quanyi/ProductDetailScreen/getxControllers/product_detail_scroll_controller.dart';
import 'package:quanyi/models/constants.dart';
import 'package:quanyi/models/size_config.dart';

class ProductDetailScreenAppBar extends StatelessWidget {
  ProductDetailScreenAppBar({Key? key}) : super(key: key);
  final appbarController = Get.put(ProductDetailScreenScrollController());
  // final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    // final productImagesData = productController.product.images;
    return Obx(() => SliverAppBar(
          iconTheme:
              IconThemeData(color: appbarController.iconColorTween.value.value),
          elevation: 0,
          backgroundColor: kAppBarColor
              .withAlpha((appbarController.scrollPosition.value).toInt()),
          title: WidgetWithAnimation(
              widget: "产品信息", textScaleFactor: kAppBarTextScaleFactor),
          actions: [
            WidgetWithAnimation(widget: Icons.search),
            WidgetWithAnimation(widget: Icons.shopping_cart_outlined),
            SizedBox(width: (kDefaultPadding / 2).w),
          ],
          // 앱바의 기본적인 설정들
          expandedHeight: 300.0,
          toolbarHeight: 45,
          centerTitle: true,
          floating: false,
          pinned: true,
          // 제품 사진들을 보여준다
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Swiper(
              loop: false,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                if (false) {
                  return GestureDetector(
                      child: Image.network(
                        // productImagesData[index]["image"],
                        "",
                        fit: BoxFit.cover,
                      ),
                      onTap: () {});
                } else {
                  return Container(
                    color: Colors.white,
                    child: Center(
                      child: Text("No images"),
                    ),
                  );
                }
              },
            ),
          ),
        ));
  }
}
