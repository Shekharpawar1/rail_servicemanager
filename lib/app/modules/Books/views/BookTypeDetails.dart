import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/Constant.dart';

class BookTypeDetails extends StatelessWidget {
  const BookTypeDetails({super.key});

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
            "GUARD EMU BOOKS",
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
          child:  SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: ListView.builder(itemCount: 3,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder:
                      (context, index) {
                    return Column(children: [
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 15),
                          margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
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
                            padding: const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.file_copy,color: Colors.teal,size: 35,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Hindi BHEL AIR CONDITIONED EMU FOR GUARD-Copy",
                                        style: TextStyle(
                                            color: Constants.blackColor,
                                            fontSize: 16,
                                            height: 0.98
                                        ),),
                                    ],
                                  ),
                                ),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Constants.pimaryColor.withOpacity(0.9),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(Icons.download_for_offline,color: Constants.whiteColor,size: 25,),
                                        SizedBox(width: 20,),
                                        Icon(Icons.remove_red_eye,color: Constants.whiteColor,size: 25,),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],);
                  },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
