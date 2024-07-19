import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serviceman/app/modules/Contacts/views/offlinecontact.dart';
import 'package:serviceman/app/routes/app_pages.dart';
import 'package:serviceman/utils/Constant.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({Key? key}) : super(key: key);
  HomeController homeController=HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.pimaryColor,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: GestureDetector(
          onTap: () {
            Get.toNamed(Routes.EDIT_PROFILE);
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              )
            ),
            child: Icon(Icons.person,color: Colors.black,size: 25,),
          ),
        ),
        automaticallyImplyLeading: false,
        leadingWidth: 45,

        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.train_sharp,color: Colors.white,size: 30,),
            SizedBox(width: 1,),
            Text("Service Manager",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: GoogleFonts.josefinSlab(color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w800,fontSize: 26
            ),),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
            // margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                )
            ),
            child: Icon(Icons.alarm_on_outlined,color: Colors.black,size: 25,),
          ),
        ],
      ),
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Constants.pimaryColor,
              child:Align(
                alignment: Alignment.topCenter,
                child: Text("Welcome Back!, mohit",style: TextStyle(
                  letterSpacing: 0.1,
                  wordSpacing: 0.1,
                  color: Colors.white,
                  fontSize: 18
                ),),
              ) ,
            ),
            SizedBox(height: 15,),
            Container(
              // height: MediaQuery.of(context).size.height,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadiusDirectional.vertical(top: Radius.circular(23),),
              ),
              child: Padding(
                padding:  EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 12,),
                      Stack(
                        children: [
                          CarouselSlider.builder(itemCount: controller.banner.length,itemBuilder: (context, index, realIndex) {
                            return Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0,vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black26,
                                        blurRadius: 4,
                                        offset: Offset(2, 2)
                                    ),

                                  ]),
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(20),
                                child: Image.asset(
                                  controller.banner[index],
                                  fit: BoxFit.fill,

                                  // width: double.infinity,
                                ),
                              ),
                            );
                          },
                            options: CarouselOptions(
                              enlargeFactor: 0.0,
                              autoPlay: true,
                              autoPlayAnimationDuration:
                              Duration(seconds: 1),
                              height: 150,
                              // MediaQuery
                              // .of(context)
                              // .size
                              // .height *0.305,
                              enlargeCenterPage: true,
                              viewportFraction: 0.98,
                              onPageChanged: (index, reason) {
                                controller.activeSlide.value = index;
                              },
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: MediaQuery.of(context).size.width/2.5,
                              child:Obx(()=> DotsIndicator(
                                dotsCount: controller.banner.length,
                                position: controller.activeSlide.value,
                                decorator: DotsDecorator(
                                  color: Constants.pimaryColor, // Inactive color
                                  activeColor: Color(0xFFAC1013),
                                ),
                              ))),
                        ],
                      ),
                      SizedBox(height: 38,),
                      Container(
                        height: 90,
                         margin: EdgeInsets.symmetric(horizontal: 8),
                        // padding: EdgeInsets.all(20),
                        child: GridView.builder(
                           physics: NeverScrollableScrollPhysics(),
                          itemCount: homeController.ItemList.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 4,
                          mainAxisSpacing: 12,
                          // crossAxisSpacing: 15,
                          childAspectRatio: 0.7,), itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if(index==0){
                                Get.toNamed(Routes.ROASTER);
                              }else if(index==1){
                                Get.toNamed(Routes.WORKING_HISTORY);
                              }else if(index==2){
                                Get.toNamed(Routes.DUTY_RECORDS);
                              }else if(index==3){
                                Get.toNamed(Routes.CONTACTS);
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 2),
                                  padding: EdgeInsets.all(4),
                                  decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(color:Colors.black38,
                                            blurRadius: 4,
                                            offset: Offset(3, 3)
                                        )
                                      ]
                                  ),
                                  child: homeController.ItemList[index].img,
                                ),
                                SizedBox(height: 10,),
                                Text(homeController.ItemList[index].title,textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: 11,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.1,
                                  wordSpacing: 0.1,
                                  height: 0.98
                                ),),
                                index==0? Text("Updating",textAlign: TextAlign.center,style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.1,
                                    wordSpacing: 0.1,
                                ),):SizedBox(),
                              ],
                            ),
                          );
                        },),
                      ),
                      SizedBox(height: 5,),
                      Divider(color: Color(0xFFF2F2F2),thickness: 1.1,),
                      SizedBox(height: 15,),
                      Container(
                        height: 90,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        // padding: EdgeInsets.all(20),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: homeController.ItemList.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 4,
                          mainAxisSpacing: 12,
                          // crossAxisSpacing: 15,
                          childAspectRatio: 0.7,), itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if(index==0){
                                Get.toNamed(Routes.RULES_AND_UPDATES);
                              }else if(index==1){
                                Get.toNamed(Routes.FORMS);
                              }else if(index==2){
                                Get.toNamed(Routes.BOOKS);
                              }else if(index==3){
                                Get.toNamed(Routes.CALCULATORS);
                              }
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 2),
                                  padding: EdgeInsets.all(4),
                                  decoration:BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(color:Colors.black38,
                                            blurRadius: 4,
                                            offset: Offset(2, 2))
                                      ]
                                  ),
                                  child: homeController.ItemList2[index].img,
                                ),
                                SizedBox(height: 10,),
                                Text(homeController.ItemList2[index].title,textAlign: TextAlign.center,style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.1,
                                    wordSpacing: 0.1,
                                    height: 0.98
                                ),),

                              ],
                            ),
                          );
                        },),
                      ),
                      SizedBox(height: 10,),
                      Divider(color: Colors.grey.withOpacity(0.3),thickness: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "NEWS",
                              textScaler: TextScaler.linear(1),
                              style: TextStyle(
                                  color:Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            InkWell(
                              onTap: () {
                              },
                              child: Text(
                                "See All",
                                textScaler: TextScaler.linear(1),
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                    color: Colors.black,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 110,
                        // color: Colors.red,
                         margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.only(left: 18,),
                        child:ListView.builder(itemCount:controller.banner2.length ,shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context,int index) {
                          return InkWell(
                            onTap: () {

                              // createAccountController.setDropValue(createAccountController.UserGroup[index].toString());
                            },
                            child:Container(
                              width: MediaQuery.of(context)
                                  .size
                                  .width*0.8,
                              height: 50,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 5.0,vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                     offset: Offset(2, 2),
                                    blurRadius: 3)
                                  ]),
                              child: Image.asset(
                                controller.banner2[index],
                                fit: BoxFit.fill,
                                height: 50,
                                // width: double.infinity,
                              ),
                            )
                          );
                        },
                        ),
                      ),
                       SizedBox(height: 10,),
                      Divider(color: Colors.grey.withOpacity(0.3),thickness: 10,),
                      SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: 80,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.COMING_SOON);
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.info,color: Constants.pimaryColor,),
                                  Text("Service Profile",textAlign: TextAlign.center,style: TextStyle(
                                    fontSize: 11,
                                    letterSpacing: 0.1,
                                    wordSpacing: 0.1
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.VIDEOS);
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.video_collection,color: Constants.pimaryColor,),
                                  Text("Video",style: TextStyle(
                                      fontSize: 11
                                  ),),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: InkWell(
                              onTap: () {
                                Get.toNamed(Routes.COMING_SOON);
                              },
                              child: Column(
                                children: [
                                  Icon(Icons.circle_notifications,color: Constants.pimaryColor,),
                                  Text("Alerts",style: TextStyle(
                                      fontSize: 11
                                  ),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
            color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black38,blurRadius: 3)
          ]
        ),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home_rounded,color: Color(0xFFAC1013),),
                  Text("Home",style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.1,
                      wordSpacing: 0.1
                  ),),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.OFFLINE_W_T_T);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.offline_pin,color: Constants.pimaryColor,),
                    Text("WTT",style: TextStyle(
                        fontSize: 14,color: Colors.black
                    ),),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.S_E_T_OFFLINE);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.offline_pin,color: Constants.pimaryColor,),
                    Text("SET",style: TextStyle(
                        fontSize: 14,
                      color: Colors.black
                    ),),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(OfflineContact());
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.offline_pin,color: Constants.pimaryColor,),
                    Text("Contact",style: TextStyle(
                        fontSize: 14,
                      color: Colors.black
                    ),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
