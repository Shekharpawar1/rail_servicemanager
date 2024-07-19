import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serviceman/app/modules/DutyRecords/views/MyDutyDetails/generateRecords.dart';

import '../../../../utils/Constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/duty_records_controller.dart';

class DutyRecordsView extends GetView<DutyRecordsController> {
   DutyRecordsView({Key? key}) : super(key: key);
  DutyRecordsController dutyRecordsController=DutyRecordsController();
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
          textScaler: TextScaler.linear(1),
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
                  SizedBox(width: 5,),
                  Text("Leave",style: TextStyle(
                    fontSize: 14,
                    color: Constants.whiteColor,
                  ),)
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
                  SizedBox(width: 5,),
                  Text("PDF",style: TextStyle(
                    fontSize: 14,
                    color: Constants.whiteColor,
                  ),),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("My Duty:",style: TextStyle(color: Colors.black,
                fontSize: 16,
              ),),
              // Column(
              //   children: [
              //     SizedBox(height: 20,),
              //     Padding(
              //       padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              //       child: Container(
              //         padding: EdgeInsets.symmetric(vertical: 15),
              //         child: TabBar(
              //           padding: EdgeInsets.zero,
              //           controller: dutyRecordsController.tabController,
              //           unselectedLabelStyle: GoogleFonts.inter(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 14
              //           ),
              //           labelStyle: GoogleFonts.inter(
              //               color: Colors.white,
              //               fontWeight: FontWeight.w600,
              //               fontSize: 16
              //           ),
              //           indicatorColor: Colors.transparent,
              //           labelColor: Colors.white,
              //           unselectedLabelColor: Colors.grey,
              //           dividerColor: Colors.transparent,
              //           tabs: [
              //             Container(
              //                 height: 40,width: 120,
              //                 child: Tab(text: 'Upload')),
              //             Container(
              //                 height: 40,width: 120,
              //                 child: Tab(text: 'All', )),
              //             Container(
              //                 height: 40,width: 120,
              //                 child: Tab(text: 'Contact')),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Expanded(
              //       child: TabBarView(
              //         controller: dutyRecordsController.tabController,
              //         children: dutyRecordsController.listingScreens,
              //
              //       ),
              //     ),
              //   ],
              // )
              Container(
                height: 35,
                child:ListView.builder(itemCount:dutyRecordsController.MyDuty.length ,shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context,int index) {
                  return InkWell(
                    onTap: () {
                      dutyRecordsController.setDropValue(dutyRecordsController.MyDuty[index].toString());
                      dutyRecordsController.setValue(index);
                    },
                    child:Obx(()=>Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,),
                      margin: EdgeInsets.only(right:8,top: 5),
                      decoration: BoxDecoration(
                          color:dutyRecordsController.MyDuty[index].toString()==dutyRecordsController.usergroupValue.value? Constants.secondaryColor:Constants.pimaryColor,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                          dutyRecordsController.MyDuty[index].toString(),style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        ),
                      ),
                    )
                    ),
                  );
                },
                ),
              ),
              SizedBox(height: 15,),
              Expanded(
                child: Obx(() => dutyRecordsController.listingScreens[dutyRecordsController.indexed.value]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

