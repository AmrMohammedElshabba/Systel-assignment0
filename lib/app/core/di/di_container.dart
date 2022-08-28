import 'package:assigment/app/core/storage/app_storage.dart';
import 'package:assigment/app/modules/auth/infrastructure/auth_remote_service.dart';
import 'package:assigment/app/modules/auth/infrastructure/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import '../../modules/main/infrastructure/main_repository.dart';
import '../storage/auth_local_manager.dart';

class DiContainer {
  static void init() {
    Get
      ..put(
        GetStorage(),
        permanent: true,
      )
      ..put(AppStorage(Get.find<GetStorage>())
        ..storeSlaveUser()
        ..storeWalletAndActivity())
      ..put(AuthLocalManager(Get.find<GetStorage>()))
      ..put(AuthRemoteService())
      ..put(AuthRepository(
          Get.find<AuthRemoteService>(), Get.find<AuthLocalManager>()))
      ..put(
          MainRepository(Get.find<AppStorage>(), Get.find<AuthLocalManager>()));
  }
}
