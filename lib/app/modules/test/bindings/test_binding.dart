import 'package:get/get.dart';
import 'package:serviceman/app/modules/test/controllers/test_controller.dart';


class TestBinding extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<SplashController>(
    //   () => SplashController(),
    Get.put(TestController());
  }
}
