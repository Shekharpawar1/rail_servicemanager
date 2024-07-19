import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:serviceman/app/modules/Calculators/controllers/adlController.dart';

import '../../../../../utils/Constant.dart';
import '../../controllers/calculators_controller.dart';

class ADL extends StatelessWidget {
  ADL({super.key});
  AdlController adlController=AdlController();
  var myFromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color:Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]
            ),
            child:Form(
              key: myFromKey,
              child: Column(
                children: [
                  Text("Calculate your ADL ALL",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "Basic pay cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      adlController.value1.value = double.tryParse(value) ?? 0.0;
                    },
                    controller: adlController.adlAllpayController,
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter Basic Pay",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter Basic Pay",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    onChanged: (value) {
                      adlController.value2.value = double.tryParse(value) ?? 0.0;
                    },
                    validator: (value) {
                      if(value==""||value==null){
                        return "DA cannot be empty";
                      }
                      return null;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    controller: adlController.adlAlldaController,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter DA%",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter DA%",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: MaterialButton(onPressed: () {
                       if(myFromKey.currentState!.validate()){
                         adlController.calculatePercentage();
                       };
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:40,
                      color: Constants.pimaryColor,
                      child: Text("Calculate",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                 adlController.result.value==0.0?SizedBox():Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal:20),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child:Obx(() => Text('${adlController.result.value.toStringAsFixed(2)}/-',style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20,),
        ],
      ),
    ));
  }
}


class DA extends StatelessWidget {
  DA({super.key});
  DaController daController=DaController();
  var myFromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color:Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]
            ),
            child:Form(
              key: myFromKey,
              child: Column(
                children: [
                  Text("Calculate your DA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "Basic pay cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      daController.value1.value = double.tryParse(value) ?? 0.0;
                    },
                    controller: daController.dapayController,
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter Basic Pay",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter Basic Pay",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    onChanged: (value) {
                      daController.value2.value = double.tryParse(value) ?? 0.0;
                    },
                    validator: (value) {
                      if(value==""||value==null){
                        return "DA cannot be empty";
                      }
                      return null;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    controller: daController.daDaController,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter DA%",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter DA%",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: MaterialButton(onPressed: () {
                      if(myFromKey.currentState!.validate()){
                        daController.calculatePercentage();
                      };
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:40,
                      color: Constants.pimaryColor,
                      child: Text("Calculate",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  daController.result.value==0.0?SizedBox():Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal:20),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child:Obx(() => Text('${daController.result.value.toStringAsFixed(2)}',style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20,),
        ],
      ),
    ));
  }
}

class Basic extends StatelessWidget {
  Basic({super.key});
  BasicController basicController=BasicController();
  var myFromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color:Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]
            ),
            child:Form(
              key: myFromKey,
              child: Column(
                children: [
                  Text("Calculate your Basic",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "Basic pay cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      basicController.value1.value = double.tryParse(value) ?? 0.0;
                    },
                    controller: basicController.basicpayController,
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter Basic Pay",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter Basic Pay",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: MaterialButton(onPressed: () {
                      if(myFromKey.currentState!.validate()){
                        basicController.calculatePercentage();
                      };
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:40,
                      color: Constants.pimaryColor,
                      child: Text("Calculate",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  basicController.result.value==0.0?SizedBox():Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal:20),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child:Obx(() => Text('${basicController.result.value.toStringAsFixed(2)}',style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20,),
        ],
      ),
    ));
  }
}

