import 'package:get/get.dart';

import '../controllers/find_roaster_set_controller.dart';

class FindRoasterSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindRoasterSetController>(
      () => FindRoasterSetController(),
    );
  }
}
