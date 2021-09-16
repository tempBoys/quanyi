import 'package:get/get.dart';
import 'package:quanyi/LoginScreen/screens/sign_in_loading_screen.dart';
import 'package:quanyi/LoginScreen/screens/sign_in_screen.dart';
import 'package:quanyi/LoginScreen/screens/sign_up_screen.dart';
import 'package:quanyi/LoginScreen/screens/sign_up_success_screen.dart';
import 'package:quanyi/router/dashboard.dart';

class AppScreens {
  static var list = [
    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardScreen(),
    ),
    GetPage(
      name: "${AppRoutes.DASHBOARD}SignInLoading",
      page: () => SignInLoadingScreen(),
    ),
    GetPage(
      name: "${AppRoutes.DASHBOARD}SignIn",
      page: () => SignInScreen(),
    ),
    GetPage(
      name: "${AppRoutes.DASHBOARD}SignUp",
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: "${AppRoutes.DASHBOARD}SignUpSuccess",
      page: () => SignUpSuccessScreen(),
    ),
  ];
}

class AppRoutes {
  static const String DASHBOARD = '/';
}
