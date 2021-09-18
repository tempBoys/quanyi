import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quanyi/SearchScreen/controllers/search_history_controller.dart';
import 'package:quanyi/SearchScreen/screens/search_result.dart';

class HistoryButton extends StatelessWidget {
  HistoryButton({Key? key, required this.title}) : super(key: key);
  final String title;
  final controller = Get.put(SearchHistoryController());
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        fixedSize: Size.fromHeight(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        side: BorderSide(width: 0.5, color: Colors.grey),
      ),
      onPressed: () {
        controller.searchText = title.obs;
        Get.off(() => SearchResult(searchText: title));
      },
      child: Text(
        this.title,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
