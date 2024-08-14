import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:serviceman/app/modules/Contacts/controllers/contacts_controller.dart';

import '../../../../utils/Constant.dart';

class ListOfofflineContact extends StatelessWidget {
   ListOfofflineContact({super.key});
  ContactsController listOfflineContactController=ContactsController();
  @override
  Widget build(BuildContext context) {
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
          "Offline Contaic header",
          textScaler: TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),

      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color:Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/1.65,

                        child: TextFormField(
                          cursorColor: Color(0xFF242B42),
                          style: TextStyle(fontSize: 13,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF191A26),
                          ),
                          // inputFormatters: [LengthLimitingTextInputFormatter(6)],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Search Contacts",
                            labelText:"Search Contacts",
                            hintStyle: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Constants.pimaryColor,
                            ),
                            labelStyle: TextStyle(fontSize: 14,
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
                        height: 35,
                        width: 90,
                        // padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
                        // margin: EdgeInsets.only(right:8,top: 8),
                        decoration: BoxDecoration(
                            color:Constants.pimaryColor,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: MaterialButton(
                          onPressed: () {

                          },
                          height: 35,
                          minWidth: 90,
                          child: Center(
                            child: Text(
                              "Search",textScaler: TextScaler.noScaling,style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25,),
              // Container(
              //   child: ListView.builder(
              //     itemCount: 5,
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemBuilder: (BuildContext context,int index) {
              //       return Column(
              //         children: [
              //           Obx(() => Container(
              //             width: double.infinity,
              //             margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
              //             decoration:BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: BorderRadius.circular(5),
              //                 boxShadow: [
              //                   BoxShadow(color:Colors.black38,
              //                       blurRadius: 4,
              //                       offset: Offset(2, 2))
              //                 ]
              //             ),
              //             child: ExpansionTile(
              //               title:  Text('MAHALAXMI(MX)',style: TextStyle(
              //                 color:listOfflineContactController.isExpanded.value?Colors.blue: Constants.blackColor,
              //               ),),
              //               trailing:listOfflineContactController.isExpanded.value? Icon(Icons.keyboard_arrow_up,size: 30,color: Colors.blue,):Icon(Icons.keyboard_arrow_down,size: 30,color: Colors.grey,),
              //               onExpansionChanged: (bool expanded) {
              //                 listOfflineContactController.toggleExpanded();
              //               },
              //               shape: InputBorder.none,
              //               expandedAlignment: Alignment.topLeft,
              //               childrenPadding: EdgeInsets.symmetric(horizontal: 20),
              //               children: <Widget>[
              //                 Text.rich(
              //                   TextSpan(
              //                       children: [
              //                         TextSpan(
              //                             text: "RLY",
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.w700,
              //                                 fontSize: 15,
              //                                 color: Colors.black
              //                             )
              //                         ),
              //                         TextSpan(
              //                             text: ":   ",
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.w500,
              //                                 fontSize: 13,
              //                                 color: Colors.black
              //                             )
              //                         ),
              //                         TextSpan(
              //                             text: "02222697310",
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.w400,
              //                                 fontSize: 13,
              //                                 color: Colors.black
              //                             )
              //                         )
              //                       ]
              //                   ),
              //                 ),
              //                 Text.rich(
              //                   TextSpan(
              //                       children: [
              //                         WidgetSpan(child:
              //                         Icon(Icons.store_mall_directory,color: Colors.black,)
              //                         ),
              //                         TextSpan(
              //                             text: ":  ",
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.w500,
              //                                 fontSize: 13,
              //                                 color: Colors.black
              //                             )
              //                         ),
              //                         TextSpan(
              //                             text: "02222697309",
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.w400,
              //                                 fontSize: 13,
              //                                 color: Colors.black
              //                             )
              //                         )
              //                       ]
              //                   ),
              //                 ),
              //                 Text.rich(
              //                   TextSpan(
              //                       children: [
              //                         WidgetSpan(child:
              //                         Icon(Icons.phone_enabled
              //                           ,color: Colors.black,)
              //                         ),
              //                         TextSpan(
              //                             text: ":",
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.w500,
              //                                 fontSize: 13,
              //                                 color: Colors.black
              //                             )
              //                         ),
              //                         TextSpan(
              //                             text: "02222620086",
              //                             style: TextStyle(
              //                                 fontWeight: FontWeight.w400,
              //                                 fontSize: 13,
              //                                 color: Colors.black
              //                             )
              //                         )
              //                       ]
              //                   ),
              //                 ),
              //                 SizedBox(height: 15,),
              //               ],
              //             ),
              //           ),),
              //         ],
              //       );
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
