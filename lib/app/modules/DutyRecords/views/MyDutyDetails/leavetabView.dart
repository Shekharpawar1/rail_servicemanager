import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviceman/app/modules/DutyRecords/controllers/duty_records_controller.dart';

import '../../../../../component/cached_network_image.dart';
import '../../../../../utils/Constant.dart';

// class Leave extends StatelessWidget {
//    Leave({super.key});
//    DutyRecordsController dutyRecordsController=Get.put(DutyRecordsController());
//    @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//              height: 100,
//           child: ListView.builder(
//               shrinkWrap: true,
//               itemCount:2,
//               itemBuilder: (context,index){
//                 return Container(
//                   width: double.infinity,
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   // margin: EdgeInsets.symmetric(horizontal: 8),
//                   decoration:BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(color:Colors.black38,
//                             blurRadius: 4,
//                             offset: Offset(2, 2))
//                       ]
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // SizedBox(height: 10,),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                               'leave',
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 15,
//                                   color: Colors.black
//                               )
//                           ),
//                           Text.rich(
//                             TextSpan(
//                                 children: [
//                                   TextSpan(
//                                       text: dutyRecordsController.MyDuty[index],
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 15,
//                                           color: Colors.black
//                                       )
//                                   ),
//                                   TextSpan(
//                                       text: ":",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w500,
//                                           fontSize: 13,
//                                           color: Colors.black
//                                       )
//                                   ),
//                                   TextSpan(
//                                       text: dutyRecordsController.MyDuty[index],
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w400,
//                                           fontSize: 15,
//                                           color: Colors.black
//                                       )
//                                   )
//                                 ]
//                             ),
//                           )
//                         ],
//                       ),
//                       Divider(color: Color(0xFFF2F2F2),),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Center(
//                                 child: Text(
//                                     dutyRecordsController.MyDuty[index],
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w400,
//                                         fontSize: 15,
//                                         color: Constants.blackColor
//                                     )
//                                 )
//                             ),
//                             MaterialButton(
//                               shape: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(5),
//                                   borderSide: BorderSide(
//                                       color: Constants.secondaryColor
//                                   )
//                               ),
//                               onPressed: () {
//
//                               },
//                               height: 32,
//                               minWidth: 50,
//                               color: Constants.secondaryColor,
//                               child: Center(
//                                   child:Icon(Icons.cancel,color: Constants.whiteColor,)
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//         ),
//       ],
//     );
//   }
// }
class Leave extends StatelessWidget {
  final DutyRecordsController dutyRecordsController =
      Get.find<DutyRecordsController>();

  Leave({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dutyRecordsController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      return ListView.builder(
        itemCount: dutyRecordsController.leaveHistory.length,
        itemBuilder: (context, index) {
          var leave = dutyRecordsController.leaveHistory[index];
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 8),
            margin: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Leave',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            color: Colors.black)),
                    Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: "Date",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: Colors.black)),
                        TextSpan(
                            text: ": ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color: Colors.black)),
                        TextSpan(
                            text: leave['leave_date'],
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Colors.black))
                      ]),
                    )
                  ],
                ),
                Divider(
                  color: Color(0xFFF2F2F2),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: context.width * 0.65,
                          child: Text(leave['leave_type'],
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Constants.blackColor))),
                      MaterialButton(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                BorderSide(color: Constants.secondaryColor)),
                        onPressed: () {
                          Get.snackbar(
                            "Are you sure you want to delete this?",
                            "This record deleted permanently",
                            mainButton: TextButton(
                              onPressed: () {
                                dutyRecordsController.deleteLeave(leave['id']);
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Constants.secondaryColor,
                                  ),
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    "Yes,Delete",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),
                                  )),
                            ),
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
                            child: Icon(
                          Icons.cancel,
                          color: Constants.whiteColor,
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }
}

class LoadParticularDuty extends StatelessWidget {
  final DutyRecordsController dutyRecordsController =
      Get.find<DutyRecordsController>();

