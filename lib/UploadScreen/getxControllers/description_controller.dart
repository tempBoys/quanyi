import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

class DescriptionController extends GetxController {
  // 삽입할 이미지 리스트
  RxList<Asset> images = <Asset>[].obs;
  // 입력한 제목
  String title = '';
  // 입력한 설명
  String description = '';

  // 제목 업데이트
  void updateTitle({required String text}) {
    title = text;
  }

  // 설명 업데이트
  void updateDescription({required String text}) {
    description = text;
  }

  // 사진 추가하기 아이콘
  Widget addImageIcon = Container(
    height: 75,
    width: 75,
    decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(6)),
    child: Icon(Icons.camera_alt_outlined),
  );

  // 사진 선택 후 이미지 리스트 위젯을 생성한다
  Widget generateImages() {
    return Container(
      height: 75,
      width: (85 * images.length).toDouble(),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: images.length,
          itemBuilder: (BuildContext ctx, int index) {
            Asset asset = images[index];
            return Container(
              padding: const EdgeInsets.only(right: 10.0),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: AssetThumb(asset: asset, width: 75, height: 75),
            );
          }),
    );
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
