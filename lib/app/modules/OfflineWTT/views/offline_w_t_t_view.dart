import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/Constant.dart';
import '../controllers/offline_w_t_t_controller.dart';

class OfflineWTTView extends GetView<OfflineWTTController> {
   OfflineWTTView({Key? key}) : super(key: key);
   OfflineWTTController offlineWTTController=OfflineWTTController();
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
          "Offline WTT",
          textScaler: TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              // padding: EdgeInsets.all(20),
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: offlineWTTController.wtttype.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,
                mainAxisSpacing: 0,
                 crossAxisSpacing: 25,
                childAspectRatio: 1,), itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
        
                  },
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        decoration:BoxDecoration(
                            color: Constants.whiteColor,
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            border: Border.all(width: 7,color: Constants.pimaryColor)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(offlineWTTController.wtttype[index],textScaler: TextScaler.linear(1),style: TextStyle(
                              color: Constants.secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 18
                            ),),
                            SizedBox(height: 10,),
                            Divider(color: Constants.pimaryColor,thickness: 3,),
                            SizedBox(height: 15,),
                             index==offlineWTTController.wtttype.length-1? Container(
                                 padding: EdgeInsets.symmetric(vertical: 3,horizontal: 2),
                                 decoration:BoxDecoration(
                                   color: Constants.whiteColor,
                                   borderRadius:BorderRadius.circular(5),
                                 ),
                                 child: Icon(Icons.train,color: Constants.pimaryColor,size: 35,)) : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 3,horizontal: 2),
                                    decoration:BoxDecoration(
                                        color: Constants.pimaryColor,
                                        borderRadius:BorderRadius.circular(5),
                                    ),
                                    child: Icon(Icons.arrow_upward,color: Constants.whiteColor,size: 35,)),
                                Container(
                                    padding: EdgeInsets.symmetric(vertical: 3,horizontal: 2),
                                    decoration:BoxDecoration(
                                      color: Constants.pimaryColor,
                                      borderRadius:BorderRadius.circular(5),
                                    ),
                                    child: Icon(Icons.arrow_downward,color: Constants.whiteColor,size: 35,)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },),
            ),
          ],
        ),
      ),
    );
  }
}
