import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serviceman/utils/Constant.dart';
import 'package:serviceman/utils/images.dart';

import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;

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
     Services(img: Icon(Icons.phone,color: Constants.pimaryColor,size: 40,), title: "Contacts"),
     Services(img: Icon(Icons.train_sharp,color: Constants.pimaryColor,size: 40,), title: "Roster"),
     Services(img: Icon(Icons.history,color: Constants.pimaryColor,size: 40,), title: "Work\nHistory"),
     Services(img: Icon(Icons.receipt,color: Constants.pimaryColor,size: 40,), title: "Duty\nRecords"),
   ];
  final List servies2=[].obs;
  final List<Services2>ItemList2=[
    Services2(img: Icon(Icons.calculate_rounded,color: Constants.pimaryColor,size: 40,), title: "Calculator"),


  ];

  // final List<String>banner=[
  // ProjectImage.train2,
  //   ProjectImage.train3,
  //   ProjectImage.train4,
  // ];


  showModal(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return GridView.builder(
          padding: EdgeInsets.all(16.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
          ),
          itemCount: Menu.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap:
                Menu[index].onTap,

                // Handle selection of business source here
                // selectBusinesssource.value=businessSources[index];
                // print('Selected: ${businessSources[index]}');

              child: Column(
                children:[Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(3, 3))
                          ]),
                      child: Menu[index].img,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Menu[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1,
                          wordSpacing: 0.1,
                          height: 0.98),
                    ),

                  ],
                ),]
              )
            );
          },
        );
      },
    );
  }

  final List<String>banner2=[
    ProjectImage.trainN1,
    ProjectImage.trainN2,
    ProjectImage.trainN3,
  ];
RxList banner=[].obs;
RxBool isLoading=false.obs;
  RxList news=[].obs;
  Future<void> getBanners() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse('${Constants.Base_URL}banner'));
      print("Divy=================================>${response.statusCode }");
      if (response.statusCode == 200) {
        print("Divy=================================>${response.statusCode }");
        var data = json.decode(response.body);
        print("bannne===========${data['data']}");
        banner.value.addAll(data['data'].where((item) => item['type'] == 'banner').toList());
        news.value.addAll(data['data'].where((item) => item['type'] == 'news').toList());
        // news.value.addAll(RxList<String>.from(data['data'].where((item) => item['type'] == 'news').map((item) => item['file'])));
        // isLoading.value = false;
        print("bannne===========${banner.value}");

        print("news===========${news.value}");
        update();
      } else {
        print('Failed to load banners');
      }
    } catch (e) {
      print('Error in all table $e');
    }finally{
      isLoading.value=false;
    }
  }




  @override
  void onInit() {

    getBanners();
    print("bannner===========${banner.value.length}");
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




  List Menu=[
    //MenuList(img:Icon(Icons.home_rounded,color: Constants.pimaryColor,size: 40,),title: "Home",onTap:(){  Get.toNamed(Routes.HOME);}),
    MenuList(img:Icon(Icons.person,color: Constants.pimaryColor,size: 40,),title: "Edit Profile",onTap:(){  Get.back(); Get.toNamed(Routes.EDIT_PROFILE);}),
    MenuList(img:Icon(Icons.offline_pin,color: Constants.pimaryColor,size: 40,),title: "WTT",onTap:(){ Get.back(); Get.toNamed(Routes.OFFLINE_W_T_T);}),
    MenuList(img:Icon(Icons.offline_pin,color: Constants.pimaryColor,size: 40,),title: "SET",onTap:(){Get.back(); Get.toNamed(Routes.S_E_T_OFFLINE);}),
    MenuList(img:Icon(Icons.offline_pin,color: Constants.pimaryColor,size: 40,),title: "Contact",onTap:(){ Get.back(); Get.toNamed(Routes.CONTACTS);}),
    MenuList(img: Icon(  Icons.calculate,color: Constants.pimaryColor,size: 40,), title: "Calculator", onTap: () { Get.back(); Get.toNamed(Routes.CALCULATORS); }),
    MenuList(img: Icon(Icons.accessible,color: Constants.pimaryColor,size: 40,), title: "Rules &\nUpdates", onTap: () { Get.back();  Get.toNamed(Routes.RULES_AND_UPDATES);}),
    MenuList(img: Icon(Icons.file_copy,color: Constants.pimaryColor,size: 40,), title: "Forms", onTap: () {   Get.back();Get.toNamed(Routes.FORMS);}),
    MenuList(img: Icon(Icons.book,color: Constants.pimaryColor,size: 40,), title: "Books", onTap: () { Get.back(); Get.toNamed(Routes.BOOKS); }),
    MenuList(img: Icon(Icons.info,color: Constants.pimaryColor,size: 40,), title: "Service Profile", onTap: () { Get.back();  Get.toNamed(Routes.COMING_SOON); }),
    MenuList(img: Icon(  Icons.video_collection,color: Constants.pimaryColor,size: 40,), title: "Video", onTap: () {  Get.back();       Get.toNamed(Routes.VIDEOS); }),
    MenuList(img: Icon(  Icons.audio_file,color: Constants.pimaryColor,size: 40,), title: "Audio", onTap: () {  Get.back();       Get.toNamed(Routes.AUDIO); }),
    MenuList(img: Icon(  Icons.circle_notifications,color: Constants.pimaryColor,size: 40,), title: "Alert", onTap: () { Get.back(); Get.toNamed(Routes.ALERT); }),
    MenuList(img: Icon(  Icons.content_paste_go_outlined,color: Constants.pimaryColor,size: 40,), title: "Quiz", onTap: () { Get.back(); Get.toNamed(Routes.TEST); }),

  ];


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

class MenuList{
  Icon? img;
  String title;
  Function()? onTap;
  MenuList({
    required this.img,
    required this.title,
    required this.onTap,
  });
}