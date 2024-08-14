import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:serviceman/app/modules/Audio/audioController.dart';

class Audiobinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AudioController());
    // TODO: implement dependencies
  }

}