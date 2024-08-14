import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:serviceman/app/modules/DutyRecords/views/MyDutyDetails/leavetabView.dart';

import '../../../../../utils/Constant.dart';
import '../../controllers/duty_records_controller.dart';

class AllDetails extends StatelessWidget {
  AllDetails({super.key});

  // Get the existing instance of DutyRecordsController
  final DutyRecordsController dutyRecordController = Get.find<DutyRecordsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Display a loading indicator while data is loading
      if (dutyRecordController.isLoading1.value) {
        return Center(child: CircularProgressIndicator());
      }

      return SingleChildScrollView(
        child: Column(
          children: [
          dutyRecordController.leaveHistory.value.isEmpty?SizedBox():Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Text("Leave"),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 280,
                        child: Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dutyRecordController.leaveHistory.length,
                      itemBuilder: (context, index) {
                        var leave = dutyRecordController.leaveHistory[index];
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: Colors.black38, blurRadius: 4, offset: Offset(2, 2))
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Leave",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text.rich(
                                    TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "Date",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ": ",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13,
                                            color: Colors.black,
                                          ),
                                        ),
                                        TextSpan(
                                          text: leave['leave_date'] ?? 'N/A', // Accessing leave_date from the map
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(color: Color(0xFFF2F2F2)),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                        width: context.width*0.65,
                                        child:  Text(
                                            leave['reason'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: Constants.blackColor
                                            )
                                        )),
                                    MaterialButton(
                                      shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(color: Constants.secondaryColor),
                                      ),
                                      onPressed: () {
                                        Get.snackbar(
                                          "Are you sure you want to delete this?",
                                          "This record deleted permanently",
                                          mainButton: TextButton(onPressed:() {
                                            dutyRecordController.deleteLeave( leave['id']);

                                          }, child:Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(5),
                                              color: Constants.secondaryColor,
                                            ),

                                              padding: EdgeInsets.all(8),
                                              child: Text("Yes,Delete",style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),)),),
                                          snackPosition: SnackPosition.TOP,
                                          backgroundColor: Constants.pimaryColor,
                                          colorText: Colors.white,
                                          duration: Duration(seconds: 5),
                                        );
                                        // Add your onPressed functionality here
                                      },
                                      height: 32,
                                      minWidth: 50,
                                      color: Constants.secondaryColor,
                                      child: Center(
                                        child: Icon(Icons.cancel, color: Constants.whiteColor),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            dutyRecordController.loadParticularsDuty.value.isEmpty?SizedBox():Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Text("Load Particular Duty"),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 189,
                        child: Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  LoadParticularDuty()
                ],
              ),
            ),
            SizedBox(height: 10,),
            dutyRecordController.eBooksDuty.value.isEmpty?SizedBox():Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Text("E Books Duty"),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 230,
                        child: Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  EBookDuty()
                ],
              ),
            ),
            SizedBox(height: 10,),
            dutyRecordController.personalDuty.value.isEmpty?SizedBox():Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Text("Personal Duty"),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 230,
                        child: Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  PersonalDuty(),
                ],
              ),
            ),
            SizedBox(height: 10,),
            dutyRecordController.importantDuty.value.isEmpty?SizedBox():Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Text("Important Duty"),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 230,
                        child: Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ImportantDuty(),
                ],
              ),
            ),
            SizedBox(height: 10,),
            dutyRecordController.unusualDuty.value.isEmpty?SizedBox():Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Text("Unusual Duty"),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 230,
                        child: Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  UnusualDuty(),
                ],
              ),
            ),
            SizedBox(height: 10,),
            dutyRecordController.othersDuty.value.isEmpty?SizedBox():Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(height: 10),
                      Text("Others Duty"),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 230,
                        child: Divider(color: Colors.grey.withOpacity(0.5), thickness: 1.1),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  OthersDuty(),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}