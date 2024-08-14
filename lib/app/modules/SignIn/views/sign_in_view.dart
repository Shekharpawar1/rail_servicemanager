import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:serviceman/utils/images.dart';

import '../../../../utils/Constant.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
   SignInView({Key? key}) : super(key: key);
   SignInController signInController=SignInController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        backgroundColor: Color(0xFF042c6b),
            centerTitle: false,
            // F2F2F2),
        title:Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.train_sharp,color: Colors.white,size: 40,),
            SizedBox(width: 1,),
            Text("Service Manager",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w800,fontSize: 27
            ),),
          ],
        ),
        automaticallyImplyLeading: false,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body:Obx(()=>  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFFFFFFF),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 23,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10,),
                Image.asset(ProjectImage.welcome,height: 150,width: 150,),
                SizedBox(height: 18,),
                Container(
                  decoration: BoxDecoration(
                      color:signInController.isVisible.value? Color(0xFFF2F2F2):Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(10),
                     boxShadow: [
                       BoxShadow(
                         color: Colors.black26,
                         blurRadius: 3,
                           offset: Offset(2, 2),
                       )
                     ]
                  ),
                  child: Center(
                    child: TextFormField(
                      controller: signInController.phoneController,
                      cursorColor: Color(0xFF242B42),
                      cursorWidth: 1.5,
                      style: TextStyle(fontSize: 13,
                        fontFamily: 'Urbanist',
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF191A26),
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      readOnly: signInController.isVisible.value,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 12),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top:2.0),
                          child: Icon(Icons.phone,color: Constants.pimaryColor,),
                        ),
                        hintText: "Enter Phone Number",
                        hintStyle: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF7E8CA0),
                        ),
                        border: InputBorder.none,
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(
                        //       color: Color(0xFF992121), width: 1),
                        // ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
            
              signInController.isVisible.value?Container(
                child: Column(
                  children: [
            
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Please wait for OTP"),
                        SizedBox(
                            width: MediaQuery.of(context).size.width/2.5,
                            child: Divider(color: Color(0xFFF2F2F2),thickness: 1.1,))
                      ],
                    ),
                    SizedBox(height: 20,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         SizedBox(width: MediaQuery.of(context).size.width/2.5,
                           child: Container(
                             decoration: BoxDecoration(
                                 color:Color(0xFFFFFFFF),
                                 borderRadius: BorderRadius.circular(10),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.black26,
                                     blurRadius: 3,
                                     offset: Offset(2, 2),
                                   )
                                 ]
                             ),
                             child: TextFormField(
                               cursorColor: Color(0xFF242B42),
                               cursorWidth: 1.5,
                               style: TextStyle(fontSize: 13,
                                 fontFamily: 'Urbanist',
                                 fontWeight: FontWeight.w700,
                                 color: Color(0xFF191A26),
                               ),
                               controller: signInController.otpController,
                               inputFormatters: [LengthLimitingTextInputFormatter(6)],
                               keyboardType: TextInputType.number,
                               decoration: InputDecoration(
                                 contentPadding: EdgeInsets.symmetric(vertical: 10),
                                 prefixIcon: Padding(
                                   padding: const EdgeInsets.only(top:2.0),
                                   child: Icon(Icons.message,color: Constants.pimaryColor,),
                                 ),
                                 hintText: "Enter OTP",
                                 hintStyle: TextStyle(fontSize: 16,
                                   fontWeight: FontWeight.w400,
                                   color: Color(0xFF7E8CA0),
                                 ),
                                 border: InputBorder.none,
                                 // focusedBorder: UnderlineInputBorder(
                                 //   borderSide: BorderSide(
                                 //       color: Color(0xFF992121), width: 1),
                                 // ),
                               ),
                             ),
                           ),
                         ),
                         Container(
                           width: MediaQuery.of(context).size.width/2.5,
                           padding: EdgeInsets.only(left: 20),
                           child:  Obx(
                                 () => signInController.canResendOtp.value
                                 ? TextButton(
                               onPressed: signInController.resendOtp,
                               child: Text(
                                 "Resend OTP",
                                 style: TextStyle(
                                   color: Colors.blue, // Replace with your primary color
                                   fontSize: 16,
                                   fontWeight: FontWeight.w500,
                                 ),
                               ),
                             )
                                 : Obx(
                                       () => Text(
                               '${signInController.timer.value} Sec',
                               style: TextStyle(fontSize: 18),
                             )),
                           ),
                           // Obx(()=>Text(
                           //  '${signInController.timer.value} Sec',
                           //  style: TextStyle(fontSize: 18,),
                           //                   )),
                         ),
                       ],
                     ),
                    SizedBox(height: 30,),
                    MaterialButton(onPressed: () {
                      signInController.verifyOtp(signInController.otpController.text.trim());
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:45,
                      minWidth: 170,
                      color: Constants.pimaryColor,
                      child: Text("Verfiy",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ):Container(
                child: MaterialButton(onPressed: () {
                  if (signInController.validation(signInController.phoneController.text.trim())) {
                    if(signInController.phoneController.text.trim()=='123567890'){
                      signInController.Register();
                    }else{
                      signInController.sendOtp(signInController.phoneController.text.trim());
                    }

                  }
                  // signInController.Register();
                  },
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Constants.pimaryColor),
                    ),
                    height:45,
                    minWidth: 150,
                    color: Constants.pimaryColor,
                    child: Text("Get OTP",
                      style: TextStyle(
                        color:Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
              ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
