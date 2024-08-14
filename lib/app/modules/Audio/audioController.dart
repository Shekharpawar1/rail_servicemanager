import 'dart:convert';
import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../utils/Constant.dart';

class AudioController extends GetxController{
  RxBool isLoading=false.obs;
  RxList audioList=[].obs;

  Future<void> getaudios() async{
    isLoading.value=true;
    print("audios");
    try{
      // isLoading.value=true;
      final response=await http.get(Uri.parse('${Constants.Base_URL}${Constants.audio}'));
      if(response.statusCode==200){
        print("responseCode=========================>${response.statusCode}");
        var data=json.decode(response.body);
        audioList.value.assignAll(data['data']);
        isLoading.value=true;
        update();
        print("data==============================$data");
        print("videos==============================${audioList.value}");
      }else{
        print("Failed to load a audios");
      }
    }catch(e){
      print("Error in fatching audios${e}");
    }finally{
      isLoading.value=false;
    }
  }
  // final AudioPlayer audioPlayer = AudioPlayer();
  // final RxBool isPlaying = false.obs;
  // final RxString currentlyPlaying = ''.obs;
  // final Rx<Duration> position = Duration.zero.obs;
  // final Rx<Duration> duration = Duration.zero.obs;


  // void playAudio(String audioUrl) async {
  //   if (currentlyPlaying.value == audioUrl && isPlaying.value) {
  //     await audioPlayer.pause();
  //     isPlaying.value = false;
  //   } else {
  //     if (isPlaying.value) {
  //       await audioPlayer.stop();
  //     }
  //     await audioPlayer.play(UrlSource(audioUrl));
  //     isPlaying.value = true;
  //     currentlyPlaying.value = audioUrl;
  //   }
  // }
  //
  // void pauseAudio() async {
  //   await audioPlayer.pause();
  //   isPlaying.value = false;
  // }
  //
  // void resumeAudio() async {
  //   await audioPlayer.resume();
  //   isPlaying.value = true;
  // }
  //
  // void stopAudio() async {
  //   await audioPlayer.stop();
  //   isPlaying.value = false;
  //   currentlyPlaying.value = '';
  //   position.value = Duration.zero;
  //   duration.value = Duration.zero;
  // }
  //
  // void seekForward() {
  //   final newPosition = position.value + Duration(seconds: 10);
  //   audioPlayer.seek(newPosition);
  // }
  //
  // void seekBackward() {
  //   final newPosition = position.value - Duration(seconds: 10);
  //   audioPlayer.seek(newPosition);
  // }
  // void seekAudio(Duration position) {
  //   audioPlayer.seek(position);
  // }
  @override
  void onInit() {
    getaudios();
    super.onInit();
    // audioPlayer.onPositionChanged.listen((Duration p) {
    //   position.value = p;
    // });
    // audioPlayer.onDurationChanged.listen((Duration d) {
    //   duration.value = d;
    // });
    // audioPlayer.onPlayerComplete.listen((event) {
    //   isPlaying.value = false;
    //   currentlyPlaying.value = '';
    // });
  }

  @override
  void onClose() {
    // audioPlayer.dispose();
    // position.value = Duration.zero;
    // duration.value = Duration.zero;
    super.onClose();
  }

}