class HRA extends StatelessWidget {
  HRA({super.key});
  HRAController hraController=HRAController();
  var myFromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color:Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]
            ),
            child:Form(
              key: myFromKey,
              child: Column(
                children: [
                  Text("Calculate your HRA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "Basic pay cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      hraController.value1.value = double.tryParse(value) ?? 0.0;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter Basic Pay",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter Basic Pay",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    onChanged: (value) {
                      hraController.value2.value = double.tryParse(value) ?? 0.0;
                    },
                    validator: (value) {
                      if(value==""||value==null){
                        return "HRA cannot be empty";
                      }
                      return null;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter HRA%",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter HRA%",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: MaterialButton(onPressed: () {
                      if(myFromKey.currentState!.validate()){
                        hraController.calculatePercentage();
                      };
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:40,
                      color: Constants.pimaryColor,
                      child: Text("Calculate",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  hraController.result.value==0.0?SizedBox():Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal:20),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child:Obx(() => Text('${hraController.result.value.toStringAsFixed(2)}',style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20,),
        ],
      ),
    ));
  }
}


class Mileage extends StatelessWidget {
  Mileage({super.key});
  MileageController mileageController=MileageController();
  var myFromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Text("Select your Group",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400),),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 20,),
              GestureDetector(
                onTap: () => mileageController.selectValue1('Motormen'),
                child: Obx(() => Container(
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 10,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: mileageController.selectedValue1.value == 'Motormen'
                        ? Constants.secondaryColor
                        : Constants.pimaryColor,
                  ),

                  child: Center(
                    child: Text(
                      'Motormen',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                )),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => mileageController.selectValue1('Guard'),
                child: Obx(() => Container(
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 10,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: mileageController.selectedValue1.value == 'Guard'
                        ? Constants.secondaryColor
                        : Constants.pimaryColor,
                  ),

                  child: Center(
                    child: Text(
                      'Guard',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                )),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () => mileageController.selectValue1('Sub-Guard'),
                child: Obx(() => Container(
                  height: 35,
                  padding: EdgeInsets.symmetric(horizontal: 10,),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: mileageController.selectedValue1.value == 'Sub-Guard'
                        ? Constants.secondaryColor
                        : Constants.pimaryColor,
                  ),

                  child: Center(
                    child: Text(
                      'Sub-Guard',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                )),
              ),
              SizedBox(width: 20,),
            ],
          ),
          SizedBox(height: 10,),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color:Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]
            ),
            child:Form(
              key: myFromKey,
              child: Column(
                children: [
                  Text("Calculate your Mileage",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "Kilometer cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      mileageController.value1.value = double.tryParse(value) ?? 0.0;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter Kilometer",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter Kilometer",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: MaterialButton(onPressed: () {
                      if(myFromKey.currentState!.validate()){
                        mileageController.calculatePercentage();
                      };
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:40,
                      color: Constants.pimaryColor,
                      child: Text("Calculate",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  mileageController.result.value==0.0?SizedBox():Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal:20),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child:Obx(() => Text('${mileageController.result.value.toStringAsFixed(2)}',style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20,),
        ],
      ),
    ));
  }
}

class NDA extends StatelessWidget {
  NDA({super.key});
  NDAController ndaController=NDAController();
  var myFromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color:Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]
            ),
            child:Form(
              key: myFromKey,
              child: Column(
                children: [
                  Text("Calculate your NDA",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                          ),
                          validator: (value) {
                            if(value==""||value==null){
                              return "Hours cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            ndaController.value1.value = double.tryParse(value) ?? 0.0;
                          },
                          cursorColor: Colors.blue,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 2),
                            labelText: "Hours",
                            labelStyle:TextStyle(
                              color:Constants.pimaryColor,
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                            ),
                            hintText: "Hours",
                            hintStyle: TextStyle(
                              color:Colors.grey,
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                            ),
                            floatingLabelStyle: TextStyle(
                              color:Constants.pimaryColor,
                              fontSize:14,
                              fontWeight:FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red,width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Constants.pimaryColor, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                          ),
                          onChanged: (value) {
                            ndaController.value2.value = double.tryParse(value) ?? 0.0;
                          },
                          validator: (value) {
                            if(value==""||value==null){
                              return "Minutes cannot be empty";
                            }
                            return null;
                          },
                          cursorColor: Colors.blue,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 2),
                            labelText: "Minutes",
                            labelStyle:TextStyle(
                              color:Constants.pimaryColor,
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                            ),
                            hintText: "Minutes",
                            hintStyle: TextStyle(
                              color:Colors.grey,
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                            ),
                            floatingLabelStyle: TextStyle(
                              color:Constants.pimaryColor,
                              fontSize:14,
                              fontWeight:FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red,width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Constants.pimaryColor, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 25,),
                  Center(
                    child: MaterialButton(onPressed: () {
                      if(myFromKey.currentState!.validate()){
                        ndaController.calculatePercentage();
                      };
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:40,
                      color: Constants.pimaryColor,
                      child: Text("Calculate",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  ndaController.result.value==0.0?SizedBox():Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal:20),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child:Obx(() => Text('${ndaController.result.value.toStringAsFixed(2)}',style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20,),
        ],
      ),
    ));
  }
}


