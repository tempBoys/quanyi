import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class ChatController extends GetxController {
  // 보낼 이미지 리스트
  RxList<Asset> images = <Asset>[].obs;
  // 입력한 텍스트
  String text = '';

  // 텍스트 업데이트
  void updateText({required String text}) {
    text = text;
  }

  // 사진을 고른 후 이미지 리스트에다가 삽입한다
  Future<void> loadImages() async {
    List<Asset> resultList = <Asset>[];
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 9,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
      );
    } on Exception catch (e) {
      print(e);
    }
    images.value = resultList;
  }
}
