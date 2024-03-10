import 'package:fabcurate/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'utils/base_color.dart';
import 'utils/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return GetMaterialApp(
          title: 'Fabcurate',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: BaseColor.white,
            bottomSheetTheme: const BottomSheetThemeData(
              backgroundColor: BaseColor.white,
              elevation: 0,
              modalBackgroundColor: BaseColor.white,
            ),
            brightness: Brightness.light,
            fontFamily: BaseStrings.inter,
            primaryColor: BaseColor.appColor,
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
            tabBarTheme: const TabBarTheme(
              indicatorColor: BaseColor.appColor,
              labelColor: BaseColor.appColor,
            ),
            colorScheme: ColorScheme.fromSeed(
              seedColor: BaseColor.appColor,
            ),
            useMaterial3: true,
          ),
          themeMode: ThemeMode.light,
          initialRoute: AppPages.initialRoute,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
