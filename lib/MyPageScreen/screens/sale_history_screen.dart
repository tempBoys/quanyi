import 'package:flutter/material.dart';
import 'package:quanyi/MyPageScreen/components/on_sale_product.dart';
import 'package:quanyi/widgets/kdivider.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class SalesHistoryScreen extends StatelessWidget {
  const SalesHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NormalAppbar(
        title: "销售明细",
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext ctx, int index) {
            return Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: OnSaleProduct(id: index));
          },
          separatorBuilder: (BuildContext ctx, int index) {
            return KDivider(height: 10);
          },
          itemCount: 10),
    );
  }
}
