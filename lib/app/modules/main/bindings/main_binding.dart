import 'package:assigment/app/core/storage/app_storage.dart';
import 'package:assigment/app/modules/main/infrastructure/main_repository.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(Get.find<MainRepository>()),
    );
  }
}
