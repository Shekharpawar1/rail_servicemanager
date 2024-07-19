import 'package:get/get.dart';

import '../controllers/calculators_controller.dart';

class CalculatorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatorsController>(
      () => CalculatorsController(),
    );
  }
}
