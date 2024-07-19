
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../views/MyDutyDetails/alltabView.dart';
import '../views/MyDutyDetails/leavetabView.dart';

class DutyRecordsController extends GetxController with GetSingleTickerProviderStateMixin {
  //TODO: Implement DutyRecordsController

  final count = 0.obs;

  RxString usergroupValue="All".obs;
  final List<String>MyDuty=[
    "All",
    "Load Particulars Duty",
    "E Books Duty",
    "Personal Duty",
    "Important Duty ",
    "Unusual Duty",
    "Others",
    "Leave",
  ];
  void setDropValue(String value) {
    usergroupValue.value = value;
    update();
    print("UserGroup================================${usergroupValue.value}");
  }
  RxInt indexed=0.obs;
  void setValue(int value) {
    indexed.value = value;
    update();
    print("indexed================================${indexed.value}");
  }
  List<Widget>listingScreens = [
    AllDetails(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Leave(),
  ];


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }



  @override
  void onReady() {
    super.onReady();
  }



  void increment() => count.value++;
}
