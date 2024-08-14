import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/Constant.dart';

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
  RxBool isLoading=false.obs;

  RxString wttname= ''.obs;


  Future<void> getwtt() async{
    print("wtt");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.offlinewtt}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        wttname.value=data['data'][0]['file'];
        isLoading.value=true;
        // /Get.to(SetDetailss(image: data['data'][indexed]['file'], name: data['data'][indexed]['set_no'],));
        update();
        print("data==============================$data");
        print("sets==============================${wttname.value}");
      }else{
        print("Failed to load a wtt");
      }
    }catch(e){
      print("Error in fatching wtt${e}");
    }finally{
      isLoading.value=false;
    }
  }
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getwtt();
    print("sets==============================${wttname.value}");
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
