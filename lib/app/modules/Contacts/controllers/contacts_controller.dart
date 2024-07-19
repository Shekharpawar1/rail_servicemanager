import 'package:get/get.dart';

class ContactsController extends GetxController {
  //TODO: Implement ContactsController



  RxBool isExpanded = false.obs;
  RxBool isFavirate=false.obs;
  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }
  void toggleFavirate() {
    isFavirate.value = !isFavirate.value;
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
