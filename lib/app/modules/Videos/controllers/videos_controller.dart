import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/Constant.dart';

class VideosController extends GetxController {
  //TODO: Implement VideosController

  final count = 0.obs;


RxBool isLoading=false.obs;
RxList videos=[].obs;

  Future<void> getVideo() async{
    isLoading.value=true;
    print("videos");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.video}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        videos.value.assignAll(data['data']);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("videos==============================${videos.value}");
      }else{
        print("Failed to load a videos");
      }
    }catch(e){
      print("Error in fatching videos${e}");
    }finally{
      isLoading.value=false;
    }
  }
  @override
  void onInit() {
    super.onInit();
    getVideo();
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
