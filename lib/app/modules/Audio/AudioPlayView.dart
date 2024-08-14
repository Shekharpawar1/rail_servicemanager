import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../component/cached_network_image.dart';
import '../../../utils/Constant.dart';
import 'audioController.dart';
import 'audioPlayController.dart';

class AudioPlayView extends GetView<AudioPlayController> {

  AudioPlayView({Key? key}) : super(key: key);
  final AudioPlayController audioController = Get.find<AudioPlayController>();
  var audio=Get.arguments;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      // appBar: AppBar(
      //   toolbarHeight: 60,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Get.back();
      //     },
      //     child: Icon(
      //       Icons.arrow_back_ios_new,
      //       color: Colors.white,
      //       size: 25,
      //     ),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Constants.pimaryColor,
      //   title: Text(
      //     "${audio['title']}",
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //         color: Color(0xFFFFFFFF),
      //         fontWeight: FontWeight.w400,
      //         fontSize: 22),
      //   ),
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF000000),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: context.height * 0.175),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 220,
                  width: 220,
                  color: Colors.white,
                  child: audio['poster'] == null
                      ? Icon(
                    Icons.image,
                    color: Colors.black,
                    size: 40,
                  )
                      : cached_network_image(
                      image:
                      'https://service-manager.digiatto.online/${audio['poster']}',
                      fit: BoxFit.fill),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "${audio['title']}",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
              SizedBox(height: 30),
              Obx(() {
                final currentPosition = audioController.position.value;
                final totalDuration = audioController.duration.value;
                return Container(
                  height: 1,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Constants.secondaryColor,
                      trackHeight: 5.0, // Adjust the thickness here
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 10.0), // Customize thumb size
                      overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 16.0), // Customize the overlay size
                    ),
                    child: Slider(
                      activeColor: Colors.blueAccent,
                      thumbColor: Constants.secondaryColor,
                      value: currentPosition.inSeconds.toDouble(),
                      max: totalDuration.inSeconds.toDouble(),
                      onChanged: (value) {
                        final newDuration = Duration(seconds: value.toInt());
                        audioController.seekAudio(newDuration);
                      },
                    ),
                  ),
                );
              }),
              SizedBox(height: 20),
              Obx(() {
                final currentPosition = audioController.position.value;
                final totalDuration = audioController.duration.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${formatDuration(currentPosition)}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Text(
                        '${formatDuration(totalDuration)}',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
          
                          audioController.stopAudio();
                          audioController.position.value = Duration.zero;
                          audioController.duration.value = Duration.zero;
                          Get.back();
                      },
                    ),
                  ),
                  SizedBox(width: 70),
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blueAccent),
                    child: Obx(() => IconButton(
                      icon: Icon(
                        audioController.isPlaying.value
                            ? Icons.pause
                            : Icons.play_arrow,
                        color: Colors.white,
                        size: 40,
                      ),
                      onPressed: () {
                        if (audioController.isPlaying.value) {
                          audioController.pauseAudio();
                        } else {
                          audioController.playAudio(
                              "https://service-manager.digiatto.online/${audio['file']}");
                        }
                      },
                    )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
