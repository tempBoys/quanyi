import 'package:get/get.dart';
import 'package:localstorage/localstorage.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:quanyi/ChatsScreen/models/ChatMessage.dart';
import 'package:quanyi/models/utils/api_helper.dart';

class MessageController extends GetxController {
  // 보낼 이미지 리스트
  RxList<Asset> images = <Asset>[].obs;
  // // 입력한 텍스트
  // String messageText = '';

  // // 텍스트 업데이트
  // void updateText({required String text}) {
  //   messageText = text;
  // }

  // 메시지를 보낸다
  void sendMessage({
    required int sender,
    required int receriver,
    required int productId,
    required String message,
  }) async {
    try {
      await apiHelper.postChat(
          sender: sender,
          receriver: receriver,
          productId: productId,
          message: message);
    } catch (e) {
      Get.snackbar("传送失败", "请检查一下网络状态");
    }
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

class ChatController extends GetxController {
  // 메시지를 받는 유저의 정보
  var user = null;
  // 사려고 하는 상품의 정보
  var product = null;
  // 채팅 내용을 저장하는 스토리지
  var chatStorage = null;
  // 채팅 내용
  RxList<ChatMessage> storedChat = <ChatMessage>[].obs;

  void loadData({
    required int receiverId,
    required int productId,
  }) async {
    user = await apiHelper.getUser(id: receiverId);
    product = await apiHelper.getProduct(id: productId);
    chatStorage = LocalStorage("user${receiverId}product$productId");
  }

  // 보낸 텍스트를 저장한다
  void storeChat({required message}) {
    storedChat =
        chatStorage.getItem("user${user["id"]}product${product["id"]}");
    storedChat.add(ChatMessage(
      text: message,
      messageType: ChatMessageType.text,
      isSender: true,
    ));
    chatStorage.setItem("user${user["id"]}product${product["id"]}", storedChat);
  }

  @override
  void onInit() {
    // 기존에 저장된 채팅 내용을 불러온다
    storedChat =
        chatStorage.getItem("user${user["id"]}product${product["id"]}") ?? [];
    super.onInit();
  }
}