  LoadParticularDuty({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dutyRecordsController.isLoading1.value) {
        return Center(child: CircularProgressIndicator());
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dutyRecordsController.loadParticularsDuty.length,
                  itemBuilder: (context, index) {
                    var loadparticular =
                        dutyRecordsController.loadParticularsDuty[index];
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(2, 2))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Set No',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ":",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['set_no']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black))
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ": ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['add_date']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black))
                                ]),
                              )
                            ],
                          ),
                          Divider(
                            color: Color(0xFFF2F2F2),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.width * 0.45,
                                  child: Text(' ${loadparticular['note']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Constants.blackColor)),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    if (loadparticular['file'] != '' && loadparticular['file'] != null)
                                                      cached_network_image(
                                                        image:
                                                            "https://service-manager.digiatto.online/${loadparticular['file']}",
                                                        fit: BoxFit.contain,
                                                      )
                                                    else
                                                      Text(
                                                        "No image selected",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                    SizedBox(height: 10),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      color:
                                                          Constants.pimaryColor,
                                                      child: Text(
                                                        'Close',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 3,
                                                // offset: Offset(3, 3)
                                              ),
                                            ]),
                                        child: (loadparticular['file'] == '' ||
                                                loadparticular['file'] == null)
                                            ? Icon(
                                                Icons.image,
                                                color: Colors.black87,
                                                size: 40,
                                              )
                                            : cached_network_image(
                                                image:
                                                    "https://service-manager.digiatto.online/${loadparticular['file']}",
                                                fit: BoxFit.contain),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Constants.pimaryColor)),
                                          onPressed: () {
                                            dutyRecordsController.getSetPaticularDetails(loadparticular['id'], index);
                                          },
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 28,
                                          minWidth: 40,
                                          color: Constants.pimaryColor,
                                          child: Center(
                                              child: Text('View Records',
                                                  style: TextStyle(
                                                      color: Constants.whiteColor,
                                                      fontSize: 10))),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color:
                                                      Constants.secondaryColor)),
                                          onPressed: () {
                                            Get.snackbar(
                                              "Are you sure you want to delete this?",
                                              "This record deleted permanently",
                                              mainButton: TextButton(
                                                onPressed: () {
                                                  dutyRecordsController.deleteUserSet(loadparticular['id']);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Constants.secondaryColor,
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      "Yes,Delete",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                              ),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Constants.pimaryColor,
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 5),
                                            );
                                            // Add your onPressed functionality here
                                          },
                                          padding:
                                              EdgeInsets.symmetric(horizontal: 8),
                                          height: 28,
                                          minWidth: 50,
                                          color: Constants.secondaryColor,
                                          child: Center(
                                              child: Icon(
                                            Icons.cancel,
                                            color: Constants.whiteColor,
                                            size: 20,
                                          )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}



class EBookDuty extends StatelessWidget {
  final DutyRecordsController dutyRecordsController =
  Get.find<DutyRecordsController>();

