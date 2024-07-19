import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:serviceman/app/modules/DutyRecords/controllers/leavepage_controller.dart';
import 'package:serviceman/component/common_textformfield.dart';

import '../../../../../utils/Constant.dart';

class LeavePageView extends StatelessWidget {
   LeavePageView({super.key});
  LeavePageController leavepageController=Get.put(LeavePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 58,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,),
        ),
        centerTitle: false,
        backgroundColor: Constants.pimaryColor,
        title: Text("Leave",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Colors.blue
                        )
                    ),
                    onPressed: () {
                      leavepageController.selectCurrentDate();
                    },
                    height: 38,
                    minWidth: 78,
                    color: Colors.blue,
                    child: Center(
                        child:Text("Today",style: TextStyle(
                          color: Constants.whiteColor,
                          fontSize: 16
                        ),)
                    ),
                  ),
                  SizedBox(width: 60,),
                  MaterialButton(
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                            color: Constants.blackColor
                        )
                    ),
                    onPressed: () {
                      leavepageController.selectDate(context);
                    },
                    height: 38,
                    minWidth: 78,
                    color: Constants.blackColor,
                    child: Center(
                        child:Text("Pick Date",style: TextStyle(
                            color: Constants.whiteColor,
                            fontSize: 16
                        ),),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Obx(() => Text("Selected Date: ${DateFormat('dd-MM-yyyy').format(leavepageController.selectedDate.value).toString()}")),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CommonTextFormField(labletext: "Reason", keyboardTypes: TextInputType.text, controller:leavepageController.raesonController,maxline: 5,),
              ),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(left: 30),
                    width: 130,
                    height: 45,
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
                            leavepageController.LeaveType
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
                              leavepageController.setDropdownValue(value.toString());
                            },
                            value: leavepageController
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
          SizedBox(
            height: 20,),
              SizedBox(
                width: 120,
                child: MaterialButton(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                          color: Constants.pimaryColor
                      )
                  ),
                  onPressed: () {
                    leavepageController.selectDate(context);
                  },
                  height: 38,
                  minWidth: 90,
                  color: Constants.pimaryColor,
                  child: Center(
                    child:Text("Add Leave",style: TextStyle(
                        color: Constants.whiteColor,
                        fontSize: 16
                    ),),
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
