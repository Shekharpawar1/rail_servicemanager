
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:serviceman/app/modules/test/controllers/test_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/Constant.dart';
import '../../../routes/app_pages.dart';
import '../views/MyDutyDetails/alltabView.dart';
import '../views/MyDutyDetails/leavetabView.dart';
import 'package:http/http.dart' as http;

class DutyRecordsController extends GetxController  {
  //TODO: Implement DutyRecordsController

  TextEditingController searchDateController=TextEditingController();
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

  RxList leaveHistory=[].obs;
  RxInt indexed=0.obs;
  void setValue(int value) {
    indexed.value = value;
    update();
    print("indexed================================${indexed.value}");
  }


  List<Widget> listingScreens = [
    // AllDetails(),
    Container(),
    Container(),
    // Container(height:200,color:Colors.red,child: AllDetails()),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    Container(),
    // Leave()
    // Leave(),
  ];
  RxBool isLoading=false.obs;
 RxList setsList=[].obs;
  Future<void> getsetbyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid=  await prefs.get('UserId');
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrosterset}/$userid'));
      if (response.statusCode == 200) {
        print("Data fetched: $response.statusCode");
        var data=json.decode(response.body);

        print("Data fetched: $data");
        setsList.assignAll(data['data']);
        print("Data fetched: ${setsList.value}.statusCode");
      } else {
        print("Failed to load sets, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching sets: $e");
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



  Future<void> getLeaveHistory(String targetDateTime) async {
    leaveHistory.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = await prefs.get('UserId');

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.leavehistory}/$userid'));

      if (response.statusCode == 200) {
        print("Data fetched: ${response.statusCode}");
        var data = json.decode(response.body);

        leaveHistory.value=data['data'].where((item) =>
       item['leave_date']== targetDateTime.toString()
        ).toList();
          print("Leave history found: ${ leaveHistory.value} records.");
      } else {
        print("Failed to load leave history, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching leave history: $e");
    } finally {
      isLoading.value = false;
    }
  }



  Future<void> deleteLeave(String id) async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.leavedelete}/$id'));

      if (response.statusCode == 200) {
        Get.snackbar(
          "Deleted",
          "Leave Deleted Successfully.....",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Constants.pimaryColor,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
         getLeaveHistory(searchDateController.text);

      } else {
        Get.snackbar(
          "Error",
          "Failed to delete leave. Status code: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
        getLeaveHistory(searchDateController.text);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Error deleting leave: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;
    }
  }





  Future<void> deleteUserSet(String id) async {
    print("============================$id");
    isLoading.value = true;  // Start loading

    try {
      var body = {
        'duty_type': '',
        'id': id.toString()
      };

      final response = await http.post(
          Uri.parse("${Constants.usersetdelete}"),
          body: body
      );

      print("statusCodestatusCode ${response.statusCode}");

      if (response.statusCode == 200) {
        Get.snackbar(
          "Deleted",
          "Record Deleted Successfully.....",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Constants.pimaryColor,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

         await getsetId(searchDateController.text);  // Ensure async completion
      } else {
        Get.snackbar(
          "Error",
          "Failed to delete record. Status code: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Error deleting record: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    } finally {
      isLoading.value = false;  // Stop loading
    }
  }

  final selectedDate = DateTime.now().obs;


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      selectedDate.value = picked;
      searchDateController.text=DateFormat('dd/MM/yy').format(selectedDate.value);
      print("${ searchDateController.text}");
    }
  }

  RxList loadParticularsDuty = [].obs;
  RxList eBooksDuty = [].obs;
  RxList personalDuty = [].obs;
  RxList importantDuty = [].obs;
  RxList unusualDuty = [].obs;
  RxList othersDuty = [].obs;

  RxBool isLoading1 = false.obs;

  Future<void> getsetId(String targetDateTime) async {
    // Clear the lists before fetching new data
    loadParticularsDuty.clear();
    personalDuty.clear();
    unusualDuty.clear();
    eBooksDuty.clear();
    importantDuty.clear();
    othersDuty.clear();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = await prefs.get('UserId');

    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrosterset}/$userid'));
      if (response.statusCode == 200) {
        print("Data fetched: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Data fetched: ${data}.statusCode");
        List<dynamic> sets = data['data'];

        // Convert targetDate to DateTime for comparison

        // Filter and add items to the respective lists based on date
        loadParticularsDuty.value.addAll(sets.where((item) =>
        item['duty_type'] == 'Load Particulars' && item['add_date']== targetDateTime.toString()
        ).toList());

        eBooksDuty.value.addAll(sets.where((item) =>
        item['duty_type'] == 'E Books' && item['add_date']== targetDateTime.toString()
        ).toList());

        personalDuty.value.addAll(sets.where((item) =>
        item['duty_type'] == 'Personal' && item['add_date']== targetDateTime.toString()
        ).toList());

        importantDuty.value.addAll(sets.where((item) =>
        item['duty_type'] == 'Important' && item['add_date']== targetDateTime.toString()
        ).toList());
        unusualDuty.value.addAll(sets.where((item) =>
        item['duty_type'] == 'Unusual' && item['add_date']== targetDateTime.toString()
        ).toList());

        othersDuty.value.addAll(sets.where((item) =>
        item['duty_type'] == 'Others' && item['add_date']== targetDateTime.toString()
        ).toList());

        // Optionally assign to a single list for UI
        setsList.assignAll(sets.where((item) => item['duty_type'] != null && item['add_date']== targetDateTime.toString()).toList());

        // Debugging output
        print("Data fetched: ${setsList.value}");
        print("Load Particulars Duty: ${loadParticularsDuty.value}");
        print("E Books Duty: ${eBooksDuty.value}");
        print("Personal Duty: ${personalDuty.value}");
        print("Important Duty: ${importantDuty.value}");
        print("Unusual Duty: ${unusualDuty.value}");
        print("Others Duty: ${othersDuty.value}");
      } else {
        print("Failed to load sets, status code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching sets: $e");
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
  RxList setDetials=[].obs;
  Future<void> getSetPaticularDetails(String id,int indexed) async {
    setDetials.value.clear();
    print("Fetching sets...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrostertrain}/${id}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Response Code: ${data}");
        print("Response Coefrhttyjyujfghyjyukyergtrhjyhgrde: ${setsList.value[indexed]}");
        setDetials.value=data['data'];
        Get.toNamed(Routes.WORKING_SET, arguments: {
          'filteredDataList': setDetials.value,
          'setData':loadParticularsDuty.value[indexed]
        });
        print("listData: ${setDetials.value}");
      }else {
        print("Failed to load sets Details");
      }
    } catch (e) {
      print("Error in fetching sets: $e");
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getSetEBookDetails(String id,int indexed) async {
    setDetials.value.clear();
    print("Fetching sets...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrostertrain}/${id}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Response Code: ${data}");
        print("Response Coefrhttyjyujfghyjyukyergtrhjyhgrde: ${setsList.value[indexed]}");
        setDetials.value=data['data'];
        Get.toNamed(Routes.WORKING_SET, arguments: {
          'filteredDataList': setDetials.value,
          'setData':eBooksDuty.value[indexed]
        });
        print("listData: ${setDetials.value}");
      }else {
        print("Failed to load sets Details");
      }
    } catch (e) {
      print("Error in fetching sets: $e");
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getSetPersonalDetails(String id,int indexed) async {
    setDetials.value.clear();
    print("Fetching sets...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrostertrain}/${id}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Response Code: ${data}");
        print("Response Coefrhttyjyujfghyjyukyergtrhjyhgrde: ${setsList.value[indexed]}");
        setDetials.value=data['data'];
        Get.toNamed(Routes.WORKING_SET, arguments: {
          'filteredDataList': setDetials.value,
          'setData':personalDuty.value[indexed]
        });
        print("listData: ${setDetials.value}");
      }else {
        print("Failed to load sets Details");
      }
    } catch (e) {
      print("Error in fetching sets: $e");
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getSetImportantDetails(String id,int indexed) async {
    setDetials.value.clear();
    print("Fetching sets...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrostertrain}/${id}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Response Code: ${data}");
        print("Response Coefrhttyjyujfghyjyukyergtrhjyhgrde: ${setsList.value[indexed]}");
        setDetials.value=data['data'];
        Get.toNamed(Routes.WORKING_SET, arguments: {
          'filteredDataList': setDetials.value,
          'setData':importantDuty.value[indexed]
        });
        print("listData: ${setDetials.value}");
      }else {
        print("Failed to load sets Details");
      }
    } catch (e) {
      print("Error in fetching sets: $e");
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getSetUnusalDetails(String id,int indexed) async {
    setDetials.value.clear();
    print("Fetching sets...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrostertrain}/${id}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Response Code: ${data}");
        print("Response Coefrhttyjyujfghyjyukyergtrhjyhgrde: ${setsList.value[indexed]}");
        setDetials.value=data['data'];
        Get.toNamed(Routes.WORKING_SET, arguments: {
          'filteredDataList': setDetials.value,
          'setData':unusualDuty.value[indexed]
        });
        print("listData: ${setDetials.value}");
      }else {
        print("Failed to load sets Details");
      }
    } catch (e) {
      print("Error in fetching sets: $e");
    } finally {
      isLoading.value = false;
    }
  }
  Future<void> getSetOthersDetails(String id,int indexed) async {
    setDetials.value.clear();
    print("Fetching sets...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrostertrain}/${id}'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);
        print("Response Code: ${data}");
        print("Response Coefrhttyjyujfghyjyukyergtrhjyhgrde: ${setsList.value[indexed]}");
        setDetials.value=data['data'];
        Get.toNamed(Routes.WORKING_SET, arguments: {
          'filteredDataList': setDetials.value,
          'setData':othersDuty.value[indexed]
        });
        print("listData: ${setDetials.value}");
      }else {
        print("Failed to load sets Details");
      }
    } catch (e) {
      print("Error in fetching sets: $e");
    } finally {
      isLoading.value = false;
    }
  }
  @override
  void onInit() {

    // searchDateController.text=DateFormat('dd/MM/yy').format(selectedDate.value);
    // getsetId('13/08/24');
    // getsetId();
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
