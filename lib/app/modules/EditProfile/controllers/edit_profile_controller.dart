import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:serviceman/utils/Constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../routes/app_pages.dart';

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

  RxString name=''.obs;
  RxString railway=''.obs;
  RxString division=''.obs;
  RxString number=''.obs;
  RxString pfNumber=''.obs;
  RxString basicPay=''.obs;
  void getData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // await prefs.setString('UserDetail', json.encode(userDetails));
    name.value=await prefs.getString('UserName')!;
    railway.value= (await prefs.getString("railway"))!;
    division.value=(await prefs.getString("division"))!;
    number.value=(await prefs.getString("phone"))!;
    pfNumber.value=(await prefs.getString("pfNo"))!;
    basicPay.value=(await prefs.getString("basicPay"))!;
    print("======name.value=============${name.value}");
    print("======name.value=============${railway.value}");
    print("======name.value=============${number.value}");
    print("======name.value=============${division.value}");
    print("======name.value=============${pfNumber.value}");
    print("======name.value=============${basicPay.value}");
}
  @override
  void onInit() {
    getData();
    super.onInit();
  }
  Future<void> logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all shared preferences
    Get.offAllNamed(Routes.SIGN_IN);
  }

  Future<bool> showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title:Text("Logout"),
        content: Text('Are you sure you want to logout'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('No',style: TextStyle(
                color: Constants.pimaryColor
            ),),
          ),
          TextButton(
            onPressed: () => logout(context),
            child: Text('Yes',style: TextStyle(
                color: Constants.pimaryColor
            ),),
          ),
        ],
      ),
    ) ?? false;
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