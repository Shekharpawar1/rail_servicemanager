
import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:serviceman/utils/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;

class SignInController extends GetxController {
  //TODO: Implement SignInController
  final phoneController = TextEditingController();
  final otpController = TextEditingController();
  final isVisible = false.obs;
  final isOtpSent = false.obs;
  final canResendOtp = false.obs;
  final timer = 60.obs;
  String? verificationId;
  final FirebaseAuth auth = FirebaseAuth.instance;
  ConfirmationResult? confirmationResult;
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
  Future<void> sendOtp(String phoneNumber) async {
    print("phone uber${phoneNumber}");
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
        verificationCompleted: (PhoneAuthCredential credential) async {
          // Auto-sign in the user on completion
         await auth.signInWithCredential(credential);
          // User? user = auth.currentUser;


          Get.snackbar('Success', 'Successfully signed in');
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar('Error', 'Failed to send OTP. Please try again.');
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          isVisible.value = true;
          startTimer();
          Get.snackbar('OTP Sent', 'An OTP has been sent to your phone.');
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          this.verificationId = verificationId;
          Get.snackbar('OTP Timeout', 'OTP has timed out. Please request a new one.');
        },
      );
    } catch (e) {
      print("Failed to send OTP: $e");
      Get.snackbar('Error', 'Failed to send OTP. Please try again.');
    }
  }

  Future<void> verifyOtp(String otp) async {
    if (verificationId != null) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId!, smsCode: otp);
      var user=  await auth.signInWithCredential(credential);
        print("userUid=====================================${user.user}");
        print("userUid=====================================${user.user!.uid}");
        Register();
        Get.snackbar('Success', 'Successfully signed in');
      } catch (e) {
        print("Failed to verify OTP: $e");
        Get.snackbar('Error', 'Invalid OTP. Please try again.');
      }
    }
  }

  Future<void> resendOtp() async {
    if (phoneController.text.isNotEmpty && validation(phoneController.text.trim())) {
      await sendOtp(phoneController.text.trim());
      startTimer();
    }
  }
RxBool isLoading=false.obs;

  Future<void>Register()async {
    isLoading.value=true;
    try{
      var body={
        'phone': phoneController.text.trim(),
      };
      print("statusCodestatusCode ${phoneController.text.trim()}");
      // final res=await http.post(Uri.parse('${Constants.Base_URL}${Constants.login}'),body: body);
      final res=await http.post(Uri.parse("https://service-manager.digiatto.online/Api/userregister"),body: body);
      print("statusCodestatusCode ${res.statusCode}");
      if(res.statusCode==200){
        final responseData=json.decode(res.body);
        final userDetails = responseData['data'];
        final userId = userDetails['c_id'];
        final name = userDetails['c_name'];
        final railway = userDetails['railway'];
        final depo = userDetails['depo'];
        final role = userDetails['role'];
        final division = userDetails['division'];
        final phone=userDetails['c_mobile'];
        final pfNo=userDetails['pf_no'];
        final basicPay=userDetails['basic_pay'];

        print("statusCodestatusCode ${responseData}");
        SharedPreferences prefs = await SharedPreferences.getInstance();
        if(responseData['message']=='Login successful'){
          await prefs.setString('UserDetail', json.encode(userDetails));
          await prefs.setString('UserId', userId.toString());
          await prefs.setString('UserName',name);
          await prefs.setString("phone",phone);
          await prefs.setString("railway",railway);
          await prefs.setString("depo",depo);
          await prefs.setString("role",role);
          await prefs.setString("division",division);
          await prefs.setString("pfNo",pfNo);
          await prefs.setString("basicPay",basicPay);
          var userdetial=  await prefs.get('UserDetail');
          print("Divy=====================>user${userdetial}");
          var userdetial1=  await prefs.get('UserId');
          print("Divy=====================>user1${userdetial1}");
          var userdetial2=  await prefs.get('UserName');
          print("Divy=====================>user1${userdetial2}");
          // Get.offAllNamed(Routes.HOME);
          Get.offAllNamed(Routes.HOME,arguments:userDetails['c_name']);
          print("responsedata ${responseData}");
          print("responsedata ${responseData['data']}");
        }else{
          await prefs.setString("phone",phone);
          print("responsedata ${responseData}");
          print("responsedata ${responseData['data']}");
          Get.offAllNamed(Routes.CREATE_ACCOUNT,arguments: 'Create Account');
        }
      }else{
        print("Failed to load ");
      }
    }catch(e){
      print("Error in fatching Data${e}");
    }
  }
  
  
  final count = 0.obs;
  var otp = ''.obs;
  // var timer = 60.obs;
  // late Timer _timer;

  @override
  void onInit() {
    super.onInit();
  }

  void startTimer() {
    canResendOtp.value = false;
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (timer.value > 0) {
        timer.value--;
      } else {
        canResendOtp.value = true;
        t.cancel();
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
