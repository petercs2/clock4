import 'package:get/get.dart';

import 'dial_start_logic.dart';

class DialStartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DialStartLogic());
  }
}
