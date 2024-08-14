import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:serviceman/utils/images.dart';

import '../../../../utils/Constant.dart';
import '../controllers/test_controller.dart';

class TestCategory extends GetView<TestController> {
   TestCategory({super.key});
  TestController testController=Get.put(TestController());
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
        title: Text("Quiz Section",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body:Obx(()=> Padding(
        padding: const EdgeInsets.all(8.0),
        child: (testController.isLoading.value)
            ? Center(child: CircularProgressIndicator())
            : (testController
            .category.value.isEmpty)
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
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 10.0, // Spacing between columns
            mainAxisSpacing: 10.0, // Spacing between rows
            childAspectRatio: 3 / 2.3, // Aspect ratio for grid items
          ),
          itemCount:testController.category.length,
          itemBuilder: (context, index) {
            var data=testController.category.value[index];
            return GestureDetector(
              onTap: () {
                testController.fetchSubCategory(data['id'].toString(),data['category'].toString());
              },
              child: Container(
                margin: EdgeInsets.all(5),
                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 4,
                    )
                  ]
                ),
                child: GridTile(
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          ProjectImage.folder,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${data['category']!}",
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
              ),
            );
          },
        ),
      ),
      ),
    );
  }
}
