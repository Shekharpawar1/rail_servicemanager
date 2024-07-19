import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/Constant.dart';
import '../../../../utils/images.dart';
import '../controllers/videos_controller.dart';

class VideosView extends GetView<VideosController> {
  const VideosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,),
        ),
        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Text("Videos",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body:Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                ProjectImage.notFound,
                width: 175,
                height: 175,
              ),
            ),
            SizedBox(height: 5,),
            Text("No Result Found!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
