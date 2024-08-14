import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';


import 'audioPlayController.dart';

class AudioPlaybinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AudioPlayController());
    // TODO: implement dependencies
  }

}