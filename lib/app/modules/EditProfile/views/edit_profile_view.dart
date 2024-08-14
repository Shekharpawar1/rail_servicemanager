import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/_http/_io/_file_decoder_io.dart';
import 'package:serviceman/utils/Constant.dart';

import '../../../routes/app_pages.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
   EditProfileView({Key? key}) : super(key: key);
   EditProfileController editProfileController=Get.put(EditProfileController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.pimaryColor,
      appBar: AppBar(
        toolbarHeight: 75,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Container(
            margin: EdgeInsets.only(top: 18,bottom: 15),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                )
            ),
            child: Icon(Icons.arrow_back,color: Constants.pimaryColor,size: 25,),
          ),
        ),
        leadingWidth: 58,

        centerTitle: true,
        backgroundColor:Constants.pimaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Profile",style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.1,
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),),
          )
        ],
      ),
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              height: 180,
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Obx(()=>  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Text("${editProfileController.name.value}",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 20,
                    ),),
                      Text("${editProfileController.pfNumber.value}",style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey,
                        height: 0.9,
                        fontSize: 16,
                      ),),
                      Text("${editProfileController.basicPay.value}/-",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                      height: 0.9,
                      fontSize: 16,
                    ),),
                      Text("${editProfileController.railway.value}",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                      height: 0.9,
                      fontSize: 16,
                    ),),
                    Text("${editProfileController.division.value}",style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                      height: 0.9,
                      fontSize: 16,
                    ),),
                    Text("+91${editProfileController.number.value}",style: TextStyle(
                      letterSpacing: 0.1,
                      wordSpacing: 0.1,
                      height: 0.9,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey,
                      fontSize: 16,
                    ),)
                  ],)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 10,),
                      Container(

                        height: 90,
                        width: 90,
                        decoration:BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent,
                          border: Border.all(
                            color: Constants.pimaryColor,
                            width: 4
                          )
                        ),
                        child: Container(
                          margin: EdgeInsets.all(2,),
                            height: 55,
                            width: 55,
                            decoration:BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Colors.black,
                                  width: 2
                              ),
                            ),
                            child: Align(alignment: Alignment.bottomCenter,
                                child: Icon(Icons.perm_identity,size: 60,color: Colors.black,))),
                      ),
                      // SizedBox(height: 10,),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.CREATE_ACCOUNT,arguments: 'Edit Profile');
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
                           margin: EdgeInsets.only(right:8,top: 8),
                          decoration: BoxDecoration(
                              color:Constants.pimaryColor,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text(
                              "Edit Profile",style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),

                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 14,),
            SizedBox(
              // height: MediaQuery.of(context).size.height*0.75,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: controller.bank.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {

                    },
                    child:  Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(vertical:12,horizontal: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:
                                      controller.bank[index].image,
                                  ),
                                  // SizedBox(width: 5),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          controller.bank[index].title,
                                          textScaler: TextScaler.linear(1),
                                          style: TextStyle(
                                            height: 0.9,
                                            letterSpacing: 0.2,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            controller.bank[index].subtitle,
                                            textScaler: TextScaler.linear(1),
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(

                                              letterSpacing: 0.1,
                                              wordSpacing: 0.1,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13,
                                              color: Color(0xFF808D9E),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 25,
                                  color: Color(0xFFA5A9AB),
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 1,)
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 30,),
            Container(
              height: 40,
              width: 90,
              // padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
              margin: EdgeInsets.only(right:8,top: 8),
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: MaterialButton(
                onPressed: () {
                editProfileController.showExitConfirmationDialog(context);
                },
                height: 40,
                minWidth: 90,
                child: Center(
                  child: Text(
                    "Logout",textScaler: TextScaler.noScaling,style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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
