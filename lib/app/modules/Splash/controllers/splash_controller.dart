import 'dart:async';


import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController




  Future<Timer>loadData()async{
return Timer(Duration(seconds: 3), () {
  print("Iss loadess");
  Get.toNamed(Routes.SIGN_IN);
  print("Iss loadess");
});
  }
  final count = 0.obs;
  @override
  void onInit() {

    super.onInit();
    loadData();
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
