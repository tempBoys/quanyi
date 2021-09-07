import 'package:flutter/material.dart';
import 'package:quanyi/HomeScreen/components/product_list.dart';
import 'package:quanyi/widgets/kdivider.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(
        title: "收藏",
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: ProductList(id: index));
          },
          separatorBuilder: (BuildContext ctx, int index) {
            return KDivider(height: 10);
          },
          itemCount: 10),
    );
  }
}
