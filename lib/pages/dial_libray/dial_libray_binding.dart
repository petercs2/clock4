import 'package:get/get.dart';

import 'dial_libray_logic.dart';

class DialLibrayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      DialLibrayLogic(),
      permanent: true,
    );
  }
}
