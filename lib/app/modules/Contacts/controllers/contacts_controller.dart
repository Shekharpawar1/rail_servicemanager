import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

import '../../../../utils/Constant.dart';
import '../views/ListOfContacts.dart';
class ContactsController extends GetxController {
  //TODO: Implement ContactsController

  final TextEditingController searchController = TextEditingController();
  final TextEditingController searchbyidController = TextEditingController();

  RxInt isExpanded = 0.obs;
  RxBool isFavirate=false.obs;
  void toggleExpanded(int indexed) {
    isExpanded.value = indexed;
    isFavirate.value = !isFavirate.value;
  }
  void toggleFavirate() {
    isFavirate.value = !isFavirate.value;
  }
  final count = 0.obs;


RxBool isLoading=false.obs;
  var selectedValue1 = "".obs;
  RxList contacts= [].obs;
  RxList filteredContacts = [].obs;
  void selectValue1(String value) {
    selectedValue1.value = value;
    print("contacts================================${selectedValue1.value}");
  }

  Future<void> getContact() async{
    print("contacts");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.contact}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        contacts.value.assignAll(data['data']);
        filteredContacts.assignAll(contacts);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("contacts==============================${contacts.value}");
      }else{
        print("Failed to load a contacts");
      }
    }catch(e){
      print("Error in fatching contacts${e}");
    }finally{
      isLoading.value=false;
    }
  }

  void filterContacts(String query) {
    if (query.isEmpty) {
      filteredContacts.assignAll(contacts);
    } else {
      filteredContacts.assignAll(contacts.where((contact) {
        return contact['department'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }


  var contactsbyDep = <Map<String, dynamic>>[].obs;
  var filteredContactsbyDep = <Map<String, dynamic>>[].obs;

  Future<void> getContactById(String id) async {
    print("Fetching contacts...");
    try {
      isLoading.value = true;
      final response = await http.get(Uri.parse('${Constants.contactDep}/$id'));

      if (response.statusCode == 200) {
        print("Response Code: ${response.statusCode}");
        var data = json.decode(response.body);

        if (data['data'] is List) {
          contactsbyDep.assignAll(List<Map<String, dynamic>>.from(data['data']));
          filteredContactsbyDep.assignAll(contactsbyDep);
          update();
          isLoading.value = false; // Stop loading spinner before navigation
          Get.to(ListOfContacts());
        } else {
          print("Unexpected data format");
        }
      } else {
        print("Failed to load contacts");
      }
    } catch (e) {
      print("Error in fetching contacts: $e");
    } finally {
      isLoading.value = false;
    }
  }
  void filterContactsbyDep(String query) {
    if (query.isEmpty) {
      filteredContactsbyDep.assignAll(contactsbyDep);
    } else {
      filteredContactsbyDep.assignAll(contactsbyDep.where((contactsbyDep) {
        return contactsbyDep['name'].toString().toLowerCase().contains(query.toLowerCase());
      }).toList());
    }
  }

  var selectedValue = ''.obs;
  void selectValue(String value) {
    selectedValue.value = value;
    print("Railway================================${selectedValue.value}");
  }
  var CallingNumber = ''.obs;

  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri url = Uri(scheme: 'tel', path: phoneNumber);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error: $e');
      Get.snackbar(
        "Error",
        "Could not launch phone call.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
      );
    }
    update();
  }

  void setCallingNumber(String phoneNumber) {
    CallingNumber.value = phoneNumber;
    update();
    makePhoneCall(CallingNumber.value);
  }
  @override
  void onInit() {
    super.onInit();
    getContact();
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
