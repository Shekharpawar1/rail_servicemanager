

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class WorkingSetController extends GetxController {
  //TODO: Implement WorkingSetController

  TextEditingController signOnController=TextEditingController();
  TextEditingController signOnStationController=TextEditingController();
  TextEditingController signOffController=TextEditingController();
  TextEditingController signOffStationController=TextEditingController();
  TextEditingController dutyhrsController=TextEditingController();
  TextEditingController kmsController=TextEditingController();
  TextEditingController ndhController=TextEditingController();
  TextEditingController notesController=TextEditingController();
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



  final ImagePicker picker=ImagePicker();
  // final picker = ImagePicker();
  final RxString selectedImage = ''.obs ;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source, maxHeight: 1800, maxWidth: 1800);
    if (pickedFile != null) {
      selectedImage.value = pickedFile.path;
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
