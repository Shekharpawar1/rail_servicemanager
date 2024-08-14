import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:serviceman/app/modules/SETOffline/views/setDetails.dart';

import '../../../../utils/Constant.dart';
class SETOfflineController extends GetxController {
  //TODO: Implement SETOfflineController
TextEditingController searchController=TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }
  RxBool isLoading=false.obs;
  var selectedValue1 = "".obs;
  RxString setsname= ''.obs;
var selectedValue = 0.obs;
  void selectValue(String value) {
    selectedValue1.value = value;
    print("rules================================${selectedValue1.value}");
  }

  // Future<void> getsets(int indexed) async{
  //   print("rules");
  //    try{
  //     // isLoading.value=true;
  //     final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.set}'));
  //     if(response.statusCode==200){
  //       print("responseCode=========================>${response.statusCode}");
  //       var data=json.decode(response.body);
  //       selectedValue1.value=data['data'][indexed]['file'];
  //       setsname.value=data['data'][indexed]['set_no'];
  //       isLoading.value=true;
  //       Get.to(SetDetailss(image: data['data'][indexed]['file'], name: data['data'][indexed]['set_no'],));
  //       update();
  //       print("data==============================$data");
  //       print("sets==============================${selectedValue1.value}");
  //       print("sets==============================${setsname.value}");
  //     }else{
  //       print("Failed to load a sets");
  //     }
  //   }catch(e){
  //     print("Error in fatching sets${e}");
  //     Get.snackbar(
  //       "Alert",  // Title
  //       "Please Enter Correct Set No.!",  // Message
  //       snackPosition: SnackPosition.BOTTOM,  // Position of snackbar
  //       backgroundColor: Constants.pimaryColor,  // Background color
  //       colorText: Colors.white,  // Text color
  //       duration: Duration(seconds: 3),  // Duration the snackbar will be visible
  //     );
  //   }finally{
  //     isLoading.value=false;
  //   }
  // }

Future<void> getsets(String setNumber) async {
  print("rules");
  try {
    final response = await http.get(Uri.parse('${Constants.Base_URL}${Constants.set}'));
    if (response.statusCode == 200) {
      print("responseCode=========================>${response.statusCode}");
      var data = json.decode(response.body);

      // Search for the set using the provided set number
      var setData = data['data'].firstWhere(
            (set) => set['set_no'] == setNumber,
        orElse: () => null,
      );

      if (setData != null) {
        selectedValue1.value = setData['file'];
        setsname.value = setData['set_no'];
        isLoading.value = true;
        Get.to(SetDetailss(image: setData['file'], name: setData['set_no']));
        update();
        print("data==============================$setData");
        print("sets==============================${selectedValue1.value}");
        print("sets==============================${setsname.value}");
      } else {
        print("Set not found");
        Get.snackbar(
          "Alert",
          "Set number not found!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Constants.pimaryColor,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } else {
      print("Failed to load sets");
    }
  } catch (e) {
    print("Error in fetching sets${e}");
    Get.snackbar(
      "Alert",
      "Please Enter Correct Set No.!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Constants.pimaryColor,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
    );
  } finally {
    isLoading.value = false;
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
