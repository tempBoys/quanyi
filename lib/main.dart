import 'package:quanyi/models/constants.dart';
import 'package:quanyi/router/app_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:pushy_flutter/pushy_flutter.dart';

void backgroundNotificationListener(Map<String, dynamic> data) {
  // Print notification payload data
  print('Received notification: $data');

  // Notification title
  String notificationTitle = 'MyApp';

  // Attempt to extract the "message" property from the payload: {"message":"Hello World!"}
  String notificationText = data['message'] ?? 'Hello World!';

  // Android: Displays a system notification
  // iOS: Displays an alert dialog
  Pushy.notify(notificationTitle, notificationText, data);

  // Clear iOS app badge number
  Pushy.clearBadge();
}

void main() {
  runApp(QuanYi());
}

class QuanYi extends StatefulWidget {
  @override
  _QuanYiState createState() => _QuanYiState();
}

class _QuanYiState extends State<QuanYi> {
  Future pushyRegister() async {
    try {
      // Register the user for push notifications
      String deviceToken = await Pushy.register();

      // Print token to console/logcat
      print('Device token: $deviceToken');

      // Display an alert with the device token
      Get.dialog(Column(
        children: [
          Text('Pushy'),
          Text('Pushy device token: $deviceToken'),
          TextButton(child: Text('OK'), onPressed: () {})
        ],
      ));

      // Optionally send the token to your backend server via an HTTP GET request
      // ...
    } on PlatformException catch (error) {
      // Display an alert with the error message
      Get.dialog(Column(
        children: [
          Text('Error'),
          // Text(error.message!),
          TextButton(child: Text('OK'), onPressed: () {})
        ],
      ));
    }
  }

  @override
  void initState() {
    super.initState();
    // // // Start the Pushy service
    // Pushy.listen();
    // // // Listen for push notifications received
    // Pushy.setNotificationListener(backgroundNotificationListener);
    // pushyRegister();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        );
      },
      theme: ThemeData(
          fontFamily: "NotoSansSC", backgroundColor: kBackGroundColor),
      initialRoute: AppRoutes.DASHBOARD,
      getPages: AppScreens.list,
      debugShowCheckedModeBanner: true,
    );
  }
}
