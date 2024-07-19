import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:serviceman/app/modules/DutyRecords/controllers/leavepage_controller.dart';
import 'package:serviceman/app/modules/DutyRecords/views/MyDutyDetails/leaveappbar.dart';

import '../../../../../utils/Constant.dart';

class GenerateRecords extends StatelessWidget {
   GenerateRecords({super.key});
 LeavePageController generaterecordController=LeavePageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 58,
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
          "Generate Records",
          textScaler: TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
      ),
      body:Obx(()=> Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () => generaterecordController.selectValue('Generate Mileage Report'),
                    child: Obx(() => Container(
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: generaterecordController.selectedValue.value == 'Generate Mileage Report'
                            ? Constants.pimaryColor
                            : Colors.black.withOpacity(0.75),
                      ),
          
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.picture_as_pdf,color: Constants.whiteColor,),
                            Text(
                              'Mileage',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                  SizedBox(width: 40),
                  GestureDetector(
                    onTap: () => generaterecordController.selectValue('Generate Overtime Report'),
                    child: Obx(() => Container(
                      height: 35,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: generaterecordController.selectedValue.value == 'Generate Overtime Report'
                            ? Constants.pimaryColor
                            : Colors.black.withOpacity(0.75),
                      ),
          
                      child: Center(
                        child: Row(
                          children: [
                            Icon(Icons.picture_as_pdf,color: Constants.whiteColor,),
                            Text(
                              'Overtime',
                              style: TextStyle(color: Colors.white, fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ),
                ],
              ),
              SizedBox(height: 60,),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(generaterecordController.selectedValue.value.toString()),
                    SizedBox(height: 20,),
                    TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),
                      controller:generaterecordController.selectedValue.value == 'Generate Mileage Report'
                          ? generaterecordController.pfnoMController:generaterecordController.pfnoOController,
                      cursorColor: Colors.blue,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10,top: 2),
                        labelText: "PF No.",
                        labelStyle:TextStyle(
                          color:Constants.pimaryColor,
                          fontSize:16,
                          fontWeight:FontWeight.w400,
                        ),
                        hintText: "PF No.",
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
                    SizedBox(height: 20,),
                    TextFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),
                      controller: generaterecordController.selectedValue.value == 'Generate Mileage Report'
                          ? generaterecordController.rateMController:generaterecordController.rateOController,
                      cursorColor: Colors.blue,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.number,
                      // inputFormatters: [LengthLimitingTextInputFormatter(20)],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10,top: 2),
                        labelText: "Rate",
                        labelStyle:TextStyle(
                          color:Constants.pimaryColor,
                          fontSize:16,
                          fontWeight:FontWeight.w400,
                        ),
                        hintText: "Rate",
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
                    SizedBox(height: 20,),
                    Center(
                      child: Container(
                        height: 45,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: Constants.pimaryColor,
                                width: 1
                              )
                          ),
                          child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 15),
                              child:
                              Obx(()=>generaterecordController.selectedValue.value == 'Generate Overtime Report'?Center(
                                child: DropdownButton(
                                  items:
                                  generaterecordController.dates
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
                                    generaterecordController
                                        .setSelectedDates(value.toString());
                                  },
                                  value: generaterecordController
                                      .selectedDates.value,
                                  icon: Icon(
                                    Icons.arrow_drop_down,
                                    size: 25,
                                  ),
                                  iconSize: 16,
                                  elevation: 16,
                                  isExpanded: true,
                                  underline: Container(),
                                ),
                              ):Center(
                                child: DropdownButton(
                                  items:
                                  generaterecordController.months
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
                                    generaterecordController
                                        .setSelectedMonth(value.toString());
                                  },
                                  value: generaterecordController
                                      .selectedMonth.value,
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
                    SizedBox(height: 40,),
                    Center(
                      child: MaterialButton(onPressed: () {
          
                      },
                        shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Constants.pimaryColor),
                        ),
                        height:40,
                        color: Constants.pimaryColor,
                        child: Text("Generate",
                          style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      )),
    );
  }
}
