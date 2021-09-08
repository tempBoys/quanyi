import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';

class PostController extends GetxController {
  // 삽입할 이미지 리스트
  RxList<Asset> images = <Asset>[].obs;
  // 입력한 제목
  String name = '';
  // 입력한 내용
  String content = '';
  // 입력한 가격
  double price = 0.0;
  // 협상 여부
  RxBool negotiable = false.obs;

  // 제목 업데이트
  void updateName({required String text}) {
    name = text;
  }

  // 내용 업데이트
  void updateContent({required String text}) {
    content = text;
  }

  // 가격 업데이트
  void updatePrice({required double text}) {
    price = text;
  }

  // 협상 여부 업데이트
  void updateNego() {
    negotiable.value = !negotiable.value;
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
