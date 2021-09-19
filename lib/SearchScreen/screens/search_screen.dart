import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/SearchScreen/components/history_button.dart';
import 'package:quanyi/SearchScreen/controllers/search_history_controller.dart';
import 'package:quanyi/SearchScreen/screens/search_result.dart';
import 'package:quanyi/widgets/normal_appbar.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final controller = Get.put(SearchHistoryController());
  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: NormalAppbar(
        isTitleText: false,
        title: TextField(
          controller: _controller,
          textInputAction: TextInputAction.search,
          autofocus: true,
          onSubmitted: (value) {
            controller.searchText = value.obs;
            Get.off(() => SearchResult(searchText: value));
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            hintText: '搜索您所需要的商品',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _controller.clear(),
            icon: Icon(
              Icons.clear_outlined,
              size: 20,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              child: Text(
                '最近搜索词',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            Container(
              height: 200,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemCount: controller.historyList.length,
                itemBuilder: (_, index) {
                  return HistoryButton(
                      title: controller.historyList[
                          controller.historyList.length - 1 - index]);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
