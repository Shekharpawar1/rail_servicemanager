import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serviceman/app/modules/Videos/views/videoplayer.dart';

import '../../../../utils/Constant.dart';
import '../../../../utils/images.dart';
import '../controllers/videos_controller.dart';

class VideosView extends GetView<VideosController> {
   VideosView({Key? key}) : super(key: key);
   VideosController videosController=Get.put(VideosController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios_new,color: Colors.white,size: 25,),
        ),
        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Text("Videos",textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body:Obx(()=>Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFFF2F2F2),
        child:videosController.isLoading.value?Center(child: CircularProgressIndicator()):videosController.videos.isEmpty?Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                ProjectImage.notFound,
                width: 175,
                height: 175,
              ),
            ),
            SizedBox(height: 5,),
            Text("No Result Found!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 18),),
            SizedBox(height: 30,),
          ],
        ):ListView.builder(
        itemCount: videosController.videos.length,
        itemBuilder: (context, index) {
          final video = videosController.videos[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: 140,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.grey.shade200, // Light grey
                      Colors.grey.shade300, // Darker grey
                      Colors.grey.shade400, // Darker grey
                      Colors.grey.shade500, // Darker grey
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: ListTile(
                  leading: Icon(Icons.video_collection,color: Constants.pimaryColor,size: 32,),
                  title: Text(video['title'],overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,style: TextStyle(
                      color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),),
                  subtitle: Text(video['link'],overflow: TextOverflow.ellipsis,softWrap: true,maxLines: 1,style: TextStyle(
                    color: Colors.blue
                  ),),
                  trailing: Icon(Icons.keyboard_double_arrow_right_sharp,color: Constants.pimaryColor,),
                  onTap: () {
                    Get.to(() => VideoApp(video: video));
                  },
                ),
              ),
              // Divider(color: Colors.grey,thickness: 0.5,),
            ],
          );
        },
      ),
      )),
    );
  }
}
