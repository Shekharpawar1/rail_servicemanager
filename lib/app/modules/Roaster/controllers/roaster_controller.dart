import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/Constant.dart';
import '../../../routes/app_pages.dart';

class RoasterController extends GetxController {
  //TODO: Implement RoasterController

  final count = 0.obs;
  TextEditingController searchCotroller=TextEditingController();


  RxBool isLoading=false.obs;
  var selectedValue1 = "".obs;
  RxList sets= [].obs;
  var selectedValue = 0.obs;
  void selectValue(String value) {
    selectedValue1.value = value;
    print("sets================================${selectedValue1.value}");
  }


  RxList setDetials=[].obs;

  // Future<void> getSets(String indexed) async {
  //   print("Fetching sets...");
  //   try {
  //     isLoading.value = true;
  //     final response = await http.get(Uri.parse('${Constants.rosterset}'));
  //
  //     if (response.statusCode == 200) {
  //       print("Response Code: ${response.statusCode}");
  //       var data = json.decode(response.body);
  //
  //       if (data['data'] is List) {
  //         List<dynamic> filteredDataList = data['data']
  //             .where((item) => item['set_no'] == indexed)
  //             .toList();
  //
  //         if (filteredDataList.isNotEmpty) {
  //           await getSetDetails(filteredDataList[0]['id'].toString());
  //          print("${filteredDataList[0]['id'].toString()}");
  //           Get.toNamed(Routes.FIND_ROASTER_SET, arguments: {
  //             'filteredDataList': filteredDataList,
  //             'setData':setDetials.value
  //           });
  //         } else {
  //           Get.snackbar(
  //             "Alert",
  //             "Please Enter Correct Set No.!",
  //             snackPosition: SnackPosition.BOTTOM,
  //             backgroundColor: Constants.pimaryColor,
  //             colorText: Colors.white,
  //             duration: Duration(seconds: 3),
  //           );
  //         }
  //       } else {
  //         print("Unexpected data format");
  //         Get.snackbar(
  //           "Error",
  //           "Unexpected data format!",
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Constants.pimaryColor,
  //           colorText: Colors.white,
  //           duration: Duration(seconds: 3),
  //         );
  //       }
  //     } else {
  //       print("Failed to load sets");
  //       Get.snackbar(
  //         "Error",
  //         "Failed to load sets!",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Constants.pimaryColor,
  //         colorText: Colors.white,
  //         duration: Duration(seconds: 3),
  //       );
  //     }
  //   } catch (e) {
  //     print("Error in fetching sets: $e");
  //     Get.snackbar(
  //       "Alert",
  //       "Please Enter Correct Set No.!",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Constants.pimaryColor,
  //       colorText: Colors.white,
  //       duration: Duration(seconds: 3),
  //     );
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  RxString updatedString=''.obs;
  Future<void> getSets(String indexed) async {
    print("Fetching sets...");
    updatedString.value='';
    Get.snackbar(
      "Please Wait!",
      "Finding....",
      snackPosition: SnackPosition.TOP,
      backgroundColor: Constants.pimaryColor,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.rosterset}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);

        // Check settings
        bool showMailSet = data['setting'][0]['mail-set'] == '0';
        bool showSubSet = data['setting'][0]['sub-set'] == '0';
        if (data['setting'][0]['mail-set'] == '0' && data['setting'][0]['sub-set'] == '0') {
          updatedString.value = '';
        } else {
          updatedString.value = 'Update';
        }

        if (data['data'] is List) {
          // Filter the list based on set_no and settings
          List<dynamic> filteredDataList = data['data']
              .where((item) {
            bool isMailSet = item['set_type'] == 'MAIL SET';
            bool isSubSet = item['set_type'] == 'SUB SET';

            // Filter out mail sets if showMailSet is false
            if (!showMailSet && isMailSet) return false;

            // Filter out sub sets if showSubSet is false
            if (!showSubSet && isSubSet) return false;

            // Filter based on set_no
            return item['set_no'] == indexed;
          })
              .toList();

          if (filteredDataList.isNotEmpty) {
            await getSetDetails(filteredDataList[0]['id'].toString());
            print("${filteredDataList[0]['id'].toString()}");

            Get.toNamed(Routes.FIND_ROASTER_SET, arguments: {
              'filteredDataList': filteredDataList,
              'setData': setDetials.value,
            });
          } else {
            Get.snackbar(
              "Alert",
              "Please Enter Correct Set No.!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Constants.pimaryColor,
              colorText: Colors.white,
              duration: Duration(seconds: 3),
            );
          }
        } else {
          print("Unexpected data format");
          Get.snackbar(
            "Error",
            "Unexpected data format!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Constants.pimaryColor,
            colorText: Colors.white,
            duration: Duration(seconds: 3),
          );
        }
      } else {
        print("Failed to load sets");
        Get.snackbar(
          "Error",
          "Failed to load sets!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Constants.pimaryColor,
          colorText: Colors.white,
          duration: Duration(seconds: 4),
        );
      }
    } catch (e) {
      print("Error in fetching sets: $e");
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

  Future<void> getSetDetails(String id) async {
    setDetials.value.clear();
    print("Fetching sets...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.rostertrain}/${id}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Response Code: ${data}");
        setDetials.value=data['data'];
        print("listData: ${setDetials.value}");
        }else {
        print("Failed to load sets Details");
      }
    } catch (e) {
      print("Error in fetching sets: $e");
    } finally {
      isLoading.value = false;
    }
  }
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
    searchCotroller.clear();
    super.onClose();
  }

  void increment() => count.value++;
}