  EBookDuty({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dutyRecordsController.isLoading1.value) {
        return Center(child: CircularProgressIndicator());
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dutyRecordsController.eBooksDuty.length,
                  itemBuilder: (context, index) {
                    var loadparticular =
                    dutyRecordsController.eBooksDuty[index];
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(2, 2))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Set No',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ":",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['set_no']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black))
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ": ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['add_date']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black))
                                ]),
                              )
                            ],
                          ),
                          Divider(
                            color: Color(0xFFF2F2F2),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.width * 0.45,
                                  child: Text(' ${loadparticular['note']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Constants.blackColor)),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    if (loadparticular['file'] != '' && loadparticular['file'] != null)
                                                      cached_network_image(
                                                        image:
                                                        "https://service-manager.digiatto.online/${loadparticular['file']}",
                                                        fit: BoxFit.contain,
                                                      )
                                                    else
                                                      Text(
                                                        "No image selected",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    SizedBox(height: 10),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      color:
                                                      Constants.pimaryColor,
                                                      child: Text(
                                                        'Close',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 3,
                                                // offset: Offset(3, 3)
                                              ),
                                            ]),
                                        child: (loadparticular['file'] == '' ||
                                            loadparticular['file'] == null)
                                            ? Icon(
                                          Icons.image,
                                          color: Colors.black87,
                                          size: 40,
                                        )
                                            : cached_network_image(
                                            image:
                                            "https://service-manager.digiatto.online/${loadparticular['file']}",
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Constants.pimaryColor)),
                                          onPressed: () {
                                            dutyRecordsController.getSetEBookDetails(loadparticular['id'], index);
                                          },
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 28,
                                          minWidth: 40,
                                          color: Constants.pimaryColor,
                                          child: Center(
                                              child: Text('View Records',
                                                  style: TextStyle(
                                                      color: Constants.whiteColor,
                                                      fontSize: 10))),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color:
                                                  Constants.secondaryColor)),
                                          onPressed: () {
                                            Get.snackbar(
                                              "Are you sure you want to delete this?",
                                              "This record deleted permanently",
                                              mainButton: TextButton(
                                                onPressed: () {
                                                  dutyRecordsController.deleteUserSet(loadparticular['id']);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Constants.secondaryColor,
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      "Yes,Delete",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                              ),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Constants.pimaryColor,
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 5),
                                            );
                                            // Add your onPressed functionality here
                                          },
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                          height: 28,
                                          minWidth: 50,
                                          color: Constants.secondaryColor,
                                          child: Center(
                                              child: Icon(
                                                Icons.cancel,
                                                color: Constants.whiteColor,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}


class PersonalDuty extends StatelessWidget {
  final DutyRecordsController dutyRecordsController =
  Get.find<DutyRecordsController>();

  PersonalDuty({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dutyRecordsController.isLoading1.value) {
        return Center(child: CircularProgressIndicator());
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dutyRecordsController.personalDuty.length,
                  itemBuilder: (context, index) {
                    var loadparticular =
                    dutyRecordsController.personalDuty[index];
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(2, 2))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Set No',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ":",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['set_no']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black))
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ": ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['add_date']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black))
                                ]),
                              )
                            ],
                          ),
                          Divider(
                            color: Color(0xFFF2F2F2),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.width * 0.45,
                                  child: Text(' ${loadparticular['note']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Constants.blackColor)),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    if (loadparticular['file'] != '' && loadparticular['file'] != null)
                                                      cached_network_image(
                                                        image:
                                                        "https://service-manager.digiatto.online/${loadparticular['file']}",
                                                        fit: BoxFit.contain,
                                                      )
                                                    else
                                                      Text(
                                                        "No image selected",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    SizedBox(height: 10),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      color:
                                                      Constants.pimaryColor,
                                                      child: Text(
                                                        'Close',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 3,
                                                // offset: Offset(3, 3)
                                              ),
                                            ]),
                                        child: (loadparticular['file'] == '' ||
                                            loadparticular['file'] == null)
                                            ? Icon(
                                          Icons.image,
                                          color: Colors.black87,
                                          size: 40,
                                        )
                                            : cached_network_image(
                                            image:
                                            "https://service-manager.digiatto.online/${loadparticular['file']}",
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Constants.pimaryColor)),
                                          onPressed: () {
                                            dutyRecordsController.getSetPersonalDetails(loadparticular['id'], index);
                                          },
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 28,
                                          minWidth: 40,
                                          color: Constants.pimaryColor,
                                          child: Center(
                                              child: Text('View Records',
                                                  style: TextStyle(
                                                      color: Constants.whiteColor,
                                                      fontSize: 10))),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color:
                                                  Constants.secondaryColor)),
                                          onPressed: () {
                                            Get.snackbar(
                                              "Are you sure you want to delete this?",
                                              "This record deleted permanently",
                                              mainButton: TextButton(
                                                onPressed: () {
                                                  dutyRecordsController.deleteUserSet(loadparticular['id']);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Constants.secondaryColor,
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      "Yes,Delete",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                              ),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Constants.pimaryColor,
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 5),
                                            );
                                            // Add your onPressed functionality here
                                          },
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                          height: 28,
                                          minWidth: 50,
                                          color: Constants.secondaryColor,
                                          child: Center(
                                              child: Icon(
                                                Icons.cancel,
                                                color: Constants.whiteColor,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}

class ImportantDuty extends StatelessWidget {
  final DutyRecordsController dutyRecordsController =
  Get.find<DutyRecordsController>();

  ImportantDuty({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dutyRecordsController.isLoading1.value) {
        return Center(child: CircularProgressIndicator());
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dutyRecordsController.importantDuty.length,
                  itemBuilder: (context, index) {
                    var loadparticular =
                    dutyRecordsController.importantDuty[index];
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(2, 2))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Set No',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ":",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['set_no']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black))
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ": ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['add_date']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black))
                                ]),
                              )
                            ],
                          ),
                          Divider(
                            color: Color(0xFFF2F2F2),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.width * 0.45,
                                  child: Text(' ${loadparticular['note']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Constants.blackColor)),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    if (loadparticular['file'] != '' && loadparticular['file'] != null)
                                                      cached_network_image(
                                                        image:
                                                        "https://service-manager.digiatto.online/${loadparticular['file']}",
                                                        fit: BoxFit.contain,
                                                      )
                                                    else
                                                      Text(
                                                        "No image selected",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    SizedBox(height: 10),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      color:
                                                      Constants.pimaryColor,
                                                      child: Text(
                                                        'Close',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 3,
                                                // offset: Offset(3, 3)
                                              ),
                                            ]),
                                        child: (loadparticular['file'] == '' ||
                                            loadparticular['file'] == null)
                                            ? Icon(
                                          Icons.image,
                                          color: Colors.black87,
                                          size: 40,
                                        )
                                            : cached_network_image(
                                            image:
                                            "https://service-manager.digiatto.online/${loadparticular['file']}",
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Constants.pimaryColor)),
                                          onPressed: () {
                                            dutyRecordsController.getSetImportantDetails(loadparticular['id'], index);
                                          },
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 28,
                                          minWidth: 40,
                                          color: Constants.pimaryColor,
                                          child: Center(
                                              child: Text('View Records',
                                                  style: TextStyle(
                                                      color: Constants.whiteColor,
                                                      fontSize: 10))),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color:
                                                  Constants.secondaryColor)),
                                          onPressed: () {
                                            Get.snackbar(
                                              "Are you sure you want to delete this?",
                                              "This record deleted permanently",
                                              mainButton: TextButton(
                                                onPressed: () {
                                                  dutyRecordsController.deleteUserSet(loadparticular['id']);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Constants.secondaryColor,
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      "Yes,Delete",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                              ),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Constants.pimaryColor,
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 5),
                                            );
                                            // Add your onPressed functionality here
                                          },
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                          height: 28,
                                          minWidth: 50,
                                          color: Constants.secondaryColor,
                                          child: Center(
                                              child: Icon(
                                                Icons.cancel,
                                                color: Constants.whiteColor,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}

class UnusualDuty extends StatelessWidget {
  final DutyRecordsController dutyRecordsController =
  Get.find<DutyRecordsController>();

  UnusualDuty({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dutyRecordsController.isLoading1.value) {
        return Center(child: CircularProgressIndicator());
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dutyRecordsController.unusualDuty.length,
                  itemBuilder: (context, index) {
                    var loadparticular =
                    dutyRecordsController.unusualDuty[index];
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(2, 2))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Set No',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ":",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['set_no']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black))
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ": ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['add_date']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black))
                                ]),
                              )
                            ],
                          ),
                          Divider(
                            color: Color(0xFFF2F2F2),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.width * 0.45,
                                  child: Text(' ${loadparticular['note']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Constants.blackColor)),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    if (loadparticular['file'] != '' && loadparticular['file'] != null)
                                                      cached_network_image(
                                                        image:
                                                        "https://service-manager.digiatto.online/${loadparticular['file']}",
                                                        fit: BoxFit.contain,
                                                      )
                                                    else
                                                      Text(
                                                        "No image selected",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    SizedBox(height: 10),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      color:
                                                      Constants.pimaryColor,
                                                      child: Text(
                                                        'Close',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 3,
                                                // offset: Offset(3, 3)
                                              ),
                                            ]),
                                        child: (loadparticular['file'] == '' ||
                                            loadparticular['file'] == null)
                                            ? Icon(
                                          Icons.image,
                                          color: Colors.black87,
                                          size: 40,
                                        )
                                            : cached_network_image(
                                            image:
                                            "https://service-manager.digiatto.online/${loadparticular['file']}",
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Constants.pimaryColor)),
                                          onPressed: () {
                                            dutyRecordsController.getSetUnusalDetails(loadparticular['id'], index);
                                          },
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 28,
                                          minWidth: 40,
                                          color: Constants.pimaryColor,
                                          child: Center(
                                              child: Text('View Records',
                                                  style: TextStyle(
                                                      color: Constants.whiteColor,
                                                      fontSize: 10))),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color:
                                                  Constants.secondaryColor)),
                                          onPressed: () {
                                            Get.snackbar(
                                              "Are you sure you want to delete this?",
                                              "This record deleted permanently",
                                              mainButton: TextButton(
                                                onPressed: () {
                                                  dutyRecordsController.deleteUserSet(loadparticular['id']);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Constants.secondaryColor,
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      "Yes,Delete",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                              ),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Constants.pimaryColor,
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 5),
                                            );
                                            // Add your onPressed functionality here
                                          },
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                          height: 28,
                                          minWidth: 50,
                                          color: Constants.secondaryColor,
                                          child: Center(
                                              child: Icon(
                                                Icons.cancel,
                                                color: Constants.whiteColor,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}


class OthersDuty extends StatelessWidget {
  final DutyRecordsController dutyRecordsController =
  Get.find<DutyRecordsController>();

  OthersDuty({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (dutyRecordsController.isLoading1.value) {
        return Center(child: CircularProgressIndicator());
      }
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: dutyRecordsController.othersDuty.length,
                  itemBuilder: (context, index) {
                    var loadparticular =
                    dutyRecordsController.othersDuty[index];
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(2, 2))
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: 'Set No',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ":",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['set_no']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Colors.black))
                                ]),
                              ),
                              Text.rich(
                                TextSpan(children: [
                                  TextSpan(
                                      text: "Date",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: ": ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 13,
                                          color: Colors.black)),
                                  TextSpan(
                                      text: '${loadparticular['add_date']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black))
                                ]),
                              )
                            ],
                          ),
                          Divider(
                            color: Color(0xFFF2F2F2),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: context.width * 0.45,
                                  child: Text(' ${loadparticular['note']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: Constants.blackColor)),
                                ),
                                Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return Dialog(
                                              child: Container(
                                                padding: EdgeInsets.all(8),
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    if (loadparticular['file'] != '' && loadparticular['file'] != null)
                                                      cached_network_image(
                                                        image:
                                                        "https://service-manager.digiatto.online/${loadparticular['file']}",
                                                        fit: BoxFit.contain,
                                                      )
                                                    else
                                                      Text(
                                                        "No image selected",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                            FontWeight.bold),
                                                      ),
                                                    SizedBox(height: 10),
                                                    MaterialButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      color:
                                                      Constants.pimaryColor,
                                                      child: Text(
                                                        'Close',
                                                        style: TextStyle(
                                                            color: Colors.white),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 120,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 3,
                                                // offset: Offset(3, 3)
                                              ),
                                            ]),
                                        child: (loadparticular['file'] == '' ||
                                            loadparticular['file'] == null)
                                            ? Icon(
                                          Icons.image,
                                          color: Colors.black87,
                                          size: 40,
                                        )
                                            : cached_network_image(
                                            image:
                                            "https://service-manager.digiatto.online/${loadparticular['file']}",
                                            fit: BoxFit.contain),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color: Constants.pimaryColor)),
                                          onPressed: () {
                                            dutyRecordsController.getSetOthersDetails(loadparticular['id'], index);
                                          },
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 28,
                                          minWidth: 40,
                                          color: Constants.pimaryColor,
                                          child: Center(
                                              child: Text('View Records',
                                                  style: TextStyle(
                                                      color: Constants.whiteColor,
                                                      fontSize: 10))),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        MaterialButton(
                                          shape: OutlineInputBorder(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              borderSide: BorderSide(
                                                  color:
                                                  Constants.secondaryColor)),
                                          onPressed: () {
                                            Get.snackbar(
                                              "Are you sure you want to delete this?",
                                              "This record deleted permanently",
                                              mainButton: TextButton(
                                                onPressed: () {
                                                  dutyRecordsController.deleteUserSet(loadparticular['id']);
                                                },
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5),
                                                      color: Constants.secondaryColor,
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    child: Text(
                                                      "Yes,Delete",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                    )),
                                              ),
                                              snackPosition: SnackPosition.TOP,
                                              backgroundColor: Constants.pimaryColor,
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 5),
                                            );
                                            // Add your onPressed functionality here
                                          },
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 8),
                                          height: 28,
                                          minWidth: 50,
                                          color: Constants.secondaryColor,
                                          child: Center(
                                              child: Icon(
                                                Icons.cancel,
                                                color: Constants.whiteColor,
                                                size: 20,
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      );
    });
  }
}