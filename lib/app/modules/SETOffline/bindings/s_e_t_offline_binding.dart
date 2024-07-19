import 'package:get/get.dart';

import '../controllers/s_e_t_offline_controller.dart';

class SETOfflineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SETOfflineController>(
      () => SETOfflineController(),
    );
  }
}
