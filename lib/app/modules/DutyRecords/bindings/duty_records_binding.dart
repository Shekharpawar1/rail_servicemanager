import 'package:get/get.dart';

import '../controllers/duty_records_controller.dart';

class DutyRecordsBinding extends Bindings {
  @override
  void dependencies() {
     Get.put(DutyRecordsController());
    // Get.lazyPut<DutyRecordsController>(() => DutyRecordsController());

  }
}
