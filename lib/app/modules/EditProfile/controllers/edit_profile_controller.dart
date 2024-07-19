import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serviceman/utils/Constant.dart';

class EditProfileController extends GetxController {
  //TODO: Implement EditProfileController

  final count = 0.obs;


  final List bank = [
    CC(
      title:"Invite friends",
      subtitle: "Spread out your experience with your friends",
      image: Icon(Icons.share,color: Constants.pimaryColor,size: 40,),
    ),
    CC(
      title: "Get Help",
      subtitle: "We're 24/7 available for you, raise your query",
      image: Icon(Icons.not_listed_location_outlined,color: Constants.pimaryColor,size: 40,),
    ),
    // CC(
    //   title: "Donation History",
    //   subtitle: "History about you donation records",
    //   image: Images.donationpng,
    // ),
    CC(
      title: "Give us feedback",
      subtitle: "Share valuable feedback for upgrading",
      image: Icon(Icons.feedback,color: Constants.pimaryColor,size: 40,),
    ),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
class CC{
  String title;
  String subtitle;
  Icon? image;

  CC({
    required this.title,
    required this.subtitle,
    required this.image,
  });
}