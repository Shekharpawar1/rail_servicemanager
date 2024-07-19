

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/Constant.dart';
import '../../../../utils/images.dart';
import '../../../routes/app_pages.dart';
import '../controllers/create_account_controller.dart';

class CreateAccountView extends GetView<CreateAccountController> {
   CreateAccountView({Key? key}) : super(key: key);
   CreateAccountController createAccountController=CreateAccountController();
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
            Text("Service Manager",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: GoogleFonts.josefinSlab(color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w800,fontSize: 27
            ),),
          ],
        ),
        automaticallyImplyLeading: false,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body:  Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color(0xFFFFFFFF),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8,),
              Center(
                child: Text(
                  'Join Service Manager!',
                  style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.1,

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Center(child: Image.asset(ProjectImage.welcome,height: 100,width: 120,)),
              SizedBox(height: 18,),
              Container(
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(vertical: 10),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(top:2.0),
                      child: Icon(Icons.person,color: Constants.pimaryColor,),
                    ),
                    hintText: "Full Name",
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
              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    color:Color(0xFFF2F2F2),
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
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  readOnly: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    // contentPadding: EdgeInsets.symmetric(vertical: 10),
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
              SizedBox(height: 15,),
              Text("User group:",textAlign:TextAlign.start,style: TextStyle(
                fontSize: 16,
                color: Colors.black
              ),),
              Container(
                height: 35,
                child:ListView.builder(itemCount:createAccountController.UserGroup.length ,shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context,int index) {
                  return InkWell(
                    onTap: () {
                      createAccountController.setDropValue(createAccountController.UserGroup[index].toString());
                    },
                    child:Obx(()=>Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      margin: EdgeInsets.only(right:8,top: 5),
                      decoration: BoxDecoration(
                          color:createAccountController.UserGroup[index].toString()==createAccountController.usergroupValue.value? Constants.pimaryColor:Colors.black.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                            createAccountController.UserGroup[index].toString(),style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        ),
                      ),
                    )
                    ),
                  );
                },
    ),
              ),
              SizedBox(height: 25,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Railways:",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => createAccountController.selectValue('WR'),
                child: Obx(() => Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    color: createAccountController.selectedValue.value == 'WR'
                        ? Constants.pimaryColor
                        : Colors.black.withOpacity(0.75),
                  ),
                 
                  child: Center(
                    child: Text(
                      'WR',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                )),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => createAccountController.selectValue('CR'),
                child: Obx(() => Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: createAccountController.selectedValue.value == 'CR'
                        ? Constants.pimaryColor
                        : Colors.black.withOpacity(0.75),
                  ),
                  
                  child: Center(
                    child: Text(
                      'CR',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                )),
              ),
            ],
          ),],
              ),
              SizedBox(height: 12,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Division:",style: TextStyle(
                      fontSize: 16,
                      color: Colors.black
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => createAccountController.selectValue1('CSMT'),
                        child: Obx(() => Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: createAccountController.selectedValue1.value == 'CSMT'
                                ? Constants.pimaryColor
                                : Colors.black.withOpacity(0.75),
                          ),

                          child: Center(
                            child: Text(
                              'CSMT',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        )),
                      ),
                      SizedBox(width: 20),
                      GestureDetector(
                        onTap: () => createAccountController.selectValue1('CCG'),
                        child: Obx(() => Container(
                          height: 30,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: createAccountController.selectedValue1.value == 'CCG'
                                ? Constants.pimaryColor
                                : Colors.black.withOpacity(0.75),
                          ),

                          child: Center(
                            child: Text(
                              'CCG',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ),
                        )),
                      ),
                    ],
                  ),],
              ),
              SizedBox(height: 15,),
              Center(
                child: Container(
                  width: 250,
                  height: 50,
                  alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color:Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                            offset: Offset(2, 2),
                          )
                        ]
                    ),
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                      child:
                      Obx(()=>Center(
                        child: DropdownButton(
                          items:
                          createAccountController.DepoType
                              .map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    textScaler: TextScaler.linear(1),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                );
                              }).toList(),
                          onChanged: (value) {
                            createAccountController
                                .setDropdownValue(value.toString());
                          },
                          value: createAccountController
                              .dropdownValue.value,
                          icon: Icon(
                            Icons.arrow_drop_down,
                           size: 25,
                          ),
                          iconSize: 16,
                          elevation: 16,
                          isExpanded: true,
                          underline: Container(),
                        ),
                      )))),
              ),
              SizedBox(height: 22,),
              Center(
                child: MaterialButton(onPressed: () {
                    Get.offAllNamed(Routes.HOME);
                },
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Constants.pimaryColor),
                  ),
                  height:45,
                  minWidth: 190,
                  color: Constants.pimaryColor,
                  child: Text("Create Account",
                    style: TextStyle(
                      color:Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35,),
            ],
          ),
        ),
      ),
    ));
  }
}
