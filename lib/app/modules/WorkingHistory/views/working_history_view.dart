import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serviceman/app/routes/app_pages.dart';

import '../../../../utils/Constant.dart';
import '../controllers/working_history_controller.dart';

class WorkingHistoryView extends GetView<WorkingHistoryController> {
   WorkingHistoryView({Key? key}) : super(key: key);
   WorkingHistoryController workingHistory=Get.put(WorkingHistoryController());
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
      body:Obx(()=>Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        margin: EdgeInsets.only(bottom: 20),
        child:workingHistory.isLoading.value?Center(child: CircularProgressIndicator()): ListView.builder(
          itemCount: workingHistory.setsList.length,
          itemBuilder: (context, index) {
            var setDetails=workingHistory.setsList.value[index];
            return  GestureDetector(
              onTap: () {
               workingHistory.getSetDetails(setDetails['id'], index);
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
                        child: Text("${setDetails['add_date']}",style: TextStyle(
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
                                    "SIGN ON: ${setDetails['sign_no']}",textScaler: TextScaler.linear(1),style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                  ),
                                  Text(
                                    "SIGN OFF: ${setDetails['sign_off']}",textScaler: TextScaler.linear(1),style: TextStyle(
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
                                        "${setDetails['set_no']}",textScaler: TextScaler.linear(1),style: TextStyle(
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
                                    "START STATION: ${setDetails['signon_station']}",textScaler: TextScaler.linear(1),style: TextStyle(
                                      color: Constants.blackColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400
                                  ),
                                  ),
                                  Text(
                                    "END STATION: ${setDetails['signoff_station']}",textScaler: TextScaler.linear(1),style: TextStyle(
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
                                "${setDetails['add_date']}",textScaler: TextScaler.linear(1),style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                              ),
                              Text(
                                "Duty HRS:${setDetails['duty_hr']}",textScaler: TextScaler.linear(1),style: TextStyle(
                                  color: Constants.whiteColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400
                              ),
                              ),
                              Text(
                                "NDH:${setDetails['ndh']}",textScaler: TextScaler.linear(1),style: TextStyle(
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
      )),
    );
  }
}
