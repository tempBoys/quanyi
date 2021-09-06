import 'package:get/get.dart';
import 'package:quanyi/router/dashboard.dart';

class AppScreens {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardScreen(),
    ),
  ];
}

class AppRoutes {
  static const String DASHBOARD = '/';
}
