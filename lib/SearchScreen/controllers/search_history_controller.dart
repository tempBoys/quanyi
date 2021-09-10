import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:quanyi/SearchScreen/models/search_products.dart';

class SearchHistoryController extends GetxController {
  final LocalStorage storage = new LocalStorage('search_history');
  RxList historyList = RxList<String>();
  RxString searchText = ''.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    getHistory();
    print(historyList);
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    print('close');
    updateHistory();
    super.onClose();
  }

  void updateHistory() {
    if (historyList.contains(searchText.value)) {
      historyList.remove(searchText.value);
      historyList.add(searchText.value);
    } else if (searchText.value != '') historyList.add(searchText.value);

    storage.setItem('history', historyList);
    print(historyList);
  }

  void getHistory() {
    if (storage.getItem('history') != null)
      historyList.assignAll(storage.getItem('history'));
  }
}
