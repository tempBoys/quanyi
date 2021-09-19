import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';

class SearchHistoryController extends GetxController {
  final LocalStorage storage = new LocalStorage('search_history');
  RxList historyList = RxList<String>();
  RxString searchText = ''.obs;
  @override
  void onInit() {
    getHistory();
    super.onInit();
  }

  @override
  void onClose() {
    updateHistory();
    super.onClose();
  }

  void updateHistory() {
    if (historyList.contains(searchText.value)) {
      // 이미 기록이 있을 경우
      historyList.remove(searchText.value);
      historyList.add(searchText.value);
    } else if (searchText.value != '') {
      // 기록이 없을 경우
      historyList.add(searchText.value);
    }
    storage.setItem('history', historyList);
  }

  void getHistory() {
    if (storage.getItem('history') != null)
      historyList.assignAll(storage.getItem('history'));
  }
}
