import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviceman/utils/Constant.dart';
import 'package:serviceman/utils/images.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  var activeSlide = 0.obs;
  var currentIndex = 0.obs;


  void changeIndex(int index) {
    currentIndex.value = index;
  }

  final List servies=[].obs;
   final List<Services>ItemList=[
     Services(img: Icon(Icons.train_sharp,color: Constants.pimaryColor,size: 40,), title: "Roster"),
     Services(img: Icon(Icons.history,color: Constants.pimaryColor,size: 40,), title: "Work\nHistory"),
     Services(img: Icon(Icons.receipt,color: Constants.pimaryColor,size: 40,), title: "Duty\nRecords"),
     Services(img: Icon(Icons.phone,color: Constants.pimaryColor,size: 40,), title: "Important\nContacts"),
   ];
  final List servies2=[].obs;
  final List<Services2>ItemList2=[
    Services2(img: Icon(Icons.accessible,color: Constants.pimaryColor,size: 40,), title: "Rules &\nUpdates"),
    Services2(img: Icon(Icons.file_copy,color: Constants.pimaryColor,size: 40,), title: "Forms"),
    Services2(img: Icon(Icons.book,color: Constants.pimaryColor,size: 40,), title: "Books"),
    Services2(img: Icon(Icons.calculate_rounded,color: Constants.pimaryColor,size: 40,), title: "Calculator"),
  ];

  final List<String>banner=[
  ProjectImage.train2,
    ProjectImage.train3,
    ProjectImage.train4,
  ];

  final List<String>banner2=[
    ProjectImage.trainN1,
    ProjectImage.trainN2,
    ProjectImage.trainN3,
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
class Services{
  Icon? img;
  String title;
  Services({
    required this.img,
    required this.title
});
}

class Services2{
  Icon? img;
  String title;
  Services2({
    required this.img,
    required this.title
  });
}