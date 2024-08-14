import 'package:get/get.dart';

import '../controllers/forms_controller.dart';

class FormsBinding extends Bindings {
  @override
  void dependencies() {
   Get.put(FormsController());
  }
}
