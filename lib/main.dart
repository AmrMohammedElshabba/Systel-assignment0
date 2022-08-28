import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:get/get.dart';
import 'app/core/app.dart';
import 'app/core/theme/theme_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await App.init();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final keyApplicationId = 'com.voyce';
  final keyParseServerUrl = 'https://test.voycephone.com/parse/';

  await Parse().initialize(keyApplicationId, keyParseServerUrl);



  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        theme: AppThemeManager.lightTheme),
  );
}
