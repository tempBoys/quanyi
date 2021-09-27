import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:quanyi/models/utils/api_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatStorage extends GetxController {
  // 메시지를 받는 유저의 정보
  var user = null;
  // 사려고 하는 상품의 정보
  var product = null;
  // 채팅 내용
  // RxList<ChatMessage> storedChat = <ChatMessage>[].obs;
  late SharedPreferences _prefs;

  void loadData({
    required id,
    required int receiverId,
    required int productId,
  }) async {
    List<String> tempFav = _prefs.getStringList("favorite") ?? [];
    user = await apiHelper.getUser(id: receiverId);
    if (tempFav.contains("$id")) return;
    tempFav.add("$id");
    _prefs.setStringList('favorite', tempFav);
  }

  void delete({required id}) async {
    List<String> tempFav = _prefs.getStringList("favorite") ?? [];
    final idIndex = tempFav.indexOf("$id");
    tempFav.removeAt(idIndex);
    _prefs.setStringList('favorite', tempFav);
  }

  List<int> load() {
    List<String> tempFavs = _prefs.getStringList("favorite") ?? [];
    return tempFavs.map(int.parse).toList();
  }

  void clear() async {
    _prefs.clear();
  }

  bool contain({required id}) {
    List<String> tempFav = _prefs.getStringList("favorite") ?? [];
    if (tempFav == []) {
      return false;
    } else {
      return tempFav.contains("$id");
    }
  }

  @override
  void onInit() async {
    // SharedPreferences의 인스턴스를 필드에 저장
    _prefs = await SharedPreferences.getInstance();
    super.onInit();
  }
}
