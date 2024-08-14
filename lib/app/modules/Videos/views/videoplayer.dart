import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:webview_flutter/webview_flutter.dart';

import '../../../../utils/Constant.dart';


/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  var video;
   VideoApp({super.key, required this.video});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  WebViewController _webViewController= WebViewController();
  void initState() {
    // TODO: implement initState
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(widget.video['link'].toString()),

      );
  }
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
        title: Text(widget.video['title'].toString(),textScaler: TextScaler.linear(1),textAlign: TextAlign.center,style: TextStyle(color: Color(0xFFFFFFFF),
            fontWeight: FontWeight.w400,fontSize: 22
        ),),
      ),
      body: Container(
        child: WebViewWidget(controller:_webViewController),
      ),
    );
  }
}