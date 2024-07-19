
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class SignInController extends GetxController {
  //TODO: Implement SignInController
  final phoneController=TextEditingController();
  RxBool isVisible=false.obs;

  bool validation(String phone) {
    if (phone.isEmpty || phone == null) {
      Get.dialog(
        AlertDialog(
          title: Text('Oops!'),
          content: Text(
              "Please enter a your phone number"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      Future.delayed(Duration(seconds: 3), () {
        if (Get.isDialogOpen!) {
          Get.back();
        }
      });
      return false;
    } else if (phone.length.toInt() != 10||!RegExp(r'^\d+$').hasMatch(phone)) {
      Get.dialog(
        AlertDialog(
          title: Text('Oops!'),
          content: Text(
              "Please enter a vaild phone number"),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      Future.delayed(Duration(seconds: 3), () {
        if (Get.isDialogOpen!) {
          Get.back();
        }
      });
      return false;
    }
    isVisible.value=true;
    return true;
  }




  final count = 0.obs;
  var otp = ''.obs;
  var timer = 60.obs;
  late Timer _timer;

  @override
  void onInit() {
    super.onInit();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (this.timer.value > 0) {
        this.timer.value--;
      } else {
        timer.cancel();
      }
    });
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
