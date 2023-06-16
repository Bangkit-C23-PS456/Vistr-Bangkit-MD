import 'package:get/get.dart';

import '../controllers/category_place_controller.dart';

class CategoryPlaceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryPlaceController>(
      () => CategoryPlaceController(),
    );
  }
}