class OT extends StatelessWidget {
  OT({super.key});
  OtController otController=OtController();
  var myFromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color:Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]
            ),
            child:Form(
              key: myFromKey,
              child: Column(
                children: [
                  Text("Calculate your OT",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "Basic pay cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      otController.value1.value = double.tryParse(value) ?? 0.0;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter Basic Pay",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter Basic Pay",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "TA cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      otController.value2.value = double.tryParse(value) ?? 0.0;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter TA",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter TA",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "DA cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      otController.value3.value = double.tryParse(value) ?? 0.0;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter DA%",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter DA%",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                          ),
                          validator: (value) {
                            if(value==""||value==null){
                              return "Hours cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            otController.value4.value = double.tryParse(value) ?? 0.0;
                          },
                          cursorColor: Colors.blue,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 2),
                            labelText: "Hours",
                            labelStyle:TextStyle(
                              color:Constants.pimaryColor,
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                            ),
                            hintText: "Hours",
                            hintStyle: TextStyle(
                              color:Colors.grey,
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                            ),
                            floatingLabelStyle: TextStyle(
                              color:Constants.pimaryColor,
                              fontSize:14,
                              fontWeight:FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red,width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Constants.pimaryColor, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15,),
                      SizedBox(
                        width: 120,
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14
                          ),
                          onChanged: (value) {
                            otController.value5.value = double.tryParse(value) ?? 0.0;
                          },
                          validator: (value) {
                            if(value==""||value==null){
                              return "Minutes cannot be empty";
                            }
                            return null;
                          },
                          cursorColor: Colors.blue,
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.number,
                          // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 2),
                            labelText: "Minutes",
                            labelStyle:TextStyle(
                              color:Constants.pimaryColor,
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                            ),
                            hintText: "Minutes",
                            hintStyle: TextStyle(
                              color:Colors.grey,
                              fontSize:16,
                              fontWeight:FontWeight.w400,
                            ),
                            floatingLabelStyle: TextStyle(
                              color:Constants.pimaryColor,
                              fontSize:14,
                              fontWeight:FontWeight.w400,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red,width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey,width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              BorderSide(color: Constants.pimaryColor, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Center(
                    child: MaterialButton(onPressed: () {
                      if(myFromKey.currentState!.validate()){
                        otController.calculatePercentage();
                      };
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:40,
                      color: Constants.pimaryColor,
                      child: Text("Calculate",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  otController.result.value==0.0?SizedBox():Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal:20),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child:Obx(() => Text('${otController.result.value.toStringAsFixed(2)}',style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20,),
        ],
      ),
    ));
  }
}

class TranAll extends StatelessWidget {
  TranAll({super.key});
  TranAllController tranAllController=TranAllController();
  var myFromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() =>  SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.symmetric(horizontal:20),
            decoration:BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(color:Colors.black38,
                      blurRadius: 4,
                      offset: Offset(2, 2))
                ]
            ),
            child:Form(
              key: myFromKey,
              child: Column(
                children: [
                  Text("Calculate your TRAN ALL",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                  SizedBox(height: 10,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    validator: (value) {
                      if(value==""||value==null){
                        return "TA Basic pay cannot be empty";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      tranAllController.value1.value = double.tryParse(value) ?? 0.0;
                    },
                    controller: tranAllController.tranAllpayController,
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter TA Basic Pay",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter TA Basic Pay",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14
                    ),
                    onChanged: (value) {
                      tranAllController.value2.value = double.tryParse(value) ?? 0.0;
                    },
                    validator: (value) {
                      if(value==""||value==null){
                        return "DA cannot be empty";
                      }
                      return null;
                    },
                    cursorColor: Colors.blue,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    controller: tranAllController.tranAlldaController,
                    // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 2),
                      labelText: "Enter DA%",
                      labelStyle:TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      hintText: "Enter DA%",
                      hintStyle: TextStyle(
                        color:Colors.grey,
                        fontSize:16,
                        fontWeight:FontWeight.w400,
                      ),
                      floatingLabelStyle: TextStyle(
                        color:Constants.pimaryColor,
                        fontSize:14,
                        fontWeight:FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red,width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey,width: 1.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Constants.pimaryColor, width: 1.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  Center(
                    child: MaterialButton(onPressed: () {
                      if(myFromKey.currentState!.validate()){
                        tranAllController.calculatePercentage();
                      };
                    },
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: Constants.pimaryColor),
                      ),
                      height:40,
                      color: Constants.pimaryColor,
                      child: Text("Calculate",
                        style: TextStyle(
                          color:Colors.white,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  tranAllController.result.value==0.0?SizedBox():Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal:20),
                    decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(color:Colors.black38,
                              blurRadius: 4,
                              offset: Offset(2, 2))
                        ]
                    ),
                    child:Obx(() => Text('${tranAllController.result.value.toStringAsFixed(2)}/-',style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w500,fontSize: 18),)),
                  ),
                ],
              ),
            ),
          ),
          Container(height: 20,),
        ],
      ),
    ));
  }
}