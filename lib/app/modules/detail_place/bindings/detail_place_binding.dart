import 'package:get/get.dart';

import '../controllers/detail_place_controller.dart';

class DetailPlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPlaceController>(
      () => DetailPlaceController(),
    );
  }
}
