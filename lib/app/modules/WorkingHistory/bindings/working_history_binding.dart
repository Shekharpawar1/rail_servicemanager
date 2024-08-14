import 'package:get/get.dart';

import '../controllers/working_history_controller.dart';

class WorkingHistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(WorkingHistoryController());
  }
}
