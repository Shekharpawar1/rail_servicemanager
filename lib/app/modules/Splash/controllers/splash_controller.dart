import 'dart:async';


import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController




  Future<Timer>loadData()async{
return Timer(Duration(seconds: 3), checkAutoLoginData);
  }
  final count = 0.obs;
  @override
  void onInit() {

    super.onInit();
    loadData();
  }

  Future<void> checkAutoLoginData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userData = prefs.getString('UserId');
    String? name = prefs.getString('UserName');
    // print('usecheckAutoLoginDatarData ----- $userData');
    if (userData != null && userData.isNotEmpty) {
      // Navigate to Dash screen
       Get.offAllNamed(Routes.HOME,arguments: name);
    } else {
      // Navigate to Login screen
      Get.offAndToNamed(Routes.SIGN_IN);
    }
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
