import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serviceman/app/modules/Calculators/controllers/adlController.dart';

import '../../../../utils/Constant.dart';
import '../controllers/calculators_controller.dart';

class CalculatorsView extends GetView<CalculatorsController> {
   CalculatorsView({Key? key}) : super(key: key);
   CalculatorsController calculatorsController=CalculatorsController();
   MileageController mileageController=MileageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          leading: GestureDetector(
            onTap: () {
              Get.back();
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
            "Calculator",
            textScaler: TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 22),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFF2F2F2),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
            "Pick your Calculator",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
                          ),
              SizedBox(height: 5,),
              Container(
                height: 100,
                child:ListView.builder(itemCount:calculatorsController.calculatortype.length ,shrinkWrap: true,scrollDirection: Axis.horizontal,itemBuilder: (BuildContext context,int index) {
                  return InkWell(
                    onTap: () {
                      calculatorsController.setValue(index);
                      calculatorsController.setCalculateValue(calculatorsController.calculatortype[index].toString());

                    },
                    child:Container(
                      padding: EdgeInsets.symmetric(horizontal: 5,),
                      margin: EdgeInsets.only(right:5,top: 5),
                      // decoration: BoxDecoration(
                      //     color:calculatorsController.calculatortype[index].toString()==calculatorsController.calculatortypeValue.value? Constants.secondaryColor:Constants.pimaryColor,
                      //     borderRadius: BorderRadius.circular(5)
                      // ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(5),
                            decoration:BoxDecoration(
                              shape: BoxShape.circle,
                                color: Colors.white,
                                // borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color:Colors.black38,
                                      blurRadius: 4,
                                      offset: Offset(2, 2))
                                ]
                            ),
                            child: index%2==0?Icon(Icons.calculate_rounded,size: 45,color: Constants.pimaryColor,) :Icon(Icons.calculate_outlined,size: 45,color: Constants.pimaryColor,) ,
                          ),
                          Center(
                            child: Text(
                              calculatorsController.calculatortype[index].toString(),style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            ),
                          ),
                        ],
                      ),
                    )
                    );
                },
                ),
              ),
              SizedBox(height: 10,),
              Expanded(child:
              Obx(() => calculatorsController.listingScreens[calculatorsController.indexed.value]))
            ]
            )
          ),
        ));
  }
}


