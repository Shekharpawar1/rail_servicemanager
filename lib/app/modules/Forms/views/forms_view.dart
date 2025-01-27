import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serviceman/app/modules/Forms/views/Formtype.dart';

import '../../../../utils/Constant.dart';
import '../controllers/forms_controller.dart';

class FormsView extends GetView<FormsController> {
   FormsView({Key? key}) : super(key: key);
   FormsController formsController=Get.put(FormsController());
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
        centerTitle:true,
        backgroundColor: Constants.pimaryColor,
        title: Text(
          "Forms",
          textScaler: TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
      ),
      body:Obx(()=>formsController.isLoading.value?Center(child: CircularProgressIndicator(),):Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color:Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]
                ),
                child:  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width/1.65,

                        child: TextFormField(
                          cursorColor: Color(0xFF242B42),
                          style: TextStyle(fontSize: 13,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF191A26),
                          ),
                          controller: formsController.searchController,
                          // inputFormatters: [LengthLimitingTextInputFormatter(6)],
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Search Forms",
                            labelText:"Search Forms",
                            hintStyle: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Constants.pimaryColor,
                            ),
                            labelStyle: TextStyle(fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Constants.pimaryColor,
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
                          onChanged: (value) {
                            formsController.filterForms(value);
                          },
                        ),
                      ),
                      Container(
                        height: 35,
                        width: 90,
                        // padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
                        // margin: EdgeInsets.only(right:8,top: 8),
                        decoration: BoxDecoration(
                            color:Constants.pimaryColor,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: MaterialButton(
                          onPressed: () {
                            formsController.filterForms(formsController.searchController.text);
                          },
                          height: 35,
                          minWidth: 90,
                          child: Center(
                            child: Text(
                              "Search",textScaler: TextScaler.noScaling,style: TextStyle(
                                color: Constants.whiteColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                            ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                height: MediaQuery.of(context).size.height*0.76,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration:BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(color:Colors.black38,
                          blurRadius: 4,
                          offset: Offset(2, 2))
                    ]
                ),
                child:Obx(()=>  ListView.builder(itemCount: formsController.filteredforms.value.length,itemBuilder:
                    (context, index) {
                  var form=formsController.filteredforms.value[index];
                  return Column(children: [
                    InkWell(
                      onTap: () {
                        formsController.getFormById(form['id'].toString());
                        formsController.selectValue1(form['department'].toString());
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        decoration:BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color:Colors.black38,
                                  blurRadius: 4,
                                  offset: Offset(2, 2))
                            ]
                        ),
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width/1.8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(form['department'],
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Constants.blackColor,
                                          fontSize: 18
                                      ),),
                                    Text("${form['form_count']} Catgories",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 11
                                      ),)
                                  ],
                                ),
                              ),
                              Icon(Icons.arrow_circle_right_outlined,color: Constants.pimaryColor,size: 30,),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],);
                },
                ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
