import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:serviceman/app/modules/SETOffline/controllers/s_e_t_offline_controller.dart';
import 'package:serviceman/component/cached_network_image.dart';

import '../../../../utils/Constant.dart';

class SetDetailss extends StatelessWidget {

  String image;
  String name;
  SetDetailss({required this.image,required this.name});
  SETOfflineController setOfflineController = Get.put(SETOfflineController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: GestureDetector(
          onTap: () {
             Get.back();
            // print("${image}");
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
        "Set No.${name}",
              textScaler: TextScaler.linear(1),
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w400,
                  fontSize: 22),
            )
      ),
      body:setOfflineController.isLoading.value?CircularProgressIndicator():Container(
        padding: EdgeInsets.all(10),
        child:Center(child: cached_network_image(image: "https://service-manager.digiatto.online/$image", fit:BoxFit.contain)),
      ),
    );
  }
}
