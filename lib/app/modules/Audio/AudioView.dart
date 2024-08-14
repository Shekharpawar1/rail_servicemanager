import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:serviceman/component/cached_network_image.dart';

import '../../../../utils/Constant.dart';
import '../../../../utils/images.dart';
import '../../routes/app_pages.dart';
import 'AudioPlayView.dart';
import 'audioController.dart';

class AudioView extends GetView<AudioController> {
  AudioView({Key? key}) : super(key: key);
  AudioController audioController = Get.put(AudioController());
  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
  final AudioPlayer audioPlayer = AudioPlayer();
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
            "Audio's",
            textScaler: TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 22),
          ),
        ),
        body: Obx(() => Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xFFF2F2F2),
            child: audioController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : audioController.audioList.isEmpty
                    ? Column(
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
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "No Result Found!",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: audioController.audioList.length,
                        itemBuilder: (context, index) {
                          final audio = audioController.audioList[index];

                          return InkWell(
                            onTap: () {

                              Get.toNamed(Routes.AUDIOPLAY,arguments: audio);
                            },
                            child: Container(
                              height: 140,
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
                              child:Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Row(
                                  children: [
                                    Container(
                                       height: 125,
                                       width: 125,
                                       color:Colors.white,
                                      margin: EdgeInsets.all(2),
                                      child:audio['poster']==null?Icon(Icons.image,color: Colors.black,size: 40,):cached_network_image(image: 'https://service-manager.digiatto.online/${audio['poster']}', fit: BoxFit.fill),
                                     ),
                                    SizedBox(width: 15,),
                                    SizedBox(
                                      width: context.width*0.5,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 30,),
                                          Text('${audio['title']}',maxLines: 2,overflow: TextOverflow.ellipsis,softWrap: true,style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600
                                          ),),
                                          SizedBox(height: 10,),
                                          Text('Day:${index+1}'),

                                        ],),
                                    ),
                                  ],
                                ),
                                  Icon(Icons.arrow_forward_ios,size: 22,color: Colors.grey,),
                                ],
                              ),
                                    // Container(
                                    //    height: 250,
                                    //    width: 150,
                                    //    color:Colors.white,
                                    //  ),
                                    //
                                    // leading: Icon(Icons.music_note),
                                    // trailing: Row(
                                    //   mainAxisSize: MainAxisSize.min,
                                    //   children: [
                                    //     IconButton(
                                    //       icon: Icon(Icons.fast_rewind),
                                    //       onPressed: audioController.seekBackward,
                                    //     ),
                                    //     IconButton(
                                    //       icon: Obx(() => Icon(
                                    //           audioController.isPlaying.value
                                    //               ? Icons.pause
                                    //               : Icons.play_arrow)),
                                    //       onPressed: () {
                                    //         if (audioController.isPlaying.value) {
                                    //           audioController.pauseAudio();
                                    //         } else {
                                    //           audioController.playAudio(
                                    //               "https://service-manager.digiatto.online/${audio['file']}");
                                    //         }
                                    //       },
                                    //     ),
                                    //     IconButton(
                                    //       icon: Icon(Icons.fast_forward),
                                    //       onPressed: audioController.seekForward,
                                    //     ),
                                    //   ],
                                    // ),
                                    // subtitle: Obx(() {
                                    //   final currentPosition =
                                    //       controller.position.value;
                                    //   final totalDuration =
                                    //       controller.duration.value;
                                    //   return Text(
                                    //     '${formatDuration(currentPosition)} / ${formatDuration(totalDuration)}',
                                    //     style: TextStyle(fontSize: 12),
                                    //   );
                                    // }),
                                    // trailing: Row(
                                    //   mainAxisSize: MainAxisSize.min,
                                    //   children: [
                                    //     IconButton(
                                    //       icon: Icon(Icons.fast_rewind),
                                    //       onPressed: audioController.seekBackward,
                                    //     ),
                                    //     IconButton(
                                    //       icon:Obx(()=> Icon(audioController.isPlaying.value ? Icons.play_arrow:Icons.pause)),
                                    //       onPressed: () {
                                    //         if (audioController.isPlaying.value) {
                                    //           audioController.pauseAudio();
                                    //         } else {
                                    //           audioController.playAudio("https://service-manager.digiatto.online/${audio['file']}");
                                    //         }
                                    //       },
                                    //     ),
                                    //     IconButton(
                                    //       icon: Icon(Icons.fast_forward),
                                    //       onPressed: audioController.seekForward,
                                    //     ),
                                    //   ],
                                    // ),
                                  // ),


                            ),
                          );
                        }))));
  }
}
