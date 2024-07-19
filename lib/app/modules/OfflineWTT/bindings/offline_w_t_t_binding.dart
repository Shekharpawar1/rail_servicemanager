import 'package:get/get.dart';

import '../controllers/offline_w_t_t_controller.dart';

class OfflineWTTBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OfflineWTTController>(
      () => OfflineWTTController(),
    );
  }
}
