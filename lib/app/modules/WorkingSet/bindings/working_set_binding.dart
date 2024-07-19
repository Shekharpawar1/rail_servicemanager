import 'package:get/get.dart';

import '../controllers/working_set_controller.dart';

class WorkingSetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WorkingSetController>(
      () => WorkingSetController(),
    );
  }
}
