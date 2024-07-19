import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  //TODO: Implement CreateAccountController

  final count = 0.obs;


  RxString usergroupValue=" ".obs;
  final List<String>UserGroup=[
    "Sub-TM",
    "Sub-MM",
    "Goods TM",
    "Goods Driver",
    "Ghat Driver",
    "ALP",
    "Mail TM",
    "Mail Driver",
    "Shunter TM",
    "Shunter Driver",
  ];
  void setDropValue(String value) {
    usergroupValue.value = value;
    update();
    print("UserGroup================================${usergroupValue.value}");
  }

  var selectedValue = ''.obs;

  void selectValue(String value) {
    selectedValue.value = value;
    print("Railway================================${selectedValue.value}");
  }
  var selectedValue1 = ''.obs;

  void selectValue1(String value) {
    selectedValue1.value = value;
    print("Division================================${selectedValue1.value}");
  }
  RxString dropdownValue="Select Depo".obs;
  final List<String>DepoType=[
    "Select Depo",
    "KYN GOODS",
    "KYN SUB",
    "BVS",
    "IGP",
    "PNVEL GOODS",
    "PNVEL SUB",
    "CSMT MAINLINE",
    "CSMT SUB",
    "LTT"
  ];
  void setDropdownValue(String value) {
    dropdownValue.value = value;
    print("==================${dropdownValue.value}");
    update();
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
