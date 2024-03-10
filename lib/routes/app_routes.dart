import 'package:get/get.dart';

import '../screen/main_screen.dart';
import '../splash_screen.dart';

class AppRoute {
  static const String splashScreen = '/splash_screen';
  static const String mainScreen = '/main_screen';
}

class AppPages {
  static const initialRoute = AppRoute.splashScreen;

  static final routes = [
    GetPage(
      name: AppRoute.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: AppRoute.mainScreen,
      page: () => const MainScreen(),
    ),
  ];
}
