import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavStorage extends GetxController {
  late SharedPreferences _prefs;

  void add({required id}) async {
    List<String> tempFav = _prefs.getStringList("favorite") ?? [];
    tempFav.add("$id");
    _prefs.setStringList('favorite', tempFav);
    print(_prefs.getStringList("favorite"));
  }

  void delete({required id}) async {
    List<String> tempFav = _prefs.getStringList("favorite") ?? [];
    final idIndex = tempFav.indexOf("$id");
    tempFav.removeAt(idIndex);
    _prefs.setStringList('favorite', tempFav);
    print(_prefs.getStringList("favorite"));
  }

  List<int> load() {
    List<String> tempFavs = _prefs.getStringList("favorite") ?? [];
    return tempFavs.map(int.parse).toList();
  }

  void clear() async {
    _prefs.clear();
  }

  @override
  void onInit() async {
    // SharedPreferences의 인스턴스를 필드에 저장
    _prefs = await SharedPreferences.getInstance();
    super.onInit();
  }
}
