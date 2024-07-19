import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:serviceman/app/modules/Contacts/views/listofofflinecontact.dart';

import '../../../../utils/Constant.dart';

class OfflineContact extends StatelessWidget {
  const OfflineContact({super.key});

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
          "Offline Contacts",
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
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "Favorite Contacts",style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    "All Contacts",style: TextStyle(
                      color: Constants.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                  ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: MediaQuery.of(context).size.height*0.76,
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
                child: ListView.builder(itemCount: 10,itemBuilder:
                    (context, index) {
                  return Column(children: [
                    GestureDetector(
                      onTap: () {
                         Get.to(ListOfofflineContact());
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
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
          
                              Row(
                                children: [
                                  Icon(Icons.star_border_outlined,color: Constants.pimaryColor,size: 35,),
                                  SizedBox(width: 25,),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width/1.8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("CONTROL OFFICE",
                                          maxLines:2,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Constants.blackColor,
                                              fontSize: 18
                                          ),),
                                        Text("25 Contacts",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16
                                          ),)
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Icon(Icons.arrow_circle_right_outlined,color: Constants.pimaryColor,size: 30,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],);
                },
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){},
        child: Icon(Icons.download,color: Constants.whiteColor,),
        backgroundColor: Constants.pimaryColor,
      ),
    );
  }
}
