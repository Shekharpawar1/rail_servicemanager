import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:serviceman/app/modules/DutyRecords/views/MyDutyDetails/alltabView.dart';
import 'package:serviceman/app/modules/DutyRecords/views/MyDutyDetails/generateRecords.dart';
import 'package:serviceman/app/modules/DutyRecords/views/MyDutyDetails/leavetabView.dart';

import '../../../../utils/Constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/duty_records_controller.dart';

class DutyRecordsView extends GetView<DutyRecordsController> {
  DutyRecordsView({Key? key}) : super(key: key);
  DutyRecordsController dutyRecordsController = Get.put(DutyRecordsController());
  var timeMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

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
          "Duty Records",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 17),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () {
                Get.toNamed(Routes.Leave_Page);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.add_circle_rounded,
                    size: 25,
                    color: Constants.whiteColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Leave",
                    style: TextStyle(
                      fontSize: 14,
                      color: Constants.whiteColor,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: InkWell(
              onTap: () {
                Get.to(GenerateRecords());
              },
              child: Row(
                children: [
                  Icon(
                    Icons.edit_calendar_rounded,
                    size: 25,
                    color: Constants.whiteColor,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "PDF",
                    style: TextStyle(
                      fontSize: 14,
                      color: Constants.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFF2F2F2),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 140.0),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else if (controller.setsList.isEmpty &&
                    dutyRecordsController.leaveHistory.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 140.0),
                    child: Text('No Record Found'),
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 130,
                      ),
                      Text(
                        "My Duty:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      Container(
                        height: 35,
                        child: ListView.builder(
                          itemCount: controller.MyDuty.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                controller.setDropValue(
                                    controller.MyDuty[index].toString());
                                controller.setValue(index);
                                controller.getsetId(controller
                                    .searchDateController.text
                                    .toString());
                              },
                              child: Obx(() => Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    margin: EdgeInsets.only(right: 8, top: 5),
                                    decoration: BoxDecoration(
                                        color: controller.MyDuty[index]
                                                    .toString() ==
                                                controller.usergroupValue.value
                                            ? Constants.secondaryColor
                                            : Constants.pimaryColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Text(
                                        controller.MyDuty[index].toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  )),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(child: Obx(() {
                        switch (controller.indexed.value) {
                          case 0:
                            return AllDetails();
                          case 1:
                            return LoadParticularDuty();
                          case 2:
                            return EBookDuty();
                          case 3:
                            return PersonalDuty();
                          case 4:
                            return ImportantDuty();
                          case 5:
                            return UnusualDuty();
                          case 6:
                            return OthersDuty();
                          case 7:
                            return Leave();
                          default:
                            return SizedBox();
                        }
                      })),
                    ],
                  );
                }
              }),
            ),
          ),
          Positioned(
              child: Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 5),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Find Duty Records",
                  style: TextStyle(
                      color: Constants.fontColor, fontSize: 18, height: 0.98),
                ),
                Divider(
                  color: Color(0xFFF2F2F2),
                  thickness: 1.1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: TextFormField(
                          cursorColor: Color(0xFF242B42),
                          cursorWidth: 1.5,
                          style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF191A26),
                          ),
                          controller: dutyRecordsController.searchDateController,
                          inputFormatters: [timeMaskFormatter],
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            // contentPadding:
                            //     EdgeInsets.symmetric(horizontal: 10),
                            suffixIcon: InkWell(
                              onTap: () {
                                dutyRecordsController.selectDate(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Icon(
                                  Icons.calendar_today_rounded,
                                ),
                              ),
                            ),
                            labelText: "Enter Date",
                            labelStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Constants.pimaryColor,
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red,width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Constants.pimaryColor, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 38,
                        width: 78,
                        decoration: BoxDecoration(
                            color: Constants.pimaryColor,
                            borderRadius: BorderRadius.circular(5)),
                        child: MaterialButton(
                          onPressed: () {
                            controller.getsetId(controller
                                .searchDateController.text
                                .toString());
                            dutyRecordsController.getLeaveHistory(dutyRecordsController.searchDateController.text);
                            print(
                                "${controller.searchDateController.text.toString()}");
                          },
                          height: 38,
                          minWidth: 78,
                          child: Center(
                            child: Text(
                              "Find",
                              style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
