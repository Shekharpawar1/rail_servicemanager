import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/Constant.dart';
import '../controllers/s_e_t_offline_controller.dart';

class SETOfflineView extends GetView<SETOfflineController> {
  const SETOfflineView({Key? key}) : super(key: key);
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
          title: Text("SET OFFLINE",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,fontSize: 22
          ),),
        ),
        body:Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color(0xFFF2F2F2),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 5),
                margin: EdgeInsets.symmetric(horizontal: 15),
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
                    Text("Find set details",style: TextStyle(
                        color: Constants.fontColor,
                        fontSize: 18,
                        height: 0.98
                    ),),
                    Divider(color: Color(0xFFF2F2F2),thickness: 1.1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: MediaQuery.of(context).size.width/1.8,
                            child: Container(
                              decoration: BoxDecoration(
                                  color:Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: Colors.grey,
                                      width: 1
                                  )
                              ),
                              child: TextFormField(
                                cursorColor: Color(0xFF242B42),
                                cursorWidth: 1.5,
                                style: TextStyle(fontSize: 13,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF191A26),
                                ),
                                // inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                  hintText: "Enter SET No",
                                  hintStyle: TextStyle(fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Constants.pimaryColor,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 38,
                            width: 78,
                            // padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
                            // margin: EdgeInsets.only(right:8,top: 8),
                            decoration: BoxDecoration(
                                color:Constants.pimaryColor,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: MaterialButton(
                              onPressed: () {

                              },
                              height: 38,
                              minWidth: 78,
                              child: Center(
                                child: Text(
                                  "Find",style: TextStyle(
                                    color: Constants.whiteColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400
                                ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
              SizedBox(height: 20,),
            ],
          ),
        )
    );
  }
}
