import 'package:get/get.dart';

class OfflineWTTController extends GetxController {
  //TODO: Implement OfflineWTTController
  List<String>wtttype=[
    "Main Line",
    "South East Line",
    "North East Line",
    "Harbour Line",
    "Trans Harbour",
    "DMU-Memu"
  ];

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
