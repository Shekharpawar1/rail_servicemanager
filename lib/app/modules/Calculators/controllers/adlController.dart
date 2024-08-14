import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdlController extends GetxController{
  var adlAllpayController=TextEditingController();
  var adlAlldaController=TextEditingController();
  RxDouble value1=0.0.obs;
  RxDouble value2=0.0.obs;
  RxDouble result=0.0.obs;
  void calculatePercentage() {
    if (value2.value != 0) {
      result.value = (value1.value+(value1.value*value2.value)/100);
    } else {
      result.value = 0;
    }
  }
   RxString pfNo=''.obs;
  void getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pfNo.value=  (await prefs.getString('pfNo'))!;
    print("Divy=====================>user1${pfNo.value}");
    adlAllpayController.text=pfNo.value.toString();
  }
  @override
  void onInit() {
    super.onInit();
  }
}

class DaController extends GetxController{
  var dapayController=TextEditingController();
  var daDaController=TextEditingController();
  RxDouble value1=0.0.obs;
  RxDouble value2=0.0.obs;
  RxDouble result=0.0.obs;
  void calculatePercentage() {
    if (value2.value != 0) {
      result.value = ((value1.value*value2.value)/100);
    } else {
      result.value = 0;
    }
  }
}

class BasicController extends GetxController{
  var basicpayController=TextEditingController();

  RxDouble value1=0.0.obs;

  RxDouble result=0.0.obs;
  void calculatePercentage() {

      result.value =0.0;

  }
}

class HRAController extends GetxController{
  var hrapayController=TextEditingController();
  var hraController=TextEditingController();
  RxDouble value1=0.0.obs;
  RxDouble value2=0.0.obs;
  RxDouble result=0.0.obs;
  void calculatePercentage() {
    result.value = 0;
  }
}

class MileageController extends GetxController{
  var kmsController=TextEditingController();
  var selectedValue1 = 'Motormen'.obs;

  void selectValue1(String value) {
    selectedValue1.value = value;
    print("Grop================================${selectedValue1.value}");
  }
  RxDouble value1=0.0.obs;

  RxDouble result=0.0.obs;
  void calculatePercentage() {

    result.value =0.0;

  }
}


class NDAController extends GetxController{
  var hrController=TextEditingController();
  var minController=TextEditingController();
  RxDouble value1=0.0.obs;
  RxDouble value2=0.0.obs;
  RxDouble result=0.0.obs;
  void calculatePercentage() {
    result.value = 0;
  }
}

class OtController extends GetxController{
  var hrController=TextEditingController();
  var minController=TextEditingController();
  RxDouble value1=0.0.obs;
  RxDouble value2=0.0.obs;
  RxDouble value3=0.0.obs;
  RxDouble value4=0.0.obs;
  RxDouble value5=0.0.obs;
  RxDouble result=0.0.obs;
  void calculatePercentage() {
    result.value = 0;
  }
}

class TranAllController extends GetxController{
  var tranAllpayController=TextEditingController();
  var tranAlldaController=TextEditingController();
  RxDouble value1=0.0.obs;
  RxDouble value2=0.0.obs;
  RxDouble result=0.0.obs;
  void calculatePercentage() {
    if (value2.value != 0) {
      result.value = (value1.value+(value1.value*value2.value)/100);
    } else {
      result.value = 0;
    }
  }
}