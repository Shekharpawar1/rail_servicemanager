import 'package:get/get.dart';

import '../controllers/rules_and_updates_controller.dart';

class RulesAndUpdatesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RulesAndUpdatesController>(
      () => RulesAndUpdatesController(),
    );
  }
}
