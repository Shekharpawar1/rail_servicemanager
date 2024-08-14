import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:serviceman/app/modules/RulesAndUpdates/views/Rulestypes.dart';
import 'package:serviceman/app/modules/RulesAndUpdates/views/rulestypeDetails.dart';

import '../../../../utils/Constant.dart';

class RulesAndUpdatesController extends GetxController {
  //TODO: Implement RulesAndUpdatesController

  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchbyidController = TextEditingController();
  final count = 0.obs;


  RxBool isLoading=false.obs;
  var selectedValue1 = "".obs;
  RxList rules= [].obs;
  RxList filteredrules = [].obs;
  void selectValue1(String value) {
    selectedValue1.value = value;
    print("rules================================${selectedValue1.value}");
  }

  Future<void> getrules() async{
    print("rules");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.rule}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        rules.value.assignAll(data['data']);
        filteredrules.assignAll(rules);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("rules==============================${rules.value}");
      }else{
        print("Failed to load a rules");
      }
    }catch(e){
      print("Error in fatching rules${e}");
    }finally{
      isLoading.value=false;
    }
  }

  void filterrules(String query) {
    if (query.isEmpty) {
      filteredrules.assignAll(rules);
    } else {
      filteredrules.assignAll(rules.where((form) {
        return form['department'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }


  RxList rulesbyDep= [].obs;
  RxList filteredrulesbyDep = [].obs;
  Future<void> getrulesById(String Id) async{
    print("rules");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.ruledep}/$Id'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        print("data==============================$data");
        rulesbyDep.value.assignAll(data['data']);
        filteredrulesbyDep.assignAll(rulesbyDep);
        isLoading.value=true;
        Get.to(RulesType());
        update();
        print("data==============================$data");
        print("rulesbyDep==============================${rulesbyDep.value}");
        print("rulesbyDep==============================${filteredrulesbyDep.value}");
      }else{
        print("Failed to load a rulesbyDep");
      }
    }catch(e){
      print("Error in fatching rulesbyDep${e}");
    }finally{
      isLoading.value=false;
    }
  }

  void filterrulesbyDep(String query) {
    if (query.isEmpty) {
      filteredrulesbyDep.assignAll(rulesbyDep);
    } else {
      filteredrulesbyDep.assignAll(rulesbyDep.where((rulesbyDep) {
        return rulesbyDep['category'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  var selectedValue2 = "".obs;
  RxList rulesbyIdDetial= [].obs;
  void selectValue2(String value) {
    selectedValue2.value = value;
    print("rules================================${selectedValue2.value}");
  }

  Future<void> getRulesByIdDetial(String Id) async{
    print("rules");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.ruleform}/$Id'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        print("data==============================$data");
        rulesbyIdDetial.value.assignAll(data['data']);

        isLoading.value=true;
        Get.to(RulesTypeDetails());
        update();
        print("data==============================$data");
        print("rulesbyDep==============================${rulesbyDep.value}");
      }else{
        print("Failed to load a rulesbyIdDetial");
      }
    }catch(e){
      print("Error in fatching rulesbyIdDetial${e}");
    }finally{
      isLoading.value=false;
    }
  }
  @override
  void onInit() {
    super.onInit();
    getrules();
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
