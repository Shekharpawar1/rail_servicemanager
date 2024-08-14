import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:serviceman/app/modules/Alert/controllers/alert_controller.dart';
import 'package:serviceman/app/modules/Audio/audioController.dart';

class Alertbinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NotificationController());
    // TODO: implement dependencies
  }

}