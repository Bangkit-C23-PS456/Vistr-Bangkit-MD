import 'package:get/get.dart';

import '../controllers/detail_itenarary_controller.dart';

class DetailItenararyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailItenararyController>(
      () => DetailItenararyController(),
    );
  }
}
