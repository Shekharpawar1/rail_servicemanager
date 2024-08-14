import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:serviceman/utils/images.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.25,),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                ProjectImage.logo,
                width: 125,
                height: 125,
              ),
            ),
            SizedBox(height: 10),
            Text("Service Manager",style: TextStyle(color: Color(0xFF042c6b),fontWeight: FontWeight.w900,fontSize: 25),),
            // SizedBox(height: 10,),

             SizedBox(height: MediaQuery.of(context).size.height*0.16,),
            CircularProgressIndicator(
              backgroundColor:Color(0xFF042c6b),
              color: Color(0xFFAC1013),
            ),
            SizedBox(height: 80),
            // SizedBox(height: 130,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Made in India",textAlign: TextAlign.left,style: TextStyle(
                  fontSize: 15,
                  color:Color(0xFF042c6b),
                  fontWeight: FontWeight.w500
                ),),
                SizedBox(width:5,),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                    child: SvgPicture.asset(ProjectImage.flag)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
