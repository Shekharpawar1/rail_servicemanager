import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serviceman/utils/Constant.dart';
import 'package:serviceman/utils/images.dart';

import '../controllers/coming_soon_controller.dart';

class ComingSoonView extends GetView<ComingSoonController> {
  const ComingSoonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          automaticallyImplyLeading: false,
          leadingWidth: 45,
          centerTitle: true,
          backgroundColor: Constants.pimaryColor,
          title: Text(
            "Coming Soon",
            textScaleFactor: 1.0,
            style: TextStyle(
                letterSpacing: 0.1,
                wordSpacing: 0.1,
                color: Colors.white,
                fontSize: 18),
          ),
        ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 180,),
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                ProjectImage.comingSoon,
                width: 225,
                height: 225,
              ),
            ),
            SizedBox(height: 15),
            Text("Coming Soon",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 20),),
            SizedBox(height: 5,),
            Text("We are still working on it!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 12),),
            SizedBox(height: 30,),
            Container(
              height: 40,
              width: 90,
              // padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
              margin: EdgeInsets.only(right:8,top: 8),
              decoration: BoxDecoration(
                  color:Constants.pimaryColor,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: MaterialButton(
                onPressed: () {
               Get.back();
                },
                height: 40,
                minWidth: 100,
                child: Center(
                  child: Text(
                    "Go Back",textScaler: TextScaler.noScaling,style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
