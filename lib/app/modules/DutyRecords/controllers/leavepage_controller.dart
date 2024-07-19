import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class LeavePageController extends GetxController{

  final raesonController=TextEditingController();

  final pfnoMController=TextEditingController();
  final rateMController=TextEditingController();
  final pfnoOController=TextEditingController();
  final rateOController=TextEditingController();


  final selectedDate = DateTime.now().obs;

  void selectCurrentDate(){
    selectedDate.value=DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate.value);
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

    }
  }

  RxString dropdownValue="Leave Type".obs;
  final List<String>LeaveType=[
    "Leave Type",
    "APL",
    "CL",
    "SICK",
    "NH",
    "OTHER",
  ];
  void setDropdownValue(String value) {
    dropdownValue.value = value;
    print("==================${dropdownValue.value}");
    update();
  }


  var selectedValue = 'Generate Mileage Report'.obs;

  void selectValue(String value) {
    selectedValue.value = value;
    print("Railway================================${selectedValue.value}");
  }



  var selectedMonth = 'Select Month'.obs;
  final List<String> months = [
    "Select Month",
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  void setSelectedMonth(String month) {
    selectedMonth.value = month;
  }

  var selectedDates = 'Select Date'.obs;
  final List<String> dates = [
    "Select Date",
    '19-12-2023 To 01-01-2024', '02-01-2024 To 15-01-2024', '16-01-2024 To 29-01-2024', '30-01-2024 To 12-02-2024', '13-02-2024 To 26-02-2024', '27-02-2024 To 12-03-2024',
    '13-03-2024 To 26-03-2024', '13-03-2024 To 26-03-2024', '27-03-2024 To 09-04-2024', '10-04-2024 To 23-04-2024', '24-04-2024 To 07-05-2024', '08-05-2024  To  21-05-2024'
  ];

  void setSelectedDates(String month) {
    selectedDates.value = month;
  }


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

}