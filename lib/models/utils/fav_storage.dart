import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavStorage extends GetxController {
  late SharedPreferences _prefs;

  void add({required id}) async {
    List<String> tempFav = _prefs.getStringList("favorite") ?? [];
    if (tempFav.contains("$id")) return;
    tempFav.add("$id");
    _prefs.setStringList('favorite', tempFav);
    print(_prefs.getStringList("favorite"));
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
