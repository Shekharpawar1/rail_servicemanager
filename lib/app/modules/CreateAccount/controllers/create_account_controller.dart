import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:serviceman/app/modules/EditProfile/controllers/edit_profile_controller.dart';
import 'package:serviceman/utils/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

class CreateAccountController extends GetxController {
  //TODO: Implement CreateAccountController

  final count = 0.obs;

  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController basicPayController=TextEditingController();
  TextEditingController pfNoController=TextEditingController();
  RxString usergroupValue=" ".obs;
  RxList UserGroup= [].obs;
  void setDropValue(String value) {
    usergroupValue.value = value;
    update();
    print("UserGroup================================${usergroupValue.value}");
  }
RxBool isLoading=false.obs;
  Future<void> getRole() async{
    print("getRole");
    try{
      isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.role}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        UserGroup.value.assignAll(data['data']);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("dataroup==============================${UserGroup.value}");
      }else{
        print("Failed to load a role");
      }
    }catch(e){
      print("Error in fatching role${e}");
    }finally{
      isLoading.value=false;
    }
}


  var selectedValue = ''.obs;
  RxList railwayGroup= [].obs;
  void selectValue(String value) {
    selectedValue.value = value;
    print("Railway================================${selectedValue.value}");
  }


  Future<void> getRailawys() async{
    print("railwayGroup");
    try{
      isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.railway}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        railwayGroup.value.assignAll(data['data']);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("railwayGroup==============================${railwayGroup.value}");
      }else{
        print("Failed to load a railwayGroup");
      }
    }catch(e){
      print("Error in fatching railwayGroup${e}");
    }finally{
      isLoading.value=false;
    }
  }
  var selectedValue1 = ''.obs;
  RxList divisonGroup= [].obs;
  void selectValue1(String value) {
    selectedValue1.value = value;
    print("Division================================${selectedValue1.value}");
  }

  Future<void> getDivision() async{
    print("railwayGroup");
    try{
      isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.division}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        divisonGroup.value.assignAll(data['data']);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("divisonGroup==============================${railwayGroup.value}");
      }else{
        print("Failed to load a divisonGroup");
      }
    }catch(e){
      print("Error in fatching divisonGroup${e}");
    }finally{
      isLoading.value=false;
    }
  }
  RxString dropdownValue="Select Depo".obs;
  // final List<String>DepoType=[
  //   "Select Depo",
  //   "KYN GOODS",
  //   "KYN SUB",
  //   "BVS",
  //   "IGP",
  //   "PNVEL GOODS",
  //   "PNVEL SUB",
  //   "CSMT MAINLINE",
  //   "CSMT SUB",
  //   "LTT"
  // ];
  final List<String>DepoType= ["Select Depo"];
  Future<void> getDepo() async{

    print("railwayGroupvvv ${Constants.Base_URL}${Constants.depo}}");

    try{
      isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.depo}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        DepoType.addAll(List<String>.from(data['data'].map((item) => item['depo'])));
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("getDepo==============================${DepoType}");
      }else{
        print("Failed to load a depoGroup");
      }
    }catch(e){
      print("Error in fatching depoGroup${e}");
    }finally{
      isLoading.value=false;
    }
  }

  void setDropdownValue(String value) {
    dropdownValue.value = value;
    print("==================${dropdownValue.value}");
    update();
  }
  var phone=''.obs;
  void getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
     phone.value=  (await prefs.getString('phone'))!;
    print("Divy=====================>user1${phone.value}");
    phoneController.text=phone.value.toString();
  }




  bool validation(){
    bool isValidate=true;
    String error='';
    if(phone.value==''||phone.value==null){
      isValidate=false;
      error='Please Login Again';
    }else if(nameController.text==''||nameController.text==null){
      isValidate=false;
      error='Please enter your name';
    }else if(basicPayController.text==''||basicPayController.text==null){
      isValidate=false;
      error='Please enter your Basic Pay';
    }else if(pfNoController.text==''||pfNoController.text==null){
      isValidate=false;
      error='Please enter your pf Number';
    }else if(usergroupValue.value==''||usergroupValue.value==null){
      isValidate=false;
      error='Please Select your user group';
    }else if(selectedValue.value==''||selectedValue.value==null){
      isValidate=false;
      error='Please Select your Railway';
    }else if(selectedValue1.value==''||selectedValue1.value==null){
      isValidate=false;
      error='Please Select your division';
    }else if(dropdownValue.value==''||dropdownValue.value==null||dropdownValue.value=='Select Depo'){
      isValidate=false;
      error='Please Select your Depo';
    }
    if(error!=''){
      Get.dialog(
        AlertDialog(
         title: Text('Oops'),
         content: Text(error!),
         actions: [
           TextButton(onPressed: () {
             Get.back();
           }, child: Text('OK')),
         ],
        ),
      );
    }
    return isValidate;
  }
  Future<void>Profile()async {
    if(validation()){
      isLoading.value=true;
      try{
        print("=================${phone.value.toString()}");
        print("=================${nameController.text.trim()}");
        print("=================${selectedValue.value.toString()}");
        print("=================${selectedValue1.value.toString()}");
        print("=================${usergroupValue.value.toString()}");
        print("=================${dropdownValue.value.toString()}");
        var body={
          'phone': phone.value.toString(),
          'name':nameController.text.trim(),
          'railway':selectedValue.value.toString(),
          'division':selectedValue1.value.toString(),
          'role':usergroupValue.value.toString(),
          'depo':dropdownValue.value.toString(),
          'basic_pay':basicPayController.text.toString(),
          'pf_no':pfNoController.text.trim(),
        };
        final res=await http.post(Uri.parse("${Constants.Base_URL}${Constants.profile}"),body: body);
        print("statusCodestatusCode ${res.statusCode}");
        if(res.statusCode==200){
          final responseData=json.decode(res.body);
          print("statusCodestatusCode ${responseData}");
          SharedPreferences prefs = await SharedPreferences.getInstance();

          // await prefs.setString('UserDetail', json.encode(userDetails));
          await prefs.setString('UserName',nameController.text.trim());
          await prefs.setString("railway",selectedValue.value.toString());
          await prefs.setString("depo",dropdownValue.value.toString());
          await prefs.setString("role",usergroupValue.value.toString());
          await prefs.setString("division",selectedValue1.value.toString());
          await prefs.setString("phone",phone.value.toString());
          await prefs.setString("basicPay",basicPayController.text.trim());
          await prefs.setString("pfNo",pfNoController.text.toString());
          var userdetial=  await prefs.get('UserDetail');
          print("Divy=====================>user${userdetial}");
          var userdetial1=  await prefs.get('UserId');
          print("Divy=====================>user1${userdetial1}");
          var userdetial2=  await prefs.get('UserName');
          print("Divy=====================>user1${userdetial2}");
          if(responseData['message']=='Profile updated successfully.'){

            // Get.offAllNamed(Routes.HOME);
            Get.offAllNamed(Routes.HOME,arguments: nameController.text.trim());
            print("responsedata ${responseData}");
            print("responsedata ${responseData['data']}");
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
  }

  @override
  void onInit() {
    getData();
    getRole();
    getRailawys();
    getDivision();
    getDepo();
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
