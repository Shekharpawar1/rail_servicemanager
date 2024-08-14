import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../../../../utils/Constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/roaster_controller.dart';

class RoasterView extends GetView<RoasterController> {
   RoasterView({Key? key}) : super(key: key);
   RoasterController rosterController=Get.put(RoasterController());
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
        title: Text("Roster",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
       color: Color(0xFFF2F2F2),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: 15),
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
                  Text("Find set details",style: TextStyle(
                    color: Constants.fontColor,
                    fontSize: 18,
                    height: 0.98
                  ),),
                  Divider(color: Color(0xFFF2F2F2),thickness: 1.1,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(width: MediaQuery.of(context).size.width/1.8,
                          child: Container(
                            decoration: BoxDecoration(
                                color:Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Colors.grey,
                                width: 1
                              )
                            ),
                            child: TextFormField(
                              cursorColor: Color(0xFF242B42),
                              cursorWidth: 1.5,
                              style: TextStyle(fontSize: 13,
                                fontFamily: 'Urbanist',
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF191A26),
                              ),
                              controller: rosterController.searchCotroller,
                              // inputFormatters: [LengthLimitingTextInputFormatter(6)],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                 contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                hintText: "Enter SET No",
                                hintStyle: TextStyle(fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Constants.pimaryColor,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 38,
                          width: 78,
                          // padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
                          // margin: EdgeInsets.only(right:8,top: 8),
                          decoration: BoxDecoration(
                              color:Constants.pimaryColor,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              rosterController.getSets(rosterController.searchCotroller.text.toString());
                               // Get.toNamed(Routes.FIND_ROASTER_SET);
                            },
                            height: 38,
                            minWidth: 78,
                            child: Center(
                              child: Text(
                                "Find",style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w400
                              ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(height: 20,),
            // Container(
            //   width: double.infinity,
            //   padding: EdgeInsets.symmetric(horizontal: 8),
            //   margin: EdgeInsets.symmetric(horizontal: 12),
            //   decoration:BoxDecoration(
            //       color: Colors.white,
            //       borderRadius: BorderRadius.circular(10),
            //       boxShadow: [
            //         BoxShadow(color:Colors.black38,
            //             blurRadius: 4,
            //             offset: Offset(2, 2))
            //       ]
            //   ),
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       SizedBox(height: 8,),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //          Text.rich(
            //            TextSpan(
            //              children: [
            //                TextSpan(
            //                  text: "SET",
            //                  style: TextStyle(
            //                    fontWeight: FontWeight.w500,
            //                    fontSize: 13,
            //                    color: Colors.black
            //                  )
            //                ),
            //                TextSpan(
            //                    text: ":",
            //                    style: TextStyle(
            //                        fontWeight: FontWeight.w500,
            //                        fontSize: 13,
            //                        color: Colors.black
            //                    )
            //                ),
            //                TextSpan(
            //                    text: "36",
            //                    style: TextStyle(
            //                        fontWeight: FontWeight.w400,
            //                        fontSize: 13,
            //                        color: Colors.black
            //                    )
            //                )
            //              ]
            //            ),
            //          ),
            //           Text.rich(
            //             TextSpan(
            //                 children: [
            //                   TextSpan(
            //                       text: "SIGN ON",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   ),
            //                   TextSpan(
            //                       text: ":",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   ),
            //                   TextSpan(
            //                       text: "13.39",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w400,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   )
            //                 ]
            //             ),
            //           )
            //         ],
            //       ),
            //       SizedBox(height: 12,),
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Text.rich(
            //             TextSpan(
            //                 children: [
            //                   TextSpan(
            //                       text: "Date",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   ),
            //                   TextSpan(
            //                       text: ":",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   ),
            //                   TextSpan(
            //                       text: "22-07-2021",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w400,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   )
            //                 ]
            //             ),
            //           ),
            //           Text.rich(
            //             TextSpan(
            //                 children: [
            //                   TextSpan(
            //                       text: "SiGN OFF",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   ),
            //                   TextSpan(
            //                       text: ":",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   ),
            //                   TextSpan(
            //                       text: "21.39",
            //                       style: TextStyle(
            //                           fontWeight: FontWeight.w400,
            //                           fontSize: 13,
            //                           color: Colors.black
            //                       )
            //                   )
            //                 ]
            //             ),
            //           )
            //         ],
            //       ),
            //       Divider(color: Color(0xFFF2F2F2),thickness: 1.1,),
            //       Row(
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Container(
            //             padding: EdgeInsets.symmetric(horizontal: 5,vertical:3),
            //             decoration: BoxDecoration(
            //                 color:Colors.green,
            //                 borderRadius: BorderRadius.circular(5)
            //             ),
            //             child: Center(
            //               child: Text.rich(
            //                 TextSpan(
            //                     children: [
            //                       TextSpan(
            //                           text: "Status",
            //                           style: TextStyle(
            //                               fontWeight: FontWeight.w500,
            //                               fontSize: 13,
            //                               color: Constants.whiteColor
            //                           )
            //                       ),
            //                       TextSpan(
            //                           text: ":",
            //                           style: TextStyle(
            //                               fontWeight: FontWeight.w500,
            //                               fontSize: 13,
            //                               color: Constants.whiteColor
            //                           )
            //                       ),
            //                       TextSpan(
            //                           text: "Active",
            //                           style: TextStyle(
            //                               fontWeight: FontWeight.w400,
            //                               fontSize: 13,
            //                               color: Constants.whiteColor
            //                           )
            //                       )
            //                     ]
            //                 ),
            //               ),
            //             ),
            //           ),
            //           Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             crossAxisAlignment: CrossAxisAlignment.center,
            //             children: [
            //               MaterialButton(
            //                 shape: OutlineInputBorder(
            //                     borderRadius: BorderRadius.circular(5),
            //                     borderSide: BorderSide(
            //                         color: Constants.pimaryColor
            //                     )
            //                 ),
            //                 onPressed: () {
            //
            //                 },
            //                 height: 32,
            //                 minWidth: 70,
            //
            //                 color: Constants.pimaryColor,
            //                 child: Center(
            //                   child: Text(
            //                     "Track",style: TextStyle(
            //                       color: Constants.whiteColor,
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w400
            //                   ),
            //                   ),
            //                 ),
            //               ),
            //               SizedBox(width: 28,),
            //               MaterialButton(
            //                 shape: OutlineInputBorder(
            //                   borderRadius: BorderRadius.circular(5),
            //                   borderSide: BorderSide(
            //                     color: Constants.secondaryColor
            //                   )
            //                 ),
            //                 padding: EdgeInsets.symmetric(horizontal: 8),
            //                 onPressed: () {
            //
            //                 },
            //                 height: 32,
            //                 minWidth: 70,
            //
            //                 color: Constants.secondaryColor,
            //                 child: Center(
            //                   child: Text(
            //                     "Remove",style: TextStyle(
            //                       color: Constants.whiteColor,
            //                       fontSize: 14,
            //                       fontWeight: FontWeight.w400
            //                   ),
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      )
    );
  }
}
