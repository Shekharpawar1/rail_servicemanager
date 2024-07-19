import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serviceman/app/routes/app_pages.dart';

import '../../../../utils/Constant.dart';
import '../controllers/working_history_controller.dart';

class WorkingHistoryView extends GetView<WorkingHistoryController> {
  const WorkingHistoryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,),
        ),
        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Text("Working History",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        margin: EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return  GestureDetector(
              onTap: () {
                Get.toNamed(Routes.WORKING_SET);
              },
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 100,
                          child: Divider(color: Colors.grey.withOpacity(0.35),thickness: 1.1,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text("19-01-2023",style: TextStyle(
                            color: Constants.blackColor,
                            fontSize: 16,
                            height: 0.98
                        ),),
                      ),
                      SizedBox(
                          width: 100,
                          child: Divider(color: Colors.grey.withOpacity(0.35),thickness: 1.1,)),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 4,
                          decoration:BoxDecoration(
                              color: Constants.secondaryColor,
                              borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    "SIGN ON: 14:15",textScaler: TextScaler.linear(1),style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                  ),
                                  Text(
                                    "SIGN OFF: 19:43",textScaler: TextScaler.linear(1),style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 5,vertical:5),
                                // margin: EdgeInsets.only(right:8,top: 8),
                                decoration: BoxDecoration(
                                    color:Constants.pimaryColor,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        "4",textScaler: TextScaler.linear(1),style: TextStyle(
                                          color: Constants.whiteColor,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600
                                      ),
                                      ),
                                      Text(
                                        "SET NO",textScaler: TextScaler.linear(1),style: TextStyle(
                                          color: Constants.whiteColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "START STATION: CSMT",textScaler: TextScaler.linear(1),style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                  ),
                                  Text(
                                    "END STATION: CSMT",textScaler: TextScaler.linear(1),style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                  ),
                                ],
                              ),
                            ],

                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                          decoration:BoxDecoration(
                            color: Constants.pimaryColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "18-01-2023",textScaler: TextScaler.linear(1),style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                              ),
                              Text(
                                "Duty HRS:07:45",textScaler: TextScaler.linear(1),style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                              ),
                              Text(
                                "NDH:00",textScaler: TextScaler.linear(1),style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                              ),
                            ],
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
    );
  }
}
