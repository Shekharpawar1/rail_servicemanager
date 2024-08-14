import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/Constant.dart';
import '../controllers/find_roaster_set_controller.dart';

class FindRoasterSetView extends GetView<FindRoasterSetController> {
  final argumentsData=Get.arguments as Map;
   FindRoasterSetView({Key? key}) : super(key: key);
   FindRoasterSetController findRosterController=FindRoasterSetController();

   @override
  Widget build(BuildContext context) {
    dynamic argumentDataList=argumentsData['filteredDataList'];
    final argumentDataTrain=argumentsData['setData'];
    List<Widget>ItemList=[
      Container(
        // width: 64,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
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
              "${argumentDataList[0]['sign_no']}",
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textScaler: TextScaler.linear(1),style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            ),
            Text(
              "${argumentDataList[0]['signon_station']}",
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textScaler: TextScaler.linear(1),style: TextStyle(
              color: Colors.teal,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            ),
          ],
        ),
      ),
      Container(
        // width: 66,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
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
                "${argumentDataList[0]['sign_off']}",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textScaler: TextScaler.linear(1),style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              ),
              Text(
                "${argumentDataList[0]['signoff_station']}",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textScaler: TextScaler.linear(1),style: TextStyle(
                color: Colors.teal,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              ),
            ],
          )),
      Container(
        // width: 72,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
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
                "${argumentDataList[0]['duty_hr']}",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
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
      Container(
        // width: 42,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
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
                "${argumentDataList[0]['kms']}",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
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
      Container(
        // width: 42,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
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
                "${argumentDataList[0]['ndh']}",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
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
      Container(
        // width: 50,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Constants.whiteColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "SHIFT",
                textScaler: TextScaler.linear(1),style: TextStyle(
                color: Constants.pimaryColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
              ),
              Text("${argumentDataList[0]['duty_shift']}",
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textScaler: TextScaler.linear(1),style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
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
          "SET NO:${argumentDataList[0]['set_no']}",
          textScaler: TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 20),
        ),
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
                height: 72,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal:4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]),
                child:ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ItemList.length,
                    itemBuilder: (context, index) {
                      return ItemList[index];
                    }
                ),
                // Row(children: [
                //   Container(
                //     // width: 64,
                //     padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.only(
                //             topLeft: Radius.circular(5),
                //             bottomLeft: Radius.circular(5)),
                //         color: Constants.whiteColor,
                //         border: Border(
                //             right: BorderSide(
                //               color: Colors.grey.shade400,
                //             ))),
                //     child: Column(
                //       mainAxisAlignment: MainAxisAlignment.start,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "SIGN ON",
                //           textScaler: TextScaler.linear(1),style: TextStyle(
                //           color: Constants.pimaryColor,
                //           fontSize: 13,
                //           fontWeight: FontWeight.w600,
                //         ),
                //         ),
                //         Text(
                //           "${argumentDataList[0]['sign_no']}",
                //           softWrap: true,
                //           overflow: TextOverflow.ellipsis,
                //           maxLines: 1,
                //           textScaler: TextScaler.linear(1),style: TextStyle(
                //           color: Colors.grey,
                //           fontSize: 14,
                //           fontWeight: FontWeight.w600,
                //         ),
                //         ),
                //         Text(
                //           "${argumentDataList[0]['signon_station']}",
                //           softWrap: true,
                //           overflow: TextOverflow.ellipsis,
                //           maxLines: 1,
                //           textScaler: TextScaler.linear(1),style: TextStyle(
                //           color: Colors.teal,
                //           fontSize: 14,
                //           fontWeight: FontWeight.w600,
                //         ),
                //         ),
                //       ],
                //     ),
                //   ),
                //   Container(
                //     // width: 66,
                //       padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
                //       decoration: BoxDecoration(
                //         // borderRadius: BorderRadius.circular(5),
                //           color: Constants.whiteColor,
                //           border: Border(
                //               right: BorderSide(
                //                 color: Colors.grey.shade400,
                //               ))),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "SIGN OFF",
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Constants.pimaryColor,
                //             fontSize: 13,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //           Text(
                //             "${argumentDataList[0]['sign_off']}",
                //             softWrap: true,
                //             overflow: TextOverflow.ellipsis,
                //             maxLines: 1,
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Colors.grey,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //           Text(
                //             "${argumentDataList[0]['signoff_station']}",
                //             softWrap: true,
                //             overflow: TextOverflow.ellipsis,
                //             maxLines: 1,
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Colors.teal,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //         ],
                //       )),
                //   Container(
                //     // width: 72,
                //       padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
                //       decoration: BoxDecoration(
                //         // borderRadius: BorderRadius.circular(5),
                //           color: Constants.whiteColor,
                //           border: Border(
                //               right: BorderSide(
                //                 color: Colors.grey.shade400,
                //               ))),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "DUTY HRS",
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Constants.pimaryColor,
                //             fontSize: 13,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //           Text(
                //             "${argumentDataList[0]['duty_hr']}",
                //             softWrap: true,
                //             overflow: TextOverflow.ellipsis,
                //             maxLines: 1,
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Colors.grey,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //           // Text("CSMT",
                //           //   textScaler: TextScaler.linear(1),style: TextStyle(
                //           //     color: Colors.teal,
                //           //     fontSize: 13,
                //           //     fontWeight: FontWeight.w600,
                //           //   ),
                //           // ),
                //         ],
                //       )),
                //   Container(
                //     // width: 42,
                //       padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
                //       decoration: BoxDecoration(
                //         // borderRadius: BorderRadius.circular(5),
                //           color: Constants.whiteColor,
                //           border: Border(
                //               right: BorderSide(
                //                 color: Colors.grey.shade400,
                //               ))),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "KMS",
                //
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Constants.pimaryColor,
                //             fontSize: 13,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //           Text(
                //             "${argumentDataList[0]['kms']}",
                //             softWrap: true,
                //             overflow: TextOverflow.ellipsis,
                //             maxLines: 2,
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Colors.grey,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //           // Text("CSMT",
                //           //   textScaler: TextScaler.linear(1),style: TextStyle(
                //           //     color: Colors.teal,
                //           //     fontSize: 13,
                //           //     fontWeight: FontWeight.w600,
                //           //   ),
                //           // ),
                //         ],
                //       )),
                //   Container(
                //     // width: 42,
                //       padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
                //       decoration: BoxDecoration(
                //         // borderRadius: BorderRadius.circular(5),
                //           color: Constants.whiteColor,
                //           border: Border(
                //               right: BorderSide(
                //                 color: Colors.grey.shade400,
                //               ))),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "NDH",
                //
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Constants.pimaryColor,
                //             fontSize: 13,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //           Text(
                //             "${argumentDataList[0]['ndh']}",
                //             softWrap: true,
                //             overflow: TextOverflow.ellipsis,
                //             maxLines: 2,
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Colors.grey,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //           // Text("CSMT",
                //           //   textScaler: TextScaler.linear(1),style: TextStyle(
                //           //     color: Colors.teal,
                //           //     fontSize: 13,
                //           //     fontWeight: FontWeight.w600,
                //           //   ),
                //           // ),
                //         ],
                //       )),
                //   Container(
                //     // width: 50,
                //       padding: EdgeInsets.symmetric(vertical: 5, horizontal:4),
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(5),
                //         color: Constants.whiteColor,
                //       ),
                //       child: Column(
                //         mainAxisAlignment: MainAxisAlignment.start,
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(
                //             "SHIFT",
                //             textScaler: TextScaler.linear(1),style: TextStyle(
                //             color: Constants.pimaryColor,
                //             fontSize: 13,
                //             fontWeight: FontWeight.w600,
                //           ),
                //           ),
                //     Text("${argumentDataList[0]['duty_shift']}",
                //       softWrap: true,
                //       overflow: TextOverflow.ellipsis,
                //       maxLines: 2,
                //       textScaler: TextScaler.linear(1),style: TextStyle(
                //         color: Colors.grey,
                //         fontSize: 14,
                //         fontWeight: FontWeight.w600,
                //       ),
                //     ),
                //         ],
                //       )),
                // ]),
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal:4),
                padding: EdgeInsets.symmetric(horizontal:4, vertical: 2),
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
                // padding: EdgeInsets.symmetric(horizontal:40,vertical:2),
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
                  itemCount: argumentDataTrain.length,
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
                                                width: 2.5,
                                                color: Colors.grey.shade300,
                                              ),
                                            )),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "${argumentDataTrain[index]['type']}",
                                              textScaler: TextScaler.linear(1),textAlign: TextAlign.start,style: TextStyle(
                                              color:Colors.teal,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            ),
                                            Text(
                                              "${argumentDataTrain[index]['train_no']}",
                                                textAlign: TextAlign.start,
                                              textScaler: TextScaler.linear(1),style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            ),

                                            SizedBox(
                                              width: 70,
                                              child: Divider(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            Text(
                                              "${argumentDataTrain[index]['train_type']}",
                                                textAlign: TextAlign.start,
                                              textScaler: TextScaler.linear(1),style: TextStyle(
                                              color:Colors.teal,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            ),
                                            Text(
                                              "${argumentDataTrain[index]['car']}",
                                                textAlign: TextAlign.start,
                                              textScaler: TextScaler.linear(1),style: TextStyle(
                                              color: Constants.pimaryColor,
                                              fontSize: 11,
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
                                                   height: 55,
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
                                                        "${argumentDataTrain[index]['start_station']}",
                                                        textScaler: TextScaler.linear(1),style: TextStyle(
                                                        color:Colors.teal,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      ),
                                                      Text(
                                                        "${argumentDataTrain[index]['start_time']}",
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
                                                   height: 55,
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
                                                        "${argumentDataTrain[index]['change_station']}",
                                                        textScaler: TextScaler.linear(1),style: TextStyle(
                                                        color:Colors.teal,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                      ),
                                                      Text(
                                                        "${argumentDataTrain[index]['change_time']}",
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
                                                  height: 55,
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
                                                        "${argumentDataTrain[index]['rt_rb']}",
                                                        textScaler: TextScaler.linear(1),style: TextStyle(
                                                        color:Colors.teal,
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
                                                  '${argumentDataTrain[index]['station_name']}',textScaler: TextScaler.linear(1),style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 13
                                                ),)),
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
                                                    fontSize: 13
                                                ),)),
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
                                                    width: 2.5,
                                                    color: Colors.grey.shade300,
                                                  ),
                                                )),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  'Platform:-',textScaler: TextScaler.linear(1),style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 11
                                                ),),
                                                SizedBox(width: 10,),
                                                Container(
                                                  height: 18,
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(width: 10,),
                                                Flexible(
                                                  child: Text(
                                                    '',textScaler: TextScaler.linear(1),softWrap: true,maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 11
                                                  ),),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
                padding: EdgeInsets.symmetric(horizontal:4, vertical: 8),
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
                      color: Constants.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    ),
                    Container(
                      width: 130,
                      child: Text(
                        "${argumentDataList[0]['holiday']}",
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
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
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

                      padding: EdgeInsets.symmetric(horizontal:8),
                      onPressed: () {
                        findRosterController.selectDate(context);
                        findRosterController.selectSetNo(argumentDataList[0]['set_no']);
                      },
                      height: 38,
                      minWidth: 78,
                      color: Constants.secondaryColor,
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.add,color: Constants.whiteColor,),
                            SizedBox(width: 10,),
                            Text(
                              "Add To Roaster",textScaler: TextScaler.linear(1),style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                            ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Constants.pimaryColor
                          )
                      ),
                      onPressed: () {
                        findRosterController.selectDate1(context);
                      },
                      height: 38,
                      minWidth: 70,

                      color: Constants.pimaryColor,
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.alarm,color: Constants.whiteColor,),
                            SizedBox(width: 5,),
                            Text(
                              "SET REMINDER",textScaler: TextScaler.linear(1),style: TextStyle(
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
              ),
              SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}
