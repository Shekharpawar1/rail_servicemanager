

import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../../utils/Constant.dart';

class WorkingSetController extends GetxController {
  //TODO: Implement WorkingSetController

  TextEditingController signOnController=TextEditingController();
  TextEditingController signOnStationController=TextEditingController();
  TextEditingController signOffController=TextEditingController();
  TextEditingController signOffStationController=TextEditingController();
  TextEditingController dutyhrsController=TextEditingController();
  TextEditingController kmsController=TextEditingController();
  TextEditingController ndhController=TextEditingController();
  TextEditingController holidayController=TextEditingController();
  TextEditingController notesController=TextEditingController();



///traindata
  TextEditingController startStationController=TextEditingController();
  TextEditingController changeStationController=TextEditingController();
  TextEditingController startTimeController=TextEditingController();
  TextEditingController changeTimeController=TextEditingController();
  TextEditingController rtrbController=TextEditingController();
  TextEditingController stationNameController=TextEditingController();
  TextEditingController remarksController=TextEditingController();
  TextEditingController apfController=TextEditingController();
  TextEditingController carController=TextEditingController();
  TextEditingController trainTypeController=TextEditingController();
  RxString dropdownValue="Select Duty Type".obs;
  final List<String>DutyType=[
    "Select Duty Type",
    "Load Particulars",
    "E Books",
    "Personal",
    "Important",
    "Unusual",
    "Others",
  ];

  void setDropdownValue(String value) {
    dropdownValue.value = value;
    print("==================${dropdownValue.value}");
    update();
  }
RxList trainSetData=[].obs;
  RxMap trainData=<String, dynamic>{}.obs;

  void setValues(List value1,Map<String, dynamic> value2){
    trainSetData.value=value1;
    trainData.value=value2;
    print("===================trainset=================${trainSetData.value}");
    print("===================trainData=================${trainData.value}");
  }

