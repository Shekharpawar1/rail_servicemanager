import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/Constant.dart';

class FindRoasterSetController extends GetxController {
  //TODO: Implement FindRoasterSetController

  final count = 0.obs;


  final selectedDate = DateTime.now().obs;
  var selectedSetNo = ''.obs;
  void selectSetNo(String value) {
    selectedSetNo.value = value;
    print("Railway================================${selectedSetNo.value}");
  }
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      selectedDate.value = picked;
      addroster();
    }
  }

  final selectedDate1 = DateTime.now().obs;

  Future<void> selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate1.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      selectedDate1.value = picked;
    }
  }
  RxBool isLoading=false.obs;
  Future<void>addroster()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid=  await prefs.get('UserId');
    print("userrid--=================${userid}");
      isLoading.value=true;
      try{
        var body={
            'user_id':userid.toString(),
             'roster_no': selectedSetNo.value.toString(),
          'date':DateFormat('dd/MM/yy').format(selectedDate.value),
        };
        final res=await http.post(Uri.parse("${Constants.userroster}"),body: body);
        print("statusCodestatusCode ${res.statusCode}");
        if(res.statusCode==200){
          final responseData=json.decode(res.body);
          print("statusCodestatusCode ${responseData}");
          print("statusCodestatusCode ${res.body}");
          print("statusCodestatusCode ${body}");
          if(responseData['message']=='Add successful'){
            Get.snackbar(
              "Roster",
              "Roster added successfully.....",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Constants.pimaryColor,
              colorText: Colors.white,
              duration: Duration(seconds: 5),
            );
          }else{
            Get.snackbar(
              "Roster",
              "Roster not added successfully!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: Duration(seconds: 5),
            );
          }
        }else{
          print("Failed to load ");
        }
      }catch(e){
        print("Error in fatching Data${e}");
        print("Error in fatching Data1234567${e}");
      }finally{
        isLoading.value=false;
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
    super.onClose();
  }

  void increment() => count.value++;
}
