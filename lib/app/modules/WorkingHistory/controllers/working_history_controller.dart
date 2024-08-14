import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/Constant.dart';
import '../../../routes/app_pages.dart';

class WorkingHistoryController extends GetxController {
  //TODO: Implement WorkingHistoryController

  final count = 0.obs;



  var setsList = [].obs;

RxBool isLoading=false.obs;

  Future<void> getsetbyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid=  await prefs.get('UserId');
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrosterset}/$userid'));
      if (response.statusCode == 200) {
        print("Data fetched: $response.statusCode");
        var data=json.decode(response.body);

        print("Data fetched: $data");
        setsList.assignAll(data['data']);
        print("Data fetched: ${setsList.value}.statusCode");
      } else {
        print("Failed to load sets, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching sets: $e");
      Get.snackbar(
        "Alert",
        "Failed to load data!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }

  RxList setDetials=[].obs;
  Future<void> getSetDetails(String id,int indexed) async {
    setDetials.value.clear();
    print("Fetching sets...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrostertrain}/${id}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Response Code: ${data}");
        print("Response Coefrhttyjyujfghyjyukyergtrhjyhgrde: ${setsList.value[indexed]}");
        setDetials.value=data['data'];
        Get.toNamed(Routes.WORKING_SET, arguments: {
          'filteredDataList': setDetials.value,
          'setData':setsList.value[indexed]
        });
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
    getsetbyId();
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
