import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/SearchScreen/components/history_button.dart';
import 'package:quanyi/SearchScreen/controllers/search_history_controller.dart';
import 'package:quanyi/SearchScreen/screens/search_result.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final controller = Get.put(SearchHistoryController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 20,
          ),
        ),
        title: TextField(
          textInputAction: TextInputAction.search,
          onSubmitted: (value) {
            controller.searchText = value.obs;
            Get.off(() => SearchResult(searchText: value));
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search),
            hintText: 'Search ',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.highlight_remove_outlined,
              size: 20,
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
                '최근 검색어',
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
                  return HistoryButton(title: controller.historyList[index]);
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
