import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:serviceman/utils/images.dart';

import '../../../../utils/Constant.dart';
import '../controllers/test_controller.dart';

class TestSubCategory extends GetView<TestController> {
  var title;
  TestSubCategory({super.key, required this.title});
  TestController testSubController=Get.put(TestController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,),
        ),
        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Text("${title}",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body:Obx(()=> Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (testSubController.isLoading.value)
              ? Center(child: CircularProgressIndicator())
              : (testSubController
              .subCategory.value.isEmpty)
              ? Container(
              child: Center(
                  child: Text(
                      textScaler: TextScaler.linear(1.0),
                      "Data Not Found",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500))))
              :  GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // Number of columns
              crossAxisSpacing: 10.0, // Spacing between columns
              mainAxisSpacing: 10.0, // Spacing between rows
              childAspectRatio: 3/3.5, // Aspect ratio for grid items
            ),
             itemCount:testSubController.subCategory.length,
           //  itemCount:10,
            itemBuilder: (context, index) {
               var data=testSubController.subCategory.value[index];
              return GestureDetector(
                onTap: () {
                   testSubController.fetchQuestions(data['id'].toString(),data['sub_category'].toString());
                },

                child: GridTile(
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 4,
                                  )
                                ]
                            ),
                       child: Icon(
                          Icons.folder,
                         color: Colors.grey.shade500,
                         size: 35,
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "${data['sub_category']!}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

              );
            },
          ),
        ),
      ),
      ),
    );
  }
}
