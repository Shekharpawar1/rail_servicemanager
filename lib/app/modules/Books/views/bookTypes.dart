import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:serviceman/app/modules/Books/controllers/books_controller.dart';
import 'package:serviceman/app/modules/Books/views/BookTypeDetails.dart';

import '../../../../utils/Constant.dart';

class BookTypes extends StatelessWidget {
   BookTypes({super.key});
   BooksController bookTypeController=Get.put(BooksController());
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
          bookTypeController.selectedValue1.value.toString(),
          textScaler: TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
      ),
      body:Obx(() {
        if (bookTypeController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
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
                          // inputFormatters: [LengthLimitingTextInputFormatter(6)],
                          keyboardType: TextInputType.text,
                          controller: bookTypeController.searchbyidController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            hintText: "Search Books",
                            labelText:"Search Books",
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
                            bookTypeController.filterbooksbyDep(value);
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
                            bookTypeController.filterbooksbyDep(bookTypeController.searchbyidController.text);
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
                child:Obx(()=> (bookTypeController.isLoading.value)
                    ? Center(child: CircularProgressIndicator())
                    : (bookTypeController
                    .booksbyDep.value.isEmpty)
                    ? Container(
                    child: Center(
                        child: Text(
                            textScaler: TextScaler.linear(1.0),
                            "Books Not Found",
                            style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w500))))
                    :  ListView.builder(itemCount: bookTypeController.filteredbooksbyDep.value.length,itemBuilder:
                    (context, index) {
                      var book=bookTypeController.filteredbooksbyDep.value[index];
                  return Column(children: [
                    GestureDetector(
                      onTap: () {
                        bookTypeController.getbooksByIdDetial(book['id'].toString());
                        bookTypeController.selectValue2(book['category'].toString());
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
                                    Text(book['category'].toString(),
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                          color: Constants.blackColor,
                                          fontSize: 18
                                      ),),
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
                )),
              )
            ],
          ),
        ),
      );}})
    );
  }
}
