import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:serviceman/app/modules/Forms/views/FormTypeDetails.dart';

import '../../../../utils/Constant.dart';
import '../views/Formtype.dart';

class FormsController extends GetxController {
  //TODO: Implement FormsController
  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchbyidController = TextEditingController();
  final count = 0.obs;


  RxBool isLoading=false.obs;
  var selectedValue1 = "".obs;
  RxList forms= [].obs;
  RxList filteredforms = [].obs;
  void selectValue1(String value) {
    selectedValue1.value = value;
    print("contacts================================${selectedValue1.value}");
  }

  Future<void> getform() async{
    print("contacts");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.form}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        forms.value.assignAll(data['data']);
        filteredforms.assignAll(forms);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("forms==============================${forms.value}");
      }else{
        print("Failed to load a forms");
      }
    }catch(e){
      print("Error in fatching forms${e}");
    }finally{
      isLoading.value=false;
    }
  }

  void filterForms(String query) {
    if (query.isEmpty) {
      filteredforms.assignAll(forms);
    } else {
      filteredforms.assignAll(forms.where((form) {
        return form['department'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }


  var formsbyDep = <dynamic>[].obs;
  var filteredformsbyDep = <dynamic>[].obs;


  Future<void> getFormById(String id) async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.Base_URL}${Constants.formDep}/$id'));

      if (response.statusCode == 200) {
        var data=json.decode(response.body);
        print("Data fetched: $data");
        formsbyDep.assignAll(data['data']);
        filteredformsbyDep.assignAll(formsbyDep);
        Get.to(FormTypes());
      } else {
        print("Failed to load formsbyDep, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching formsbyDep: $e");
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

  void filterFormsbyDep(String query) {
    if (query.isEmpty) {
      filteredformsbyDep.assignAll(formsbyDep);
    } else {
      filteredformsbyDep.assignAll(formsbyDep.where((formsbyDep) {
        return formsbyDep['name'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  var selectedValue2 = "".obs;
  RxList formsbyIdDetial= [].obs;void selectValue2(String value) {
    selectedValue2.value = value;
    print("contacts================================${selectedValue2.value}");
  }

  Future<void> getFormByIdDetial(String Id) async{
    print("from");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.formform}/$Id'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        print("data==============================$data");
        formsbyIdDetial.value.assignAll(data['data']);

        isLoading.value=true;
        Get.to(FormTypeDetails());
        update();
        print("data==============================$data");
        print("formsbyDep==============================${formsbyDep.value}");
      }else{
        print("Failed to load a formsbyIdDetial");
      }
    }catch(e){
      print("Error in fatching formsbyIdDetial${e}");
    }finally{
      isLoading.value=false;
    }
  }
  @override
  void onInit() {
    super.onInit();
    getform();
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
