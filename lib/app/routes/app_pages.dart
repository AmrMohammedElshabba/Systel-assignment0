import 'package:get/get.dart';
import 'package:assigment/app/modules/main/bindings/main_binding.dart';
import 'package:assigment/app/modules/main/views/main_view.dart';

import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Auth;

  static final routes = [
    GetPage(
      name: _Paths.Auth,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
  ];
}
