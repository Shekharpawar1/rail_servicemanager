import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:serviceman/component/common_textformfield.dart';

import '../../../../utils/Constant.dart';
import '../controllers/working_set_controller.dart';

class WorkingSetView extends GetView<WorkingSetController> {
  WorkingSetView({Key? key}) : super(key: key);
  WorkingSetController workingSetController = WorkingSetController();
  final argumentData = Get.arguments as Map;
  var timeMaskFormatter = MaskTextInputFormatter(
    mask: '##:##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  String? validateTime(String value) {
    // Split the input into hours and minutes
    List<String> parts = value.split(':');
    if (parts.length != 2) return 'Invalid time format';

    int hours = int.tryParse(parts[0]) ?? 0;
    int minutes = int.tryParse(parts[1]) ?? 0;

    // Validate hours and minutes
    if (hours > 23) {
      return 'Hours cannot be greater than 23';
    }
    if (minutes > 59) {
      return 'Minutes cannot be greater than 59';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // print("============dgdgdgdgd================${argumentData['setData']}");
    // print("============dgdgdgdgd================${argumentData['filteredDataList']}");
    workingSetController.setValues(
        argumentData['filteredDataList'], argumentData['setData']);
    List<Widget> ItemList = [
      InkWell(
        onTap: () {
          workingSetController.signOnController.text =
              workingSetController.trainData['sign_no'].toString();
          workingSetController.signOnStationController.text =
              workingSetController.trainData['signon_station'];
          Get.dialog(
            AlertDialog.adaptive(
              backgroundColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8)),
              titlePadding: EdgeInsets.all(15),
              title: Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Constants.secondaryColor),
                child: Center(
                  child: Text(
                    "Edit Value",
                    textScaler: TextScaler.linear(1),
                    style: TextStyle(
                      color: Constants.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              content: Container(
                height: 110,
                child: Column(
                  children: [
                    CommonTextFormField(
                      labletext: "SIGN ON",
                      keyboardTypes: TextInputType.text,
                      controller: workingSetController.signOnController,
                      input: timeMaskFormatter,
                      icons: InkWell(
                        onTap: () {
                          workingSetController.selectTimeOn(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.watch_later_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonTextFormField(
                        labletext: "SIGN ON STATION",
                        keyboardTypes: TextInputType.name,
                        controller:
                            workingSetController.signOnStationController),
                  ],
                ),
              ),
              actionsPadding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Constants.secondaryColor)),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      onPressed: () {
                        Get.back();
                      },
                      height: 35,
                      minWidth: 78,
                      color: Constants.secondaryColor,
                      child: Center(
                        child: Text(
                          "Cancel",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Constants.pimaryColor)),
                      onPressed: () {
                        final error = validateTime(
                            workingSetController.signOnController.text);
                        if (error != null) {
                          ScaffoldMessenger.of(Get.context!)
                              .showSnackBar(SnackBar(
                            content: Text(error),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          Get.back();
                          workingSetController.trainData['sign_no'] =
                              workingSetController.signOnController.text;
                          workingSetController.trainData['signon_station'] =
                              workingSetController.signOnStationController.text;
                          workingSetController.updatetraindata(
                              workingSetController.trainData['id']);
                          // Get.snackbar("Updated!", "Changes Done",);
                        }
                      },
                      height: 35,
                      minWidth: 70,
                      color: Constants.pimaryColor,
                      child: Center(
                        child: Text(
                          "Update",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
              color: Constants.whiteColor,
              border: Border(
                  right: BorderSide(
                color: Colors.grey.shade400,
              ))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SIGN ON",
                textScaler: TextScaler.linear(1),
                style: TextStyle(
                  color: Constants.pimaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${workingSetController.trainData['sign_no']}",
                textScaler: TextScaler.linear(1),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "${workingSetController.trainData['signon_station']}",
                textScaler: TextScaler.linear(1),
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
      InkWell(
        onTap: () {
          workingSetController.signOffController.text =
              workingSetController.trainData['sign_off'];
          workingSetController.signOffStationController.text =
              workingSetController.trainData['signoff_station'];
          Get.dialog(
            AlertDialog.adaptive(
              backgroundColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8)),
              titlePadding: EdgeInsets.all(15),
              title: Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Constants.secondaryColor),
                child: Center(
                  child: Text(
                    "Edit Value",
                    textScaler: TextScaler.linear(1),
                    style: TextStyle(
                      color: Constants.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              content: Container(
                height: 110,
                child: Column(
                  children: [
                    CommonTextFormField(
                      labletext: "SIGN OFF",
                      keyboardTypes: TextInputType.datetime,
                      controller: workingSetController.signOffController,
                      input: timeMaskFormatter,
                      icons: InkWell(
                        onTap: () {
                          workingSetController.selectTime(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.watch_later_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CommonTextFormField(
                        labletext: "SIGN OFF STATION",
                        keyboardTypes: TextInputType.name,
                        controller:
                            workingSetController.signOffStationController),
                  ],
                ),
              ),
              actionsPadding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Constants.secondaryColor)),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      onPressed: () {
                        Get.back();
                      },
                      height: 35,
                      minWidth: 78,
                      color: Constants.secondaryColor,
                      child: Center(
                        child: Text(
                          "Cancel",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Constants.pimaryColor)),
                      onPressed: () {
                        final error = validateTime(
                            workingSetController.signOffController.text);
                        if (error != null) {
                          ScaffoldMessenger.of(Get.context!)
                              .showSnackBar(SnackBar(
                            content: Text(error),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          workingSetController.trainData['sign_off'] =
                              workingSetController.signOffController.text;
                          workingSetController.trainData['signoff_station'] =
                              workingSetController
                                  .signOffStationController.text;
                          Get.back();
                          workingSetController.updatetraindata(
                              workingSetController.trainData['id']);
                          // Optionally, you can also show a success message here
                          // ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
                          //   content: Text("Updated Successfully!"),
                          //   backgroundColor: Colors.green,
                          // ));
                        }
                      },
                      height: 35,
                      minWidth: 70,
                      color: Constants.pimaryColor,
                      child: Center(
                        child: Text(
                          "Update",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                color: Constants.whiteColor,
                border: Border(
                    right: BorderSide(
                  color: Colors.grey.shade400,
                ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "SIGN OFF",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Constants.pimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${workingSetController.trainData['sign_off']}",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${workingSetController.trainData['signoff_station']}",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )),
      ),
      InkWell(
        // onTap: () {
        //   workingSetController.dutyhrsController.text =
        //       workingSetController.trainData['duty_hr'];
        //   Get.dialog(
        //     AlertDialog.adaptive(
        //       backgroundColor: Colors.white,
        //       contentPadding: EdgeInsets.symmetric(horizontal: 10),
        //       shape: OutlineInputBorder(
        //           borderSide: BorderSide(color: Colors.white),
        //           borderRadius: BorderRadius.circular(8)),
        //       titlePadding: EdgeInsets.all(15),
        //       title: Container(
        //         width: double.infinity,
        //         height: 35,
        //         decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(5),
        //             color: Constants.secondaryColor),
        //         child: Center(
        //           child: Text(
        //             "Edit Value",
        //             textScaler: TextScaler.linear(1),
        //             style: TextStyle(
        //               color: Constants.whiteColor,
        //               fontSize: 16,
        //             ),
        //           ),
        //         ),
        //       ),
        //       content: Container(
        //         height: 70,
        //         child: Column(
        //           children: [
        //             CommonTextFormField(
        //                 labletext: "Duty HRS",
        //                 keyboardTypes: TextInputType.text,
        //                 controller: workingSetController.dutyhrsController),
        //             SizedBox(
        //               height: 10,
        //             ),
        //             // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
        //           ],
        //         ),
        //       ),
        //       actionsPadding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
        //       actions: [
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             MaterialButton(
        //               shape: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(5),
        //                   borderSide:
        //                       BorderSide(color: Constants.secondaryColor)),
        //               padding: EdgeInsets.symmetric(horizontal: 18),
        //               onPressed: () {
        //                 Get.back();
        //               },
        //               height: 35,
        //               minWidth: 78,
        //               color: Constants.secondaryColor,
        //               child: Center(
        //                 child: Text(
        //                   "Cancel",
        //                   textScaler: TextScaler.linear(1),
        //                   style: TextStyle(
        //                       color: Constants.whiteColor,
        //                       fontSize: 14,
        //                       fontWeight: FontWeight.w400),
        //                 ),
        //               ),
        //             ),
        //             SizedBox(
        //               width: 28,
        //             ),
        //             MaterialButton(
        //               shape: OutlineInputBorder(
        //                   borderRadius: BorderRadius.circular(5),
        //                   borderSide: BorderSide(color: Constants.pimaryColor)),
        //               onPressed: () {
        //                 workingSetController.trainData['duty_hr'] =
        //                     workingSetController.dutyhrsController.text;
        //                 Get.back();
        //                 workingSetController.updatetraindata(
        //                     workingSetController.trainData['id']);
        //                 // Get.snackbar("Updated!", "Changes Done",);
        //               },
        //               height: 35,
        //               minWidth: 70,
        //               color: Constants.pimaryColor,
        //               child: Center(
        //                 child: Text(
        //                   "Update",
        //                   textScaler: TextScaler.linear(1),
        //                   style: TextStyle(
        //                       color: Constants.whiteColor,
        //                       fontSize: 14,
        //                       fontWeight: FontWeight.w400),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),
        //   );
        // },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                color: Constants.whiteColor,
                border: Border(
                    right: BorderSide(
                  color: Colors.grey.shade400,
                ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "DUTY HRS",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Constants.pimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${workingSetController.trainData['duty_hr']}",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Text("CSMT",
                //   textScaler: TextScaler.linear(1),style: TextStyle(
                //     color: Colors.teal,
                //     fontSize: 13,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
              ],
            )),
      ),
      InkWell(
        onTap: () {
          workingSetController.kmsController.text =
              workingSetController.trainData['kms'];
          Get.dialog(
            AlertDialog.adaptive(
              backgroundColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8)),
              titlePadding: EdgeInsets.all(15),
              title: Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Constants.secondaryColor),
                child: Center(
                  child: Text(
                    "Edit Value",
                    textScaler: TextScaler.linear(1),
                    style: TextStyle(
                      color: Constants.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              content: Container(
                height: 70,
                child: Column(
                  children: [
                    CommonTextFormField(
                        labletext: "KMS",
                        keyboardTypes: TextInputType.text,
                        controller: workingSetController.kmsController),
                    SizedBox(
                      height: 10,
                    ),
                    // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                  ],
                ),
              ),
              actionsPadding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Constants.secondaryColor)),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      onPressed: () {
                        Get.back();
                      },
                      height: 35,
                      minWidth: 78,
                      color: Constants.secondaryColor,
                      child: Center(
                        child: Text(
                          "Cancel",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Constants.pimaryColor)),
                      onPressed: () {
                        workingSetController.trainData['kms'] =
                            workingSetController.kmsController.text;
                        Get.back();
                        workingSetController.updatetraindata(
                            workingSetController.trainData['id']);
                        // Get.snackbar("Updated!", "Changes Done",);
                      },
                      height: 35,
                      minWidth: 70,
                      color: Constants.pimaryColor,
                      child: Center(
                        child: Text(
                          "Update",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                color: Constants.whiteColor,
                border: Border(
                    right: BorderSide(
                  color: Colors.grey.shade400,
                ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "KMS",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Constants.pimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${workingSetController.trainData['kms']}",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Text("CSMT",
                //   textScaler: TextScaler.linear(1),style: TextStyle(
                //     color: Colors.teal,
                //     fontSize: 13,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
              ],
            )),
      ),
      InkWell(
        onTap: () {
          workingSetController.ndhController.text =
              workingSetController.trainData['ndh'];
          Get.dialog(
            AlertDialog.adaptive(
              backgroundColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
              shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(8)),
              titlePadding: EdgeInsets.all(15),
              title: Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Constants.secondaryColor),
                child: Center(
                  child: Text(
                    "Edit Value",
                    textScaler: TextScaler.linear(1),
                    style: TextStyle(
                      color: Constants.whiteColor,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              content: Container(
                height: 70,
                child: Column(
                  children: [
                    CommonTextFormField(
                        labletext: "NDH",
                        keyboardTypes: TextInputType.text,
                        controller: workingSetController.ndhController),
                    SizedBox(
                      height: 10,
                    ),
                    // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                  ],
                ),
              ),
              actionsPadding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              BorderSide(color: Constants.secondaryColor)),
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      onPressed: () {
                        Get.back();
                      },
                      height: 35,
                      minWidth: 78,
                      color: Constants.secondaryColor,
                      child: Center(
                        child: Text(
                          "Cancel",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 28,
                    ),
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Constants.pimaryColor)),
                      onPressed: () {
                        workingSetController.trainData['ndh'] =
                            workingSetController.ndhController.text;
                        Get.back();
                        workingSetController.updatetraindata(
                            workingSetController.trainData['id']);
                        // Get.snackbar("Updated!", "Changes Done",);
                      },
                      height: 35,
                      minWidth: 70,
                      color: Constants.pimaryColor,
                      child: Center(
                        child: Text(
                          "Update",
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(5),
                color: Constants.whiteColor,
                border: Border(
                    right: BorderSide(
                  color: Colors.grey.shade400,
                ))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NDH",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Constants.pimaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${workingSetController.trainData['ndh']}",
                  textScaler: TextScaler.linear(1),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                // Text("CSMT",
                //   textScaler: TextScaler.linear(1),style: TextStyle(
                //     color: Colors.teal,
                //     fontSize: 13,
                //     fontWeight: FontWeight.w600,
                //   ),
                // ),
              ],
            )),
      ),
      Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(5),
            color: Constants.whiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "INFO",
                textScaler: TextScaler.linear(1),
                style: TextStyle(
                  color: Constants.pimaryColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                Icons.picture_as_pdf,
                color: Constants.secondaryColor,
                size: 20,
              ),
            ],
          )),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Text(
          "Working History",
          textScaler: TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () {
                workingSetController.deleteUserRoster(
                    workingSetController.trainData['id'].toString());
              },
              child: Icon(
                Icons.delete_forever_rounded,
                size: 35,
                color: Colors.red,
              ),
            ),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 70,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ItemList.length,
                    itemBuilder: (context, index) {
                      return ItemList[index];
                    }),
                // Row(children: [
                //   InkWell(
                //     onTap: () {
                //       workingSetController.signOnController.text= workingSetController.trainData['sign_no'].toString();
                //       workingSetController.signOnStationController.text=workingSetController.trainData['signon_station'];
                //       Get.dialog(
                //         AlertDialog.adaptive(
                //           backgroundColor: Colors.white,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 10),
                //           shape: OutlineInputBorder(
                //             borderSide: BorderSide(color: Colors.white),
                //             borderRadius: BorderRadius.circular(8)
                //           ),
                //           titlePadding: EdgeInsets.all(15),
                //           title: Container(
                //             width: double.infinity,
                //             height: 35,
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(5),
                //               color: Constants.secondaryColor
                //             ),
                //             child: Center(
                //               child: Text("Edit Value",
                //                 textScaler: TextScaler.linear(1),style: TextStyle(
                //                   color: Constants.whiteColor,
                //                   fontSize: 16,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           content: Container(
                //             height: 110,
                //             child: Column(
                //               children: [
                //                 CommonTextFormField(labletext: "SIGN ON", keyboardTypes: TextInputType.text, controller: workingSetController.signOnController),
                //                  SizedBox(height: 10,),
                //                 CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                //               ],
                //             ),
                //           ),
                //           actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                //           actions: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //
                //                 MaterialButton(
                //                   shape: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                       borderSide: BorderSide(
                //                           color: Constants.secondaryColor
                //                       )
                //                   ),
                //                   padding: EdgeInsets.symmetric(horizontal: 18),
                //                   onPressed: () {
                //                    Get.back();
                //                   },
                //                   height: 35,
                //                   minWidth: 78,
                //
                //                   color: Constants.secondaryColor,
                //                   child: Center(
                //                     child:Text(
                //                       "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                //                         color: Constants.whiteColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400
                //                     ),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(width: 28,),
                //                 MaterialButton(
                //                   shape: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                       borderSide: BorderSide(
                //                           color: Constants.pimaryColor
                //                       )
                //                   ),
                //                   onPressed: () {
                //
                //                     Get.back();
                //                     workingSetController.trainData['sign_no']=workingSetController.signOnController.text;
                //                     workingSetController.trainData['signon_station']=workingSetController.signOnStationController.text;
                //                     workingSetController.updatetraindata(workingSetController.trainData['id']);
                //                     Get.snackbar("Updated!", "Changes Done",);
                //                   },
                //                   height: 35,
                //                   minWidth: 70,
                //                   color: Constants.pimaryColor,
                //                   child: Center(
                //                     child: Text(
                //                       "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                //                         color: Constants.whiteColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400
                //                     ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //     child: Container(
                //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.only(
                //               topLeft: Radius.circular(5),
                //               bottomLeft: Radius.circular(5)),
                //           color: Constants.whiteColor,
                //           border: Border(
                //               right: BorderSide(
                //             color: Colors.grey.shade400,
                //           ))),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "SIGN ON",
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //               color: Constants.pimaryColor,
                //               fontSize: 13,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //           Text(
                //             "${workingSetController.trainData['sign_no']}",
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //               color: Colors.grey,
                //               fontSize: 14,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //           Text(
                //             "${workingSetController.trainData['signon_station']}",
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //               color: Colors.teal,
                //               fontSize: 14,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                //   InkWell(
                //     onTap: () {
                //       workingSetController.signOffController.text= workingSetController.trainData['sign_off'];
                //       workingSetController.signOffStationController.text=workingSetController.trainData['signoff_station'];
                //       Get.dialog(
                //         AlertDialog.adaptive(
                //           backgroundColor: Colors.white,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 10),
                //           shape: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.white),
                //               borderRadius: BorderRadius.circular(8)
                //           ),
                //           titlePadding: EdgeInsets.all(15),
                //           title: Container(
                //             width: double.infinity,
                //             height: 35,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: Constants.secondaryColor
                //             ),
                //             child: Center(
                //               child: Text("Edit Value",
                //                 textScaler: TextScaler.linear(1),style: TextStyle(
                //                   color: Constants.whiteColor,
                //                   fontSize: 16,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           content: Container(
                //             height: 110,
                //             child: Column(
                //               children: [
                //                 CommonTextFormField(labletext: "SIGN OFF", keyboardTypes: TextInputType.text, controller: workingSetController.signOffController),
                //                 SizedBox(height: 10,),
                //                 CommonTextFormField(labletext: "SIGN OFF STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOffStationController),
                //               ],
                //             ),
                //           ),
                //           actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                //           actions: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //
                //                 MaterialButton(
                //                   shape: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                       borderSide: BorderSide(
                //                           color: Constants.secondaryColor
                //                       )
                //                   ),
                //                   padding: EdgeInsets.symmetric(horizontal: 18),
                //                   onPressed: () {
                //                     Get.back();
                //                   },
                //                   height: 35,
                //                   minWidth: 78,
                //
                //                   color: Constants.secondaryColor,
                //                   child: Center(
                //                     child:Text(
                //                       "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                //                         color: Constants.whiteColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400
                //                     ),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(width: 28,),
                //                 MaterialButton(
                //                   shape: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                       borderSide: BorderSide(
                //                           color: Constants.pimaryColor
                //                       )
                //                   ),
                //                   onPressed: () {
                //                     workingSetController.trainData['sign_off']=workingSetController.signOffController.text;
                //                     workingSetController.trainData['signoff_station']=workingSetController.signOffStationController.text;
                //                     Get.back();
                //                     Get.snackbar("Updated!", "Changes Done",);
                //                   },
                //                   height: 35,
                //                   minWidth: 70,
                //
                //                   color: Constants.pimaryColor,
                //                   child: Center(
                //                     child: Text(
                //                       "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                //                         color: Constants.whiteColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400
                //                     ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       );                    },
                //     child: Container(
                //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                //         decoration: BoxDecoration(
                //             // borderRadius: BorderRadius.circular(5),
                //             color: Constants.whiteColor,
                //             border: Border(
                //                 right: BorderSide(
                //               color: Colors.grey.shade400,
                //             ))),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "SIGN OFF",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //                 color: Constants.pimaryColor,
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             Text(
                //               "${workingSetController.trainData['sign_off']}",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //               color: Colors.grey,
                //               fontSize: 14,
                //               fontWeight: FontWeight.w600,
                //             ),
                //             ),
                //             Text(
                //               "${workingSetController.trainData['signoff_station']}",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //                 color: Colors.teal,
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //           ],
                //         )),
                //   ),
                //   InkWell(
                //     onTap: () {
                //       workingSetController.dutyhrsController.text=workingSetController.trainData['duty_hr'];
                //       Get.dialog(
                //         AlertDialog.adaptive(
                //           backgroundColor: Colors.white,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 10),
                //           shape: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.white),
                //               borderRadius: BorderRadius.circular(8)
                //           ),
                //           titlePadding: EdgeInsets.all(15),
                //           title: Container(
                //             width: double.infinity,
                //             height: 35,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: Constants.secondaryColor
                //             ),
                //             child: Center(
                //               child: Text("Edit Value",
                //                 textScaler: TextScaler.linear(1),style: TextStyle(
                //                   color: Constants.whiteColor,
                //                   fontSize: 16,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           content: Container(
                //             height: 70,
                //             child: Column(
                //               children: [
                //                 CommonTextFormField(labletext: "Duty HRS", keyboardTypes: TextInputType.text, controller: workingSetController.dutyhrsController),
                //                 SizedBox(height: 10,),
                //                 // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                //               ],
                //             ),
                //           ),
                //           actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                //           actions: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 MaterialButton(
                //                   shape: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                       borderSide: BorderSide(
                //                           color: Constants.secondaryColor
                //                       )
                //                   ),
                //                   padding: EdgeInsets.symmetric(horizontal: 18),
                //                   onPressed: () {
                //                     Get.back();
                //                   },
                //                   height: 35,
                //                   minWidth: 78,
                //
                //                   color: Constants.secondaryColor,
                //                   child: Center(
                //                     child:Text(
                //                       "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                //                         color: Constants.whiteColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400
                //                     ),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(width: 28,),
                //                 MaterialButton(
                //                   shape: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                       borderSide: BorderSide(
                //                           color: Constants.pimaryColor
                //                       )
                //                   ),
                //                   onPressed: () {
                //                     workingSetController.trainData['duty_hr']=workingSetController.dutyhrsController.text;
                //                     Get.back();
                //                     Get.snackbar("Updated!", "Changes Done",);
                //                   },
                //                   height: 35,
                //                   minWidth: 70,
                //
                //                   color: Constants.pimaryColor,
                //                   child: Center(
                //                     child: Text(
                //                       "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                //                         color: Constants.whiteColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400
                //                     ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //     child: Container(
                //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                //         decoration: BoxDecoration(
                //             // borderRadius: BorderRadius.circular(5),
                //             color: Constants.whiteColor,
                //             border: Border(
                //                 right: BorderSide(
                //               color: Colors.grey.shade400,
                //             ))),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "DUTY HRS",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //                 color: Constants.pimaryColor,
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             Text(
                //               "${workingSetController.trainData['duty_hr']}",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //                 color: Colors.grey,
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             // Text("CSMT",
                //             //   textScaler: TextScaler.linear(1),style: TextStyle(
                //             //     color: Colors.teal,
                //             //     fontSize: 13,
                //             //     fontWeight: FontWeight.w600,
                //             //   ),
                //             // ),
                //           ],
                //         )),
                //   ),
                //   InkWell(
                //       onTap: () {
                //         workingSetController.kmsController.text=workingSetController.trainData['kms'];
                //         Get.dialog(
                //           AlertDialog.adaptive(
                //             backgroundColor: Colors.white,
                //             contentPadding: EdgeInsets.symmetric(horizontal: 10),
                //             shape: OutlineInputBorder(
                //                 borderSide: BorderSide(color: Colors.white),
                //                 borderRadius: BorderRadius.circular(8)
                //             ),
                //             titlePadding: EdgeInsets.all(15),
                //             title: Container(
                //               width: double.infinity,
                //               height: 35,
                //               decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(5),
                //                   color: Constants.secondaryColor
                //               ),
                //               child: Center(
                //                 child: Text("Edit Value",
                //                   textScaler: TextScaler.linear(1),style: TextStyle(
                //                     color: Constants.whiteColor,
                //                     fontSize: 16,
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             content: Container(
                //               height: 70,
                //               child: Column(
                //                 children: [
                //                   CommonTextFormField(labletext: "KMS", keyboardTypes: TextInputType.text, controller: workingSetController.kmsController),
                //                   SizedBox(height: 10,),
                //                   // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                //                 ],
                //               ),
                //             ),
                //             actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                //             actions: [
                //               Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   MaterialButton(
                //                     shape: OutlineInputBorder(
                //                         borderRadius: BorderRadius.circular(5),
                //                         borderSide: BorderSide(
                //                             color: Constants.secondaryColor
                //                         )
                //                     ),
                //                     padding: EdgeInsets.symmetric(horizontal: 18),
                //                     onPressed: () {
                //                       Get.back();
                //                     },
                //                     height: 35,
                //                     minWidth: 78,
                //
                //                     color: Constants.secondaryColor,
                //                     child: Center(
                //                       child:Text(
                //                         "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                //                           color: Constants.whiteColor,
                //                           fontSize: 14,
                //                           fontWeight: FontWeight.w400
                //                       ),
                //                       ),
                //                     ),
                //                   ),
                //                   SizedBox(width: 28,),
                //                   MaterialButton(
                //                     shape: OutlineInputBorder(
                //                         borderRadius: BorderRadius.circular(5),
                //                         borderSide: BorderSide(
                //                             color: Constants.pimaryColor
                //                         )
                //                     ),
                //                     onPressed: () {
                //                       workingSetController.trainData['kms']=workingSetController.kmsController.text;
                //                       Get.back();
                //                       Get.snackbar("Updated!", "Changes Done",);
                //                     },
                //                     height: 35,
                //                     minWidth: 70,
                //
                //                     color: Constants.pimaryColor,
                //                     child: Center(
                //                       child: Text(
                //                         "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                //                           color: Constants.whiteColor,
                //                           fontSize: 14,
                //                           fontWeight: FontWeight.w400
                //                       ),
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         );
                //       },
                //     child: Container(
                //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                //         decoration: BoxDecoration(
                //             // borderRadius: BorderRadius.circular(5),
                //             color: Constants.whiteColor,
                //             border: Border(
                //                 right: BorderSide(
                //               color: Colors.grey.shade400,
                //             ))),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "KMS",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //                 color: Constants.pimaryColor,
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             Text(
                //               "${workingSetController.trainData['kms']}",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //                 color: Colors.grey,
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             // Text("CSMT",
                //             //   textScaler: TextScaler.linear(1),style: TextStyle(
                //             //     color: Colors.teal,
                //             //     fontSize: 13,
                //             //     fontWeight: FontWeight.w600,
                //             //   ),
                //             // ),
                //           ],
                //         )),
                //   ),
                //   InkWell(
                //     onTap: () {
                //       workingSetController.ndhController.text=workingSetController.trainData['ndh'];
                //       Get.dialog(
                //         AlertDialog.adaptive(
                //           backgroundColor: Colors.white,
                //           contentPadding: EdgeInsets.symmetric(horizontal: 10),
                //           shape: OutlineInputBorder(
                //               borderSide: BorderSide(color: Colors.white),
                //               borderRadius: BorderRadius.circular(8)
                //           ),
                //           titlePadding: EdgeInsets.all(15),
                //           title: Container(
                //             width: double.infinity,
                //             height: 35,
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(5),
                //                 color: Constants.secondaryColor
                //             ),
                //             child: Center(
                //               child: Text("Edit Value",
                //                 textScaler: TextScaler.linear(1),style: TextStyle(
                //                   color: Constants.whiteColor,
                //                   fontSize: 16,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           content: Container(
                //             height: 70,
                //             child: Column(
                //               children: [
                //                 CommonTextFormField(labletext: "NDH", keyboardTypes: TextInputType.text, controller: workingSetController.ndhController),
                //                 SizedBox(height: 10,),
                //                 // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                //               ],
                //             ),
                //           ),
                //           actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                //           actions: [
                //             Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 MaterialButton(
                //                   shape: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                       borderSide: BorderSide(
                //                           color: Constants.secondaryColor
                //                       )
                //                   ),
                //                   padding: EdgeInsets.symmetric(horizontal: 18),
                //                   onPressed: () {
                //                     Get.back();
                //                   },
                //                   height: 35,
                //                   minWidth: 78,
                //
                //                   color: Constants.secondaryColor,
                //                   child: Center(
                //                     child:Text(
                //                       "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                //                         color: Constants.whiteColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400
                //                     ),
                //                     ),
                //                   ),
                //                 ),
                //                 SizedBox(width: 28,),
                //                 MaterialButton(
                //                   shape: OutlineInputBorder(
                //                       borderRadius: BorderRadius.circular(5),
                //                       borderSide: BorderSide(
                //                           color: Constants.pimaryColor
                //                       )
                //                   ),
                //                   onPressed: () {
                //                    workingSetController.trainData['ndh']=workingSetController.ndhController.text;
                //                     Get.back();
                //                     Get.snackbar("Updated!", "Changes Done",);
                //                   },
                //                   height: 35,
                //                   minWidth: 70,
                //
                //                   color: Constants.pimaryColor,
                //                   child: Center(
                //                     child: Text(
                //                       "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                //                         color: Constants.whiteColor,
                //                         fontSize: 14,
                //                         fontWeight: FontWeight.w400
                //                     ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //     child: Container(
                //         padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                //         decoration: BoxDecoration(
                //             // borderRadius: BorderRadius.circular(5),
                //             color: Constants.whiteColor,
                //             border: Border(
                //                 right: BorderSide(
                //               color: Colors.grey.shade400,
                //             ))),
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.start,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text(
                //               "NDH",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //                 color: Constants.pimaryColor,
                //                 fontSize: 13,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             Text(
                //               "${workingSetController.trainData['ndh']}",
                //               textScaler: TextScaler.linear(1),style: TextStyle(
                //                 color: Colors.grey,
                //                 fontSize: 14,
                //                 fontWeight: FontWeight.w600,
                //               ),
                //             ),
                //             // Text("CSMT",
                //             //   textScaler: TextScaler.linear(1),style: TextStyle(
                //             //     color: Colors.teal,
                //             //     fontSize: 13,
                //             //     fontWeight: FontWeight.w600,
                //             //   ),
                //             // ),
                //           ],
                //         )),
                //   ),
                //   Container(
                //       padding: EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                //       decoration: BoxDecoration(
                //         // borderRadius: BorderRadius.circular(5),
                //         color: Constants.whiteColor,
                //       ),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "INFO",
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //               color: Constants.pimaryColor,
                //               fontSize: 13,
                //               fontWeight: FontWeight.w600,
                //             ),
                //           ),
                //           Icon(
                //             Icons.picture_as_pdf,
                //             color: Constants.secondaryColor,
                //             size: 20,
                //           ),
                //         ],
                //       )),
                // ]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "click on any text to edit",
                textScaler: TextScaler.linear(1),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "TRAIN NO",
                      textScaler: TextScaler.linear(1),
                      style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "START",
                      textScaler: TextScaler.linear(1),
                      style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "CHANGE",
                      textScaler: TextScaler.linear(1),
                      style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "R/T|R/B",
                      textScaler: TextScaler.linear(1),
                      style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 380,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8),
                // padding: EdgeInsets.symmetric(horizontal: 20,vertical:2),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]),
                child: ListView.builder(
                  itemCount: workingSetController.trainSetData.length,
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    var trainset = workingSetController.trainSetData[index];
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Column(
                          children: [
                            Table(
                              columnWidths: {
                                0: FlexColumnWidth(1),
                                1: FlexColumnWidth(3),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(
                                      verticalAlignment:
                                          TableCellVerticalAlignment.fill,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 6),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5)),
                                            color: Constants.whiteColor,
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey.shade300,
                                              ),
                                              bottom: BorderSide(
                                                color: Colors.grey.shade300,
                                              ),
                                            )),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${trainset['type']}",
                                              textScaler: TextScaler.linear(1),
                                              style: TextStyle(
                                                color: index == 2
                                                    ? Colors.red
                                                    : Colors.teal,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "${trainset['train_no']}",
                                              textScaler: TextScaler.linear(1),
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    TableCell(
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    workingSetController
                                                        .startStationController
                                                        .text = trainset[
                                                            'start_station']
                                                        .toString();
                                                    workingSetController
                                                            .startTimeController
                                                            .text =
                                                        trainset['start_time']
                                                            .toString();
                                                    Get.dialog(
                                                      AlertDialog.adaptive(
                                                        backgroundColor:
                                                            Colors.white,
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                        shape: OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        titlePadding:
                                                            EdgeInsets.all(15),
                                                        title: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: Constants
                                                                  .secondaryColor),
                                                          child: Center(
                                                            child: Text(
                                                              "Edit Value",
                                                              textScaler:
                                                                  TextScaler
                                                                      .linear(
                                                                          1),
                                                              style: TextStyle(
                                                                color: Constants
                                                                    .whiteColor,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        content: Container(
                                                          height: 110,
                                                          child: Column(
                                                            children: [
                                                              CommonTextFormField(
                                                                  labletext:
                                                                      "Start Station",
                                                                  keyboardTypes:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      workingSetController
                                                                          .startStationController),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              CommonTextFormField(
                                                                labletext:
                                                                    "Start Time",
                                                                keyboardTypes:
                                                                    TextInputType
                                                                        .name,
                                                                controller:
                                                                    workingSetController
                                                                        .startTimeController,
                                                                input:
                                                                    timeMaskFormatter,
                                                                icons: InkWell(
                                                                  onTap: () {
                                                                    workingSetController
                                                                        .selectTimeStart(
                                                                            context);
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            8.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .watch_later_outlined,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actionsPadding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                right: 15,
                                                                bottom: 10),
                                                        actions: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              MaterialButton(
                                                                shape: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Constants.secondaryColor)),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            18),
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                height: 35,
                                                                minWidth: 78,
                                                                color: Constants
                                                                    .secondaryColor,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Cancel",
                                                                    textScaler:
                                                                        TextScaler
                                                                            .linear(1),
                                                                    style: TextStyle(
                                                                        color: Constants
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 28,
                                                              ),
                                                              MaterialButton(
                                                                shape: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Constants.pimaryColor)),
                                                                onPressed: () {
                                                                  final error = validateTime(
                                                                      workingSetController
                                                                          .startTimeController
                                                                          .text);
                                                                  if (error !=
                                                                      null) {
                                                                    ScaffoldMessenger.of(Get
                                                                            .context!)
                                                                        .showSnackBar(
                                                                            SnackBar(
                                                                      content: Text(
                                                                          error),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                    ));
                                                                  } else {
                                                                    Get.back();
                                                                    trainset[
                                                                            'start_station'] =
                                                                        workingSetController
                                                                            .startStationController
                                                                            .text;
                                                                    trainset[
                                                                            'start_time'] =
                                                                        workingSetController
                                                                            .startTimeController
                                                                            .text;
                                                                    workingSetController
                                                                        .updatetrainSetdata(
                                                                            index);
                                                                    // Get.snackbar("Updated!", "Changes Done",);
                                                                  }
                                                                },
                                                                height: 35,
                                                                minWidth: 70,
                                                                color: Constants
                                                                    .pimaryColor,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Update",
                                                                    textScaler:
                                                                        TextScaler
                                                                            .linear(1),
                                                                    style: TextStyle(
                                                                        color: Constants
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 52,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5,
                                                            horizontal: 6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5)),
                                                        color: Constants
                                                            .whiteColor,
                                                        border: Border(
                                                          right: BorderSide(
                                                            color: Colors
                                                                .grey.shade300,
                                                          ),
                                                          bottom: BorderSide(
                                                            color: Colors
                                                                .grey.shade300,
                                                          ),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${trainset['start_station']}",
                                                          textScaler:
                                                              TextScaler.linear(
                                                                  1),
                                                          style: TextStyle(
                                                            color: index == 2
                                                                ? Colors.red
                                                                : Colors.teal,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${trainset['start_time']}",
                                                          textScaler:
                                                              TextScaler.linear(
                                                                  1),
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    workingSetController
                                                        .changeStationController
                                                        .text = trainset[
                                                            'change_station']
                                                        .toString();
                                                    workingSetController
                                                        .changeTimeController
                                                        .text = trainset[
                                                            'change_time']
                                                        .toString();
                                                    Get.dialog(
                                                      AlertDialog.adaptive(
                                                        backgroundColor:
                                                            Colors.white,
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                        shape: OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        titlePadding:
                                                            EdgeInsets.all(15),
                                                        title: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: Constants
                                                                  .secondaryColor),
                                                          child: Center(
                                                            child: Text(
                                                              "Edit Value",
                                                              textScaler:
                                                                  TextScaler
                                                                      .linear(
                                                                          1),
                                                              style: TextStyle(
                                                                color: Constants
                                                                    .whiteColor,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        content: Container(
                                                          height: 110,
                                                          child: Column(
                                                            children: [
                                                              CommonTextFormField(
                                                                  labletext:
                                                                      "Change Station",
                                                                  keyboardTypes:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      workingSetController
                                                                          .changeStationController),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              CommonTextFormField(
                                                                labletext:
                                                                    "Change Time",
                                                                keyboardTypes:
                                                                    TextInputType
                                                                        .name,
                                                                controller:
                                                                    workingSetController
                                                                        .changeTimeController,
                                                                input:
                                                                    timeMaskFormatter,
                                                                icons: InkWell(
                                                                  onTap: () {
                                                                    workingSetController
                                                                        .selectTimeChange(
                                                                            context);
                                                                  },
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            8.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .watch_later_outlined,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        actionsPadding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                right: 15,
                                                                bottom: 10),
                                                        actions: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              MaterialButton(
                                                                shape: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Constants.secondaryColor)),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            18),
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                height: 35,
                                                                minWidth: 78,
                                                                color: Constants
                                                                    .secondaryColor,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Cancel",
                                                                    textScaler:
                                                                        TextScaler
                                                                            .linear(1),
                                                                    style: TextStyle(
                                                                        color: Constants
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 28,
                                                              ),
                                                              MaterialButton(
                                                                shape: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Constants.pimaryColor)),
                                                                onPressed: () {
                                                                  final error = validateTime(
                                                                      workingSetController
                                                                          .changeTimeController
                                                                          .text);
                                                                  if (error !=
                                                                      null) {
                                                                    ScaffoldMessenger.of(Get
                                                                            .context!)
                                                                        .showSnackBar(
                                                                            SnackBar(
                                                                      content: Text(
                                                                          error),
                                                                      backgroundColor:
                                                                          Colors
                                                                              .red,
                                                                    ));
                                                                  } else {
                                                                    Get.back();
                                                                    trainset[
                                                                            'change_station'] =
                                                                        workingSetController
                                                                            .changeStationController
                                                                            .text;
                                                                    trainset[
                                                                            'change_time'] =
                                                                        workingSetController
                                                                            .changeTimeController
                                                                            .text;
                                                                    workingSetController
                                                                        .updatetrainSetdata(
                                                                            index);
                                                                    // Get.snackbar("Updated!", "Changes Done",);
                                                                  }
                                                                },
                                                                height: 35,
                                                                minWidth: 70,
                                                                color: Constants
                                                                    .pimaryColor,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Update",
                                                                    textScaler:
                                                                        TextScaler
                                                                            .linear(1),
                                                                    style: TextStyle(
                                                                        color: Constants
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 52,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5,
                                                            horizontal: 6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5)),
                                                        color: Constants
                                                            .whiteColor,
                                                        border: Border(
                                                          right: BorderSide(
                                                            color: Colors
                                                                .grey.shade300,
                                                          ),
                                                          bottom: BorderSide(
                                                            color: Colors
                                                                .grey.shade300,
                                                          ),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${trainset['change_station']}",
                                                          textScaler:
                                                              TextScaler.linear(
                                                                  1),
                                                          style: TextStyle(
                                                            color: index == 2
                                                                ? Colors.red
                                                                : Colors.teal,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        Text(
                                                          "${trainset['change_time']}",
                                                          textScaler:
                                                              TextScaler.linear(
                                                                  1),
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: InkWell(
                                                  onTap: () {
                                                    workingSetController
                                                            .rtrbController
                                                            .text =
                                                        trainset['rt_rb']
                                                            .toString();
                                                    Get.dialog(
                                                      AlertDialog.adaptive(
                                                        backgroundColor:
                                                            Colors.white,
                                                        contentPadding:
                                                            EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        10),
                                                        shape: OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .white),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                        titlePadding:
                                                            EdgeInsets.all(15),
                                                        title: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 35,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              color: Constants
                                                                  .secondaryColor),
                                                          child: Center(
                                                            child: Text(
                                                              "Edit Value",
                                                              textScaler:
                                                                  TextScaler
                                                                      .linear(
                                                                          1),
                                                              style: TextStyle(
                                                                color: Constants
                                                                    .whiteColor,
                                                                fontSize: 16,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        content: Container(
                                                          height: 70,
                                                          child: Column(
                                                            children: [
                                                              CommonTextFormField(
                                                                  labletext:
                                                                      "R/T|R/B",
                                                                  keyboardTypes:
                                                                      TextInputType
                                                                          .text,
                                                                  controller:
                                                                      workingSetController
                                                                          .rtrbController),
                                                              SizedBox(
                                                                height: 10,
                                                              ),
                                                              // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                                                            ],
                                                          ),
                                                        ),
                                                        actionsPadding:
                                                            EdgeInsets.only(
                                                                left: 15,
                                                                right: 15,
                                                                bottom: 10),
                                                        actions: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              MaterialButton(
                                                                shape: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Constants.secondaryColor)),
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            18),
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                height: 35,
                                                                minWidth: 78,
                                                                color: Constants
                                                                    .secondaryColor,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Cancel",
                                                                    textScaler:
                                                                        TextScaler
                                                                            .linear(1),
                                                                    style: TextStyle(
                                                                        color: Constants
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 28,
                                                              ),
                                                              MaterialButton(
                                                                shape: OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Constants.pimaryColor)),
                                                                onPressed: () {
                                                                  trainset[
                                                                          'rt_rb'] =
                                                                      workingSetController
                                                                          .rtrbController
                                                                          .text;
                                                                  Get.back();
                                                                  workingSetController
                                                                      .updatetrainSetdata(
                                                                          index);
                                                                  // Get.snackbar("Updated!", "Changes Done",);
                                                                },
                                                                height: 35,
                                                                minWidth: 70,
                                                                color: Constants
                                                                    .pimaryColor,
                                                                child: Center(
                                                                  child: Text(
                                                                    "Update",
                                                                    textScaler:
                                                                        TextScaler
                                                                            .linear(1),
                                                                    style: TextStyle(
                                                                        color: Constants
                                                                            .whiteColor,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    height: 52,
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 5,
                                                            horizontal: 6),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        5)),
                                                        color: Constants
                                                            .whiteColor,
                                                        border: Border(
                                                          right: BorderSide(
                                                            color: Colors
                                                                .grey.shade300,
                                                          ),
                                                          bottom: BorderSide(
                                                            color: Colors
                                                                .grey.shade300,
                                                          ),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          "${trainset['rt_rb']}",
                                                          textScaler:
                                                              TextScaler.linear(
                                                                  1),
                                                          style: TextStyle(
                                                            color: index == 2
                                                                ? Colors.red
                                                                : Colors.teal,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              workingSetController
                                                      .stationNameController
                                                      .text =
                                                  trainset['station_name']
                                                      .toString();
                                              Get.dialog(
                                                AlertDialog.adaptive(
                                                  backgroundColor: Colors.white,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 10),
                                                  shape: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  titlePadding:
                                                      EdgeInsets.all(15),
                                                  title: Container(
                                                    width: double.infinity,
                                                    height: 35,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: Constants
                                                            .secondaryColor),
                                                    child: Center(
                                                      child: Text(
                                                        "Edit Value",
                                                        textScaler:
                                                            TextScaler.linear(
                                                                1),
                                                        style: TextStyle(
                                                          color: Constants
                                                              .whiteColor,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  content: Container(
                                                    height: 70,
                                                    child: Column(
                                                      children: [
                                                        CommonTextFormField(
                                                            labletext:
                                                                "Staion Name",
                                                            keyboardTypes:
                                                                TextInputType
                                                                    .text,
                                                            controller:
                                                                workingSetController
                                                                    .stationNameController),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                                                      ],
                                                    ),
                                                  ),
                                                  actionsPadding:
                                                      EdgeInsets.only(
                                                          left: 15,
                                                          right: 15,
                                                          bottom: 10),
                                                  actions: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        MaterialButton(
                                                          shape: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide: BorderSide(
                                                                  color: Constants
                                                                      .secondaryColor)),
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      18),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          height: 35,
                                                          minWidth: 78,
                                                          color: Constants
                                                              .secondaryColor,
                                                          child: Center(
                                                            child: Text(
                                                              "Cancel",
                                                              textScaler:
                                                                  TextScaler
                                                                      .linear(
                                                                          1),
                                                              style: TextStyle(
                                                                  color: Constants
                                                                      .whiteColor,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 28,
                                                        ),
                                                        MaterialButton(
                                                          shape: OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              borderSide: BorderSide(
                                                                  color: Constants
                                                                      .pimaryColor)),
                                                          onPressed: () {
                                                            trainset[
                                                                    'station_name'] =
                                                                workingSetController
                                                                    .stationNameController
                                                                    .text;
                                                            Get.back();
                                                            workingSetController
                                                                .updatetrainSetdata(
                                                                    index);
                                                            // Get.snackbar("Updated!", "Changes Done",);
                                                          },
                                                          height: 35,
                                                          minWidth: 70,
                                                          color: Constants
                                                              .pimaryColor,
                                                          child: Center(
                                                            child: Text(
                                                              "Update",
                                                              textScaler:
                                                                  TextScaler
                                                                      .linear(
                                                                          1),
                                                              style: TextStyle(
                                                                  color: Constants
                                                                      .whiteColor,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5, horizontal: 6),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  5)),
                                                  color: Constants.whiteColor,
                                                  border: Border(
                                                    right: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                    bottom: BorderSide(
                                                      color:
                                                          Colors.grey.shade300,
                                                    ),
                                                  )),
                                              child: Center(
                                                  child: Text(
                                                '${trainset['station_name']}',
                                                textScaler:
                                                    TextScaler.linear(1),
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13),
                                              )),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                workingSetController.remarksController.text =
                                    trainset['remark'].toString();
                                Get.dialog(
                                  AlertDialog.adaptive(
                                    backgroundColor: Colors.white,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    shape: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(8)),
                                    titlePadding: EdgeInsets.all(15),
                                    title: Container(
                                      width: double.infinity,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Constants.secondaryColor),
                                      child: Center(
                                        child: Text(
                                          "Edit Value",
                                          textScaler: TextScaler.linear(1),
                                          style: TextStyle(
                                            color: Constants.whiteColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    content: Container(
                                      height: 70,
                                      child: Column(
                                        children: [
                                          CommonTextFormField(
                                              labletext: "Remarks",
                                              keyboardTypes: TextInputType.text,
                                              controller: workingSetController
                                                  .remarksController),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                                        ],
                                      ),
                                    ),
                                    actionsPadding: EdgeInsets.only(
                                        left: 15, right: 15, bottom: 10),
                                    actions: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          MaterialButton(
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color: Constants
                                                        .secondaryColor)),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 18),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            height: 35,
                                            minWidth: 78,
                                            color: Constants.secondaryColor,
                                            child: Center(
                                              child: Text(
                                                "Cancel",
                                                textScaler:
                                                    TextScaler.linear(1),
                                                style: TextStyle(
                                                    color: Constants.whiteColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 28,
                                          ),
                                          MaterialButton(
                                            shape: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                borderSide: BorderSide(
                                                    color:
                                                        Constants.pimaryColor)),
                                            onPressed: () {
                                              trainset['remark'] =
                                                  workingSetController
                                                      .remarksController.text;
                                              Get.back();
                                              workingSetController
                                                  .updatetrainSetdata(index);
                                              // Get.snackbar("Updated!", "Changes Done",);
                                            },
                                            height: 35,
                                            minWidth: 70,
                                            color: Constants.pimaryColor,
                                            child: Center(
                                              child: Text(
                                                "Update",
                                                textScaler:
                                                    TextScaler.linear(1),
                                                style: TextStyle(
                                                    color: Constants.whiteColor,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 6),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5)),
                                    color: Constants.whiteColor,
                                    border: Border(
                                      right: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                      bottom: BorderSide(
                                        color: Colors.grey.shade300,
                                      ),
                                    )),
                                child: Center(
                                    child: Text(
                                  '${trainset['remark']}',
                                  textScaler: TextScaler.linear(1),
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                )),
                              ),
                            ),
                            Table(
                              children: [
                                TableRow(children: [
                                  // TableCell(child:Container(
                                  //   padding: EdgeInsets.symmetric(
                                  //       vertical: 8, horizontal: 6),
                                  //   decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.only(
                                  //           topLeft: Radius.circular(5)),
                                  //       color: Constants.whiteColor,
                                  //       border: Border(
                                  //         right: BorderSide(
                                  //           color: Colors.grey.shade300,
                                  //         ),
                                  //         bottom: BorderSide(
                                  //           color: Colors.grey.shade300,
                                  //         ),
                                  //       )),
                                  //   child: Center(
                                  //       child: Text(
                                  //         'MM/GD Name',textScaler: TextScaler.linear(1),style: TextStyle(
                                  //           color: Colors.grey,
                                  //           fontSize: 13
                                  //       ),)),
                                  // ),),
                                  TableCell(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 6),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(5)),
                                          color: Constants.whiteColor,
                                          border: Border(
                                            right: BorderSide(
                                              color: Colors.grey.shade300,
                                            ),
                                            bottom: BorderSide(
                                              color: Colors.grey.shade300,
                                            ),
                                          )),
                                      child: Center(
                                          child: Text(
                                        'Unit',
                                        textScaler: TextScaler.linear(1),
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 13),
                                      )),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            Table(
                              children: [
                                TableRow(children: [
                                  TableCell(
                                    child: InkWell(
                                      onTap: () {
                                        workingSetController
                                                .trainTypeController.text =
                                            trainset['train_type'].toString();
                                        Get.dialog(
                                          AlertDialog.adaptive(
                                            backgroundColor: Colors.white,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            shape: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            titlePadding: EdgeInsets.all(15),
                                            title: Container(
                                              width: double.infinity,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color:
                                                      Constants.secondaryColor),
                                              child: Center(
                                                child: Text(
                                                  "Edit Value",
                                                  textScaler:
                                                      TextScaler.linear(1),
                                                  style: TextStyle(
                                                    color: Constants.whiteColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            content: Container(
                                              height: 70,
                                              child: Column(
                                                children: [
                                                  CommonTextFormField(
                                                      labletext: "Train Type",
                                                      keyboardTypes:
                                                          TextInputType.text,
                                                      controller:
                                                          workingSetController
                                                              .trainTypeController),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                                                ],
                                              ),
                                            ),
                                            actionsPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                bottom: 10),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  MaterialButton(
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Constants
                                                                .secondaryColor)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 18),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    height: 35,
                                                    minWidth: 78,
                                                    color: Constants
                                                        .secondaryColor,
                                                    child: Center(
                                                      child: Text(
                                                        "Cancel",
                                                        textScaler:
                                                            TextScaler.linear(
                                                                1),
                                                        style: TextStyle(
                                                            color: Constants
                                                                .whiteColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 28,
                                                  ),
                                                  MaterialButton(
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Constants
                                                                .pimaryColor)),
                                                    onPressed: () {
                                                      trainset['train_type'] =
                                                          workingSetController
                                                              .trainTypeController
                                                              .text;
                                                      Get.back();
                                                      workingSetController
                                                          .updatetrainSetdata(
                                                              index);
                                                      // Get.snackbar("Updated!", "Changes Done",);
                                                    },
                                                    height: 35,
                                                    minWidth: 70,
                                                    color:
                                                        Constants.pimaryColor,
                                                    child: Center(
                                                      child: Text(
                                                        "Update",
                                                        textScaler:
                                                            TextScaler.linear(
                                                                1),
                                                        style: TextStyle(
                                                            color: Constants
                                                                .whiteColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 6),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5)),
                                            color: Constants.whiteColor,
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey.shade300,
                                              ),
                                              bottom: BorderSide(
                                                // width: index==1?1:3,
                                                width: 3,
                                                color: Colors.grey.shade300,
                                              ),
                                            )),
                                        child: Center(
                                            child: Text(
                                          '${trainset['train_type']}',
                                          textScaler: TextScaler.linear(1),
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                        )),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: InkWell(
                                      onTap: () {
                                        workingSetController.carController
                                            .text = trainset['car'].toString();
                                        Get.dialog(
                                          AlertDialog.adaptive(
                                            backgroundColor: Colors.white,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            shape: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            titlePadding: EdgeInsets.all(15),
                                            title: Container(
                                              width: double.infinity,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color:
                                                      Constants.secondaryColor),
                                              child: Center(
                                                child: Text(
                                                  "Edit Value",
                                                  textScaler:
                                                      TextScaler.linear(1),
                                                  style: TextStyle(
                                                    color: Constants.whiteColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            content: Container(
                                              height: 70,
                                              child: Column(
                                                children: [
                                                  CommonTextFormField(
                                                      labletext: "Car",
                                                      keyboardTypes:
                                                          TextInputType.text,
                                                      controller:
                                                          workingSetController
                                                              .carController),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                                                ],
                                              ),
                                            ),
                                            actionsPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                bottom: 10),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  MaterialButton(
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Constants
                                                                .secondaryColor)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 18),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    height: 35,
                                                    minWidth: 78,
                                                    color: Constants
                                                        .secondaryColor,
                                                    child: Center(
                                                      child: Text(
                                                        "Cancel",
                                                        textScaler:
                                                            TextScaler.linear(
                                                                1),
                                                        style: TextStyle(
                                                            color: Constants
                                                                .whiteColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 28,
                                                  ),
                                                  MaterialButton(
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Constants
                                                                .pimaryColor)),
                                                    onPressed: () {
                                                      trainset['car'] =
                                                          workingSetController
                                                              .carController
                                                              .text;
                                                      Get.back();
                                                      workingSetController
                                                          .updatetrainSetdata(
                                                              index);
                                                      // Get.snackbar("Updated!", "Changes Done",);
                                                    },
                                                    height: 35,
                                                    minWidth: 70,
                                                    color:
                                                        Constants.pimaryColor,
                                                    child: Center(
                                                      child: Text(
                                                        "Update",
                                                        textScaler:
                                                            TextScaler.linear(
                                                                1),
                                                        style: TextStyle(
                                                            color: Constants
                                                                .whiteColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 6),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5)),
                                            color: Constants.whiteColor,
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey.shade300,
                                              ),
                                              bottom: BorderSide(
                                                // width: index==1?1:3,
                                                width: 3,
                                                color: Colors.grey.shade300,
                                              ),
                                            )),
                                        child: Center(
                                            child: Text(
                                          '${trainset['car']}',
                                          textScaler: TextScaler.linear(1),
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                        )),
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: InkWell(
                                      onTap: () {
                                        workingSetController.apfController
                                            .text = trainset['a_pf'].toString();
                                        Get.dialog(
                                          AlertDialog.adaptive(
                                            backgroundColor: Colors.white,
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                            shape: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            titlePadding: EdgeInsets.all(15),
                                            title: Container(
                                              width: double.infinity,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color:
                                                      Constants.secondaryColor),
                                              child: Center(
                                                child: Text(
                                                  "Edit Value",
                                                  textScaler:
                                                      TextScaler.linear(1),
                                                  style: TextStyle(
                                                    color: Constants.whiteColor,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            content: Container(
                                              height: 70,
                                              child: Column(
                                                children: [
                                                  CommonTextFormField(
                                                      labletext: "A PF",
                                                      keyboardTypes:
                                                          TextInputType.text,
                                                      controller:
                                                          workingSetController
                                                              .apfController),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                                                ],
                                              ),
                                            ),
                                            actionsPadding: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                bottom: 10),
                                            actions: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  MaterialButton(
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Constants
                                                                .secondaryColor)),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 18),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    height: 35,
                                                    minWidth: 78,
                                                    color: Constants
                                                        .secondaryColor,
                                                    child: Center(
                                                      child: Text(
                                                        "Cancel",
                                                        textScaler:
                                                            TextScaler.linear(
                                                                1),
                                                        style: TextStyle(
                                                            color: Constants
                                                                .whiteColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 28,
                                                  ),
                                                  MaterialButton(
                                                    shape: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        borderSide: BorderSide(
                                                            color: Constants
                                                                .pimaryColor)),
                                                    onPressed: () {
                                                      trainset['a_pf'] =
                                                          workingSetController
                                                              .apfController
                                                              .text;
                                                      Get.back();
                                                      workingSetController
                                                          .updatetrainSetdata(
                                                              index);
                                                      // Get.snackbar("Updated!", "Changes Done",);
                                                    },
                                                    height: 35,
                                                    minWidth: 70,
                                                    color:
                                                        Constants.pimaryColor,
                                                    child: Center(
                                                      child: Text(
                                                        "Update",
                                                        textScaler:
                                                            TextScaler.linear(
                                                                1),
                                                        style: TextStyle(
                                                            color: Constants
                                                                .whiteColor,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 8, horizontal: 6),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(5)),
                                            color: Constants.whiteColor,
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.grey.shade300,
                                              ),
                                              bottom: BorderSide(
                                                // width: index==1?1:3,
                                                width: 3,
                                                color: Colors.grey.shade300,
                                              ),
                                            )),
                                        child: Center(
                                            child: Text(
                                          '${trainset['a_pf']}',
                                          textScaler: TextScaler.linear(1),
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 13),
                                        )),
                                      ),
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            // index==1?Container(
                            //   padding: EdgeInsets.symmetric(
                            //       vertical: 8, horizontal: 6),
                            //   decoration: BoxDecoration(
                            //       borderRadius: BorderRadius.only(
                            //           topLeft: Radius.circular(5)),
                            //       color: Constants.whiteColor,
                            //       border: Border(
                            //         right: BorderSide(
                            //           color: Colors.grey.shade300,
                            //         ),
                            //         bottom: BorderSide(
                            //           width: 3,
                            //           color: Colors.grey.shade300,
                            //         ),
                            //       )),
                            //   child: Center(
                            //       child: Text(
                            //         'Testing',textScaler: TextScaler.linear(1),style: TextStyle(
                            //           color: Colors.grey,
                            //           fontSize: 13
                            //       ),)),
                            // ):SizedBox(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 8),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "SUNDAY/HOLIDAY:",
                      textScaler: TextScaler.linear(1),
                      style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        workingSetController.holidayController.text =
                            workingSetController.trainData['holiday'];
                        Get.dialog(
                          AlertDialog.adaptive(
                            backgroundColor: Colors.white,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(8)),
                            titlePadding: EdgeInsets.all(15),
                            title: Container(
                              width: double.infinity,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Constants.secondaryColor),
                              child: Center(
                                child: Text(
                                  "Edit Value",
                                  textScaler: TextScaler.linear(1),
                                  style: TextStyle(
                                    color: Constants.whiteColor,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            content: Container(
                              height: 70,
                              child: Column(
                                children: [
                                  CommonTextFormField(
                                      labletext: "Holiday",
                                      keyboardTypes: TextInputType.text,
                                      controller: workingSetController
                                          .holidayController),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                                ],
                              ),
                            ),
                            actionsPadding: EdgeInsets.only(
                                left: 15, right: 15, bottom: 10),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Constants.secondaryColor)),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 18),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    height: 35,
                                    minWidth: 78,
                                    color: Constants.secondaryColor,
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        textScaler: TextScaler.linear(1),
                                        style: TextStyle(
                                            color: Constants.whiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 28,
                                  ),
                                  MaterialButton(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Constants.pimaryColor)),
                                    onPressed: () {
                                      workingSetController
                                              .trainData['holiday'] =
                                          workingSetController
                                              .holidayController.text;
                                      Get.back();
                                      workingSetController.updatetraindata(
                                          workingSetController.trainData['id']);
                                      // Get.snackbar("Updated!", "Changes Done",);
                                    },
                                    height: 35,
                                    minWidth: 70,
                                    color: Constants.pimaryColor,
                                    child: Center(
                                      child: Text(
                                        "Update",
                                        textScaler: TextScaler.linear(1),
                                        style: TextStyle(
                                            color: Constants.whiteColor,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                      child: Container(
                        width: 130,
                        child: Text(
                          "${workingSetController.trainData['holiday']}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          textScaler: TextScaler.linear(1),
                          style: TextStyle(
                            color: Colors.teal,
                            height: 0.98,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                    width: 250,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          )
                        ]),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        child: Obx(() => Center(
                              child: DropdownButton(
                                items: workingSetController.DutyType.map<
                                    DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      textScaler: TextScaler.linear(1),
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF000000),
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  workingSetController
                                      .setDropdownValue(value.toString());
                                },
                                value: workingSetController.dropdownValue.value,
                                icon: Icon(
                                  Icons.arrow_drop_down,
                                  size: 25,
                                ),
                                iconSize: 16,
                                elevation: 16,
                                isExpanded: true,
                                underline: Container(),
                              ),
                            )))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:
                            BorderSide(color: Constants.secondaryColor)),
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    onPressed: () {
                      workingSetController.openBottomSheet(context);
                    },
                    height: 32,
                    minWidth: 78,
                    color: Constants.secondaryColor,
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.image,
                            color: Constants.whiteColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            workingSetController.selectedImage.value == ''
                                ? "Upload"
                                : 'Uploaded',
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor)),
                    onPressed: () {
                      Get.dialog(
                        AlertDialog.adaptive(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)),
                          titlePadding: EdgeInsets.all(15),
                          title: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constants.secondaryColor),
                            child: Center(
                              child: Text(
                                "Duty Records",
                                textScaler: TextScaler.linear(1),
                                style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          content: Container(
                            height: 110,
                            child: Column(
                              children: [
                                CommonTextFormField(
                                    labletext: "Notes",
                                    maxline: 4,
                                    keyboardTypes: TextInputType.text,
                                    controller:
                                        workingSetController.notesController),
                                SizedBox(
                                  height: 10,
                                ),
                                // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                              ],
                            ),
                          ),
                          actionsPadding:
                              EdgeInsets.only(left: 15, right: 15, bottom: 10),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.secondaryColor)),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  height: 35,
                                  minWidth: 78,
                                  color: Constants.secondaryColor,
                                  child: Center(
                                    child: Text(
                                      "Cancel",
                                      textScaler: TextScaler.linear(1),
                                      style: TextStyle(
                                          color: Constants.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 28,
                                ),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.pimaryColor)),
                                  onPressed: () {
                                    workingSetController.trainData['note'] =
                                        workingSetController
                                            .notesController.text;
                                    Get.back();
                                    workingSetController.AddDuty();
                                    // Get.snackbar("Updated!", "Changes Done",);
                                  },
                                  height: 35,
                                  minWidth: 70,
                                  color: Constants.pimaryColor,
                                  child: Center(
                                    child: Text(
                                      "Add Record",
                                      textScaler: TextScaler.linear(1),
                                      style: TextStyle(
                                          color: Constants.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    height: 32,
                    minWidth: 70,
                    color: Constants.pimaryColor,
                    child: Center(
                      child: Row(
                        children: [
                          Icon(
                            Icons.add,
                            color: Constants.whiteColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Add Duty",
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
