import 'package:get/get.dart';

import '../controllers/pick_city_controller.dart';

class PickCityBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PickCityController>(
      () => PickCityController(),
    );
  }
}
