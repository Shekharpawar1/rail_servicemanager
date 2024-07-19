import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../views/Calculator/AdlCalculator.dart';
class CalculatorsController extends GetxController {
  //TODO: Implement CalculatorsController


  RxString calculatortypeValue="ADL ALL".obs;
  final List<String>calculatortype=[
    "ADL ALL",
    "BASIC",
    "DA",
    "HRA",
    "MILEAGE",
    "NDA",
    "OT",
    "TRAN ALL",
  ];
  void setCalculateValue(String value) {
    calculatortypeValue.value = value;
    update();
    print("calculatortypeValue================================${calculatortypeValue.value}");
  }
  List<Widget>listingScreens = [
    ADL(),
    Basic(),
    DA(),
    HRA(),
    Mileage(),
    NDA(),
    OT(),
    TranAll(),
  ];


  RxInt indexed=0.obs;
  void setValue(int value) {
    indexed.value = value;
    update();
    print("indexed================================${indexed.value}");
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

}
