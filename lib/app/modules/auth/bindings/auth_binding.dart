import 'package:assigment/app/modules/auth/infrastructure/auth_remote_service.dart';
import 'package:assigment/app/modules/auth/infrastructure/auth_repository.dart';
import 'package:get/get.dart';

import '../../../core/storage/auth_local_manager.dart';
import '../controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(Get.find<AuthRepository>()),
    );
  }
}