  RxBool isLoading=false.obs;
  Future<void>updatetraindata(String id)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid=  await prefs.get('UserId');
    print("userrid--=================${userid}");
    isLoading.value=true;
    try{
      var body={
        "duty_hr":trainData['duty_hr'].toString(),
        "kms":trainData['kms'].toString(),
        "ndh":trainData['ndh'].toString(),
        "id":trainData['id'].toString(),
        "signon_station":trainData['signon_station'].toString(),
        "set_type":trainData['set_type'].toString(),
        "signoff_station":trainData['signoff_station'].toString(),
        "holiday":trainData['holiday'].toString(),
        "duty_shift":trainData['duty_shift'].toString(),
        "note":trainData['note'].toString(),
        "rule":trainData['rule'].toString(),
        "set_no":trainData['set_no'].toString(),
        "day":trainData['day'].toString(),
        "sign_no":trainData['sign_no'].toString(),
        "sign_off":trainData['sign_off'].toString(),
      };
      final res=await http.post(Uri.parse("${Constants.userrosterupdate}"),body: body);
      print("statusCodestatusCode ${res.statusCode}");
      if(res.statusCode==200){
        final responseData=json.decode(res.body);
        print("statusCodestatusCode ${responseData}");
        print("statusCodestatusCode ${res.body}");
        print("statusCodestatusCode ${body}");
        if(responseData['message']=='Update successful'){
          Get.snackbar("Updated!", "Changes Done",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Constants.pimaryColor,
            colorText: Colors.white,
            duration: Duration(seconds: 5),
          );
        }else{
          Get.snackbar(
            "Not Updated!", "Does not change any data",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5),
          );
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

  bool validation(){
    bool isValidate=true;
    String error='';
    if(dropdownValue.value==''||dropdownValue.value==null||dropdownValue.value=='Select Duty Type'){
      isValidate=false;
      error='Please select duty type';
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

  Future<void>AddDuty()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid=  await prefs.get('UserId');
    print("userrid--=================${userid}");
    if(validation()) {
      isLoading.value = true;
      try {
        var body = {
          "duty_hr": trainData['duty_hr'].toString(),
          "kms": trainData['kms'].toString(),
          "ndh": trainData['ndh'].toString(),
          "id": trainData['id'].toString(),
          "signon_station": trainData['signon_station'].toString(),
          "set_type": trainData['set_type'].toString(),
          "signoff_station": trainData['signoff_station'].toString(),
          "holiday": trainData['holiday'].toString(),
          "duty_shift": trainData['duty_shift'].toString(),
          "note": trainData['note'].toString(),
          "rule": trainData['rule'].toString(),
          "set_no": trainData['set_no'].toString(),
          "day": trainData['day'].toString(),
          "sign_no": trainData['sign_no'].toString(),
          "sign_off": trainData['sign_off'].toString(),
          "duty_type": dropdownValue.value.toString()
        };
        final res = await http.post(
            Uri.parse("${Constants.userrosterupdate}"), body: body);
        print("statusCodestatusCode ${res.statusCode}");
        if (res.statusCode == 200) {
          final responseData = json.decode(res.body);
          print("statusCodestatusCode ${responseData}");
          print("statusCodestatusCode ${res.body}");
          print("statusCodestatusCode ${body}");
          if (responseData['message'] == 'Update successful') {
            Get.snackbar("Updated!", "Changes Done",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Constants.pimaryColor,
              colorText: Colors.white,
              duration: Duration(seconds: 5),
            );
          } else {
            Get.snackbar(
              "Not Updated!", "Does not change any data",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: Duration(seconds: 5),
            );
          }
        } else {
          print("Failed to load ");
        }
      } catch (e) {
        print("Error in fatching Data${e}");
        print("Error in fatching Data1234567${e}");
      } finally {
        isLoading.value = false;
      }
    }
  }

  Future<void>updatetrainSetdata(int indexed)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid=  await prefs.get('UserId');
    print("userrid--=================${userid}");
    isLoading.value=true;
    try{
      var body={
      "id":trainSetData[indexed]['id'],
      "train_type":trainSetData[indexed]['train_type'],
      "train_no":trainSetData[indexed]['train_no'],
    "start_station":trainSetData[indexed]['start_station'],
    "start_time":trainSetData[indexed]['start_time'],
    "change_station":trainSetData[indexed]['change_station'],
    "change_time":trainSetData[indexed]['change_time'],
    "station_name":trainSetData[indexed]['station_name'],
    "rt_rb":trainSetData[indexed]['rt_rb'],
    "remark":trainSetData[indexed]['remark'],
    "car":trainSetData[indexed]['car'],
    "sunday_working":trainSetData[indexed]['sunday_working'],
    "type":trainSetData[indexed]['type'],
    "a_pf":trainSetData[indexed]['a_pf'],
    "train_note":trainSetData[indexed]['train_note'],
      };
      final res=await http.post(Uri.parse("${Constants.userrostertrainupdate}"),body: body);
      print("statusCodestatusCode ${res.statusCode}");
      if(res.statusCode==200){
        final responseData=json.decode(res.body);
        print("statusCodestatusCode ${responseData}");
        print("statusCodestatusCode ${res.body}");
        print("statusCodestatusCode ${body}");
        if(responseData['message']=='Update successful'){
          Get.snackbar("Updated!", "Changes Done",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Constants.pimaryColor,
            colorText: Colors.white,
            duration: Duration(seconds: 5),
          );
        }else{
          Get.snackbar(
            "Not Updated!", "Does not change any data",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
            duration: Duration(seconds: 5),
          );
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
  Future<void> deleteUserRoster(String id) async {
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.userrosterdelete}/$id'));

      if (response.statusCode == 200) {
        Get.snackbar(
          "Deleted",
          "Roster Deleted Successfully.....",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Constants.pimaryColor,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

      } else {
        Get.snackbar(
          "Error",
          "Failed to delete Roster. Status code: ${response.statusCode}",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );

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

  Future<void>uploadImage(filename)async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid=  await prefs.get('UserId');

    print("userrid--=================${userid}");
    if(validation()) {
      Get.snackbar(
        "Uploading!", "Please Wait",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Constants.pimaryColor,
        colorText: Colors.white,
        duration: Duration(seconds: 7),
      );
      isLoading.value = true;
      try {
        var uri = Uri.parse("${Constants.userrosterupdate}");
        var request = http.MultipartRequest('POST', uri);

        // Adding text fields
        request.fields['duty_hr'] = trainData['duty_hr'].toString();
        request.fields['kms'] = trainData['kms'].toString();
        request.fields['ndh'] = trainData['ndh'].toString();
        request.fields['id'] = trainData['id'].toString();
        request.fields['signon_station'] = trainData['signon_station'].toString();
        request.fields['set_type'] = trainData['set_type'].toString();
        request.fields['signoff_station'] = trainData['signoff_station'].toString();
        request.fields['holiday'] = trainData['holiday'].toString();
        request.fields['duty_shift'] = trainData['duty_shift'].toString();
        request.fields['note'] = trainData['note'].toString();
        request.fields['rule'] = trainData['rule'].toString();
        request.fields['set_no'] = trainData['set_no'].toString();
        request.fields['day'] = trainData['day'].toString();
        request.fields['sign_no'] = trainData['sign_no'].toString();
        request.fields['sign_off'] = trainData['sign_off'].toString();
        request.fields['duty_type'] = dropdownValue.value.toString();
        request.files.add(await http.MultipartFile.fromPath('file', filename));
        var res=await request.send();
        if (res.statusCode == 200) {
          final responseData = json.decode(await res.stream.bytesToString());
          print("statusCodestatusCode ${responseData}");
          if (responseData['message'] == 'Update successful') {
            Get.snackbar("Uploaded!", "Uploaded successfully",
              snackPosition: SnackPosition.TOP,
              backgroundColor: Constants.pimaryColor,
              colorText: Colors.white,
              duration: Duration(seconds: 5),
            );
          } else {
            Get.snackbar(
              "Not Uploaded!", "Does not change any data",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              duration: Duration(seconds: 5),
            );
          }
        } else {
          print("Failed to load ");
        }
      } catch (e) {
        print("Error in fatching Data${e}");
        print("Error in fatching Data1234567${e}");
      } finally {
        isLoading.value = false;
      }
    }
  }



  // final ImagePicker picker=ImagePicker();
  // // final picker = ImagePicker();
  // final RxString selectedImage = ''.obs ;
  //
  // Future<void> pickImage(ImageSource source) async {
  //   final pickedFile = await picker.pickImage(source: source, maxHeight: 1800, maxWidth: 1800);
  //   if (pickedFile != null) {
  //     selectedImage.value = pickedFile.path;
  //     uploadImage(selectedImage.value);
  //   }
  // }
  final ImagePicker picker = ImagePicker();
  final RxString selectedImage = ''.obs;

  Future<void> pickImage(ImageSource source) async {
    selectedImage.value = ''; // Clear any previous image path

    XFile? pickedFile = await picker.pickImage(
      source: source,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 40, // Initial compression while picking
    );

    if (pickedFile != null) {
      List<int>? compressedBytes = await FlutterImageCompress.compressWithFile(
        pickedFile.path,
        format: CompressFormat.jpeg,
        minHeight: 800,
        minWidth: 800,
        quality: 60, // Further compressing the image
      );

      if (compressedBytes != null) {
        // Write compressed bytes back to the file
        final compressedImageFile = File(pickedFile.path);
        await compressedImageFile.writeAsBytes(compressedBytes);

        // Update selectedImage with the path of the compressed image
        selectedImage.value = compressedImageFile.path;

        print("Selected Image Path: ${selectedImage.value}");
        uploadImage(selectedImage.value);
      }
    }
  }
  openBottomSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            Material(
              color: Colors.transparent,
              child: CupertinoActionSheetAction(
                onPressed: () {
                  // Capture from Camera
                  pickImage(ImageSource.camera);
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.camera,
                      color: CupertinoColors.black,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'Capture from Camera',
                      style: TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Material(
              color: Colors.transparent,
              child: CupertinoActionSheetAction(
                onPressed: () {
                  // Pick from Gallery
                  pickImage(ImageSource.gallery);
                  Navigator.pop(context); // Close the bottom sheet
                },
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.photo,
                      color: CupertinoColors.black,
                    ),
                    SizedBox(width: 12.0),
                    Text(
                      'Pick from Gallery',
                      style: TextStyle(
                        color: CupertinoColors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              // Cancel
              Navigator.pop(context); // Close the bottom sheet
            },
            child: Text(
              'Cancel',
              style: TextStyle(
                color: CupertinoColors.systemBlue,
                fontSize: 16.0,
              ),
            ),
          ),
        );
      },
    );
  }


  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTime.value) {
      selectedTime.value = pickedTime;
      final now = DateTime.now();

      // Format the time and set it to the TextEditingController
      signOffController.text = DateFormat('HH:mm').format(
        DateTime(now.year, now.month, now.day, selectedTime.value.hour, selectedTime.value.minute),
      );
    }
  }

  Rx<TimeOfDay> selectedTimeOn = TimeOfDay.now().obs;

  Future<void> selectTimeOn(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeOn.value,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTimeOn.value) {
      selectedTimeOn.value = pickedTime;
      final now = DateTime.now();

      // Format the time and set it to the TextEditingController
      signOnController.text = DateFormat('HH:mm').format(
        DateTime(now.year, now.month, now.day, selectedTimeOn.value.hour, selectedTimeOn.value.minute),
      );
    }
  }

  Rx<TimeOfDay> selectedTimeChange = TimeOfDay.now().obs;

  Future<void> selectTimeChange(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeChange.value,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTimeChange.value) {
      selectedTimeChange.value = pickedTime;
      final now = DateTime.now();

      // Format the time and set it to the TextEditingController
      changeTimeController.text = DateFormat('HH:mm').format(
        DateTime(now.year, now.month, now.day, selectedTimeChange.value.hour, selectedTimeChange.value.minute),
      );
    }
  }

  Rx<TimeOfDay> selectedTimeStart = TimeOfDay.now().obs;

  Future<void> selectTimeStart(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTimeStart.value,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != selectedTimeStart.value) {
      selectedTimeStart.value = pickedTime;
      final now = DateTime.now();

      // Format the time and set it to the TextEditingController
      startTimeController.text = DateFormat('HH:mm').format(
        DateTime(now.year, now.month, now.day, selectedTimeStart.value.hour, selectedTimeStart.value.minute),
      );
    }
  }
  final count = 0.obs;
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
