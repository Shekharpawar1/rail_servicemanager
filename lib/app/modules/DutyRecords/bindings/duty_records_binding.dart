import 'package:get/get.dart';

import '../controllers/duty_records_controller.dart';

class DutyRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DutyRecordsController>(
      () => DutyRecordsController(),
    );
  }
}
