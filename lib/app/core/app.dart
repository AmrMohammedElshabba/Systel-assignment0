import 'package:get_storage/get_storage.dart';

import 'di/di_container.dart';

class App {
  static init() async {
    await GetStorage.init();
    DiContainer.init();
  }
}
