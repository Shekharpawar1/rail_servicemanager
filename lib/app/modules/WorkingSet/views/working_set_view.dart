import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serviceman/component/common_textformfield.dart';

import '../../../../utils/Constant.dart';
import '../controllers/working_set_controller.dart';

class WorkingSetView extends GetView<WorkingSetController> {
   WorkingSetView({Key? key}) : super(key: key);
  WorkingSetController workingSetController=WorkingSetController();
  @override
  Widget build(BuildContext context) {
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
            child: Icon(
              Icons.delete_forever_rounded,
              size: 35,
              color: Colors.red,
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
                child: Row(children: [
                  InkWell(
                    onTap: () {
                      Get.dialog(
                        AlertDialog.adaptive(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(8)
                          ),
                          titlePadding: EdgeInsets.all(15),
                          title: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Constants.secondaryColor
                            ),
                            child: Center(
                              child: Text("Edit Value",
                                textScaler: TextScaler.linear(1),style: TextStyle(
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
                                CommonTextFormField(labletext: "SIGN ON", keyboardTypes: TextInputType.number, controller: workingSetController.signOnController),
                                 SizedBox(height: 10,),
                                CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                              ],
                            ),
                          ),
                          actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.secondaryColor
                                      )
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  onPressed: () {
                                   Get.back();
                                  },
                                  height: 35,
                                  minWidth: 78,

                                  color: Constants.secondaryColor,
                                  child: Center(
                                    child:Text(
                                      "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 28,),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.pimaryColor
                                      )
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    Get.snackbar("Updated!", "Changes Done",);
                                  },
                                  height: 35,
                                  minWidth: 70,

                                  color: Constants.pimaryColor,
                                  child: Center(
                                    child: Text(
                                      "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
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
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
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
                            textScaler: TextScaler.linear(1),style: TextStyle(
                              color: Constants.pimaryColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "07:38",
                            textScaler: TextScaler.linear(1),style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "CSMT",
                            textScaler: TextScaler.linear(1),style: TextStyle(
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
                      Get.dialog(
                        AlertDialog.adaptive(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          titlePadding: EdgeInsets.all(15),
                          title: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constants.secondaryColor
                            ),
                            child: Center(
                              child: Text("Edit Value",
                                textScaler: TextScaler.linear(1),style: TextStyle(
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
                                CommonTextFormField(labletext: "SIGN OFF", keyboardTypes: TextInputType.number, controller: workingSetController.signOffController),
                                SizedBox(height: 10,),
                                CommonTextFormField(labletext: "SIGN OFF STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOffStationController),
                              ],
                            ),
                          ),
                          actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.secondaryColor
                                      )
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  height: 35,
                                  minWidth: 78,

                                  color: Constants.secondaryColor,
                                  child: Center(
                                    child:Text(
                                      "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 28,),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.pimaryColor
                                      )
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    Get.snackbar("Updated!", "Changes Done",);
                                  },
                                  height: 35,
                                  minWidth: 70,

                                  color: Constants.pimaryColor,
                                  child: Center(
                                    child: Text(
                                      "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );                    },
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
                              textScaler: TextScaler.linear(1),style: TextStyle(
                                color: Constants.pimaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "14:38",
                              textScaler: TextScaler.linear(1),style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "CSMT",
                              textScaler: TextScaler.linear(1),style: TextStyle(
                                color: Colors.teal,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      Get.dialog(
                        AlertDialog.adaptive(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          titlePadding: EdgeInsets.all(15),
                          title: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constants.secondaryColor
                            ),
                            child: Center(
                              child: Text("Edit Value",
                                textScaler: TextScaler.linear(1),style: TextStyle(
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
                                CommonTextFormField(labletext: "Duty HRS", keyboardTypes: TextInputType.number, controller: workingSetController.dutyhrsController),
                                SizedBox(height: 10,),
                                // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                              ],
                            ),
                          ),
                          actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.secondaryColor
                                      )
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  height: 35,
                                  minWidth: 78,

                                  color: Constants.secondaryColor,
                                  child: Center(
                                    child:Text(
                                      "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 28,),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.pimaryColor
                                      )
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    Get.snackbar("Updated!", "Changes Done",);
                                  },
                                  height: 35,
                                  minWidth: 70,

                                  color: Constants.pimaryColor,
                                  child: Center(
                                    child: Text(
                                      "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
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
                              "DUTY HRS",
                              textScaler: TextScaler.linear(1),style: TextStyle(
                                color: Constants.pimaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "07:45",
                              textScaler: TextScaler.linear(1),style: TextStyle(
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
                        Get.dialog(
                          AlertDialog.adaptive(
                            backgroundColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            shape: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(8)
                            ),
                            titlePadding: EdgeInsets.all(15),
                            title: Container(
                              width: double.infinity,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Constants.secondaryColor
                              ),
                              child: Center(
                                child: Text("Edit Value",
                                  textScaler: TextScaler.linear(1),style: TextStyle(
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
                                  CommonTextFormField(labletext: "KMS", keyboardTypes: TextInputType.number, controller: workingSetController.kmsController),
                                  SizedBox(height: 10,),
                                  // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                                ],
                              ),
                            ),
                            actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  MaterialButton(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Constants.secondaryColor
                                        )
                                    ),
                                    padding: EdgeInsets.symmetric(horizontal: 18),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    height: 35,
                                    minWidth: 78,

                                    color: Constants.secondaryColor,
                                    child: Center(
                                      child:Text(
                                        "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                                          color: Constants.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 28,),
                                  MaterialButton(
                                    shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Constants.pimaryColor
                                        )
                                    ),
                                    onPressed: () {
                                      Get.back();
                                      Get.snackbar("Updated!", "Changes Done",);
                                    },
                                    height: 35,
                                    minWidth: 70,

                                    color: Constants.pimaryColor,
                                    child: Center(
                                      child: Text(
                                        "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                                          color: Constants.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
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
                              textScaler: TextScaler.linear(1),style: TextStyle(
                                color: Constants.pimaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "196",
                              textScaler: TextScaler.linear(1),style: TextStyle(
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
                      Get.dialog(
                        AlertDialog.adaptive(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          titlePadding: EdgeInsets.all(15),
                          title: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constants.secondaryColor
                            ),
                            child: Center(
                              child: Text("Edit Value",
                                textScaler: TextScaler.linear(1),style: TextStyle(
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
                                CommonTextFormField(labletext: "NDH", keyboardTypes: TextInputType.number, controller: workingSetController.ndhController),
                                SizedBox(height: 10,),
                                // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                              ],
                            ),
                          ),
                          actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.secondaryColor
                                      )
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  height: 35,
                                  minWidth: 78,

                                  color: Constants.secondaryColor,
                                  child: Center(
                                    child:Text(
                                      "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 28,),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.pimaryColor
                                      )
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    Get.snackbar("Updated!", "Changes Done",);
                                  },
                                  height: 35,
                                  minWidth: 70,

                                  color: Constants.pimaryColor,
                                  child: Center(
                                    child: Text(
                                      "Update",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
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
                              textScaler: TextScaler.linear(1),style: TextStyle(
                                color: Constants.pimaryColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "00",
                              textScaler: TextScaler.linear(1),style: TextStyle(
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
                            textScaler: TextScaler.linear(1),style: TextStyle(
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
                ]),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "click on any text to edit",
                textScaler: TextScaler.linear(1),style: TextStyle(
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
                      textScaler: TextScaler.linear(1),style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "START",
                      textScaler: TextScaler.linear(1),style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "CHANGE",
                      textScaler: TextScaler.linear(1),style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "R/T|R/B",
                      textScaler: TextScaler.linear(1),style: TextStyle(
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
                  itemCount: 3,
                  // physics: NeverScrollableScrollPhysics(),
                  // shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
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
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "FAST",
                                              textScaler: TextScaler.linear(1),style: TextStyle(
                                                color:index==2 ?Colors.red:Colors.teal,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            Text(
                                              "A 45",
                                              textScaler: TextScaler.linear(1),style: TextStyle(
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
                                                child: Container(
                                                  height: 52,
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
                                                        "CSMT",
                                                        textScaler: TextScaler.linear(1),style: TextStyle(
                                                          color:index==2 ?Colors.red:Colors.teal,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        "17:05",
                                                        textScaler: TextScaler.linear(1),style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 52,
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
                                                        "ABH",
                                                        textScaler: TextScaler.linear(1),style: TextStyle(
                                                          color:index==2 ?Colors.red:Colors.teal,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                      Text(
                                                        "18:23",
                                                        textScaler: TextScaler.linear(1),style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 52,
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
                                                        "R/B-179",
                                                        textScaler: TextScaler.linear(1),style: TextStyle(
                                                          color:index==2 ?Colors.red:Colors.teal,
                                                          fontSize: 14,
                                                          fontWeight: FontWeight.w600,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
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
                                                    'CSMT-DR-TNA',textScaler: TextScaler.linear(1),style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 13
                                                ),)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Container(
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
                                    'Remarks',textScaler: TextScaler.linear(1),style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12
                                  ),)),
                            ),
                            Table(
                              children: [
                                TableRow(
                                  children: [
                                    TableCell(child:Container(
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
                                            'MM/GD Name',textScaler: TextScaler.linear(1),style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13
                                          ),)),
                                    ),),
                                    TableCell(child:Container(
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
                                            'Unit',textScaler: TextScaler.linear(1),style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 13
                                          ),)),
                                    ),),
                                  ]
                                )
                              ],
                            ),
                            Table(
                              children: [
                                TableRow(
                                    children: [
                                      TableCell(child:Container(
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
                                                width: index==1?1:3,
                                                color: Colors.grey.shade300,
                                              ),
                                            )),
                                        child: Center(
                                            child: Text(
                                              'CAB',textScaler: TextScaler.linear(1),style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13
                                            ),)),
                                      ),),
                                      TableCell(child:Container(
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
                                                width: index==1?1:3,
                                                color: Colors.grey.shade300,
                                              ),
                                            )),
                                        child: Center(
                                            child: Text(
                                              '12 CAR',textScaler: TextScaler.linear(1),style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13
                                            ),)),
                                      ),),
                                      TableCell(
                                        child:Container(
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
                                                width: index==1?1:3,
                                                color: Colors.grey.shade300,
                                              ),
                                            )),
                                        child: Center(
                                            child: Text(
                                              'A/PF',textScaler: TextScaler.linear(1),style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 13
                                            ),)),
                                      ),),
                                    ]
                                )
                              ],
                            ),
                            index==1?Container(
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
                                      width: 3,
                                      color: Colors.grey.shade300,
                                    ),
                                  )),
                              child: Center(
                                  child: Text(
                                    'Testing',textScaler: TextScaler.linear(1),style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 13
                                  ),)),
                            ):SizedBox(),
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
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),bottomRight: Radius.circular(5)),
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
                      textScaler: TextScaler.linear(1),style: TextStyle(
                        color: Constants.pimaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 130,
                      child: Text(
                        "C 45 CD,P/NCS FOR PROPER",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textScaler: TextScaler.linear(1),style: TextStyle(
                          color: Colors.teal,
                          height: 0.98,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Center(
                child: Container(
                    width: 250,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          )
                        ]
                    ),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                        child:
                        Obx(()=>Center(
                          child: DropdownButton(
                            items:
                            workingSetController.DutyType
                                .map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      textScaler: TextScaler.linear(1), style: TextStyle(
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
                            value: workingSetController
                                .dropdownValue.value,
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
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Constants.secondaryColor
                        )
                    ),
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
                          Icon(Icons.image,color: Constants.whiteColor,),
                          SizedBox(width: 10,),
                          Text(
                            "Upload",textScaler: TextScaler.linear(1),style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 28,),
                  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Constants.pimaryColor
                        )
                    ),
                    onPressed: () {
                      Get.dialog(
                        AlertDialog.adaptive(
                          backgroundColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10),
                          shape: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          titlePadding: EdgeInsets.all(15),
                          title: Container(
                            width: double.infinity,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Constants.secondaryColor
                            ),
                            child: Center(
                              child: Text("Duty Records",
                                textScaler: TextScaler.linear(1),style: TextStyle(
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
                                CommonTextFormField(labletext: "Notes", maxline: 4,keyboardTypes: TextInputType.number, controller: workingSetController.notesController),
                                SizedBox(height: 10,),
                                // CommonTextFormField(labletext: "SIGN ON STATION", keyboardTypes: TextInputType.name, controller: workingSetController.signOnStationController),
                              ],
                            ),
                          ),
                          actionsPadding: EdgeInsets.only(left: 15,right: 15,bottom: 10),
                          actions: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.secondaryColor
                                      )
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 18),
                                  onPressed: () {
                                    Get.back();
                                  },
                                  height: 35,
                                  minWidth: 78,

                                  color: Constants.secondaryColor,
                                  child: Center(
                                    child:Text(
                                      "Cancel",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 28,),
                                MaterialButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                          color: Constants.pimaryColor
                                      )
                                  ),
                                  onPressed: () {
                                    Get.back();
                                    Get.snackbar("Updated!", "Changes Done",);
                                  },
                                  height: 35,
                                  minWidth: 70,

                                  color: Constants.pimaryColor,
                                  child: Center(
                                    child: Text(
                                      "Add Record",textScaler: TextScaler.linear(1),style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400
                                    ),
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
                          Icon(Icons.add,color: Constants.whiteColor,),
                          SizedBox(width: 5,),
                          Text(
                            "Add Duty",textScaler: TextScaler.linear(1),style: TextStyle(
                              color: Constants.whiteColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400
                          ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 35,),
            ],
          ),
        ),
      ),
    );
  }
}
