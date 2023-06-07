import 'package:get/get.dart';

import '../controllers/pref_controller.dart';

class PrefBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PrefController>(
      () => PrefController(),
    );
  }
}
