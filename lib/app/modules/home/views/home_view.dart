import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:serviceman/app/modules/Contacts/views/offlinecontact.dart';
import 'package:serviceman/app/modules/Roaster/controllers/roaster_controller.dart';
import 'package:serviceman/app/routes/app_pages.dart';
import 'package:serviceman/utils/Constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../component/cached_network_image.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());
  RoasterController rosterController = Get.put(RoasterController());
  dynamic argumentData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        automaticallyImplyLeading: false,
        leadingWidth: 45,
        backgroundColor: Constants.pimaryColor,
        title: Text(
          "Welcome Back! ${argumentData}",
          textScaler: TextScaler.linear(1),
          style: TextStyle(
              letterSpacing: 0.1,
              wordSpacing: 0.1,
              color: Colors.white,
              fontSize: 18),
        ),
      ),
      body: Obx(() => Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    // Obx(() {
                    // return controller.banner.value.isEmpty?Center(
                    //      child: CircularProgressIndicator(),
                    //    ):Stack(
                    //        children: [
                    //          CarouselSlider.builder(
                    //            itemCount: controller.banner.value.length,
                    //            itemBuilder: (context, index, realIndex) {
                    //              return Container(
                    //                width: MediaQuery.of(context).size.width,
                    //                margin: EdgeInsets.symmetric(
                    //                    horizontal: 5.0, vertical: 5),
                    //                decoration: BoxDecoration(
                    //                    borderRadius: BorderRadius.circular(20),
                    //                    boxShadow: [
                    //                      BoxShadow(
                    //                          color: Colors.black26,
                    //                          blurRadius: 4,
                    //                          offset: Offset(2, 2)),
                    //                    ]),
                    //                child: ClipRRect(
                    //                  borderRadius: BorderRadius.circular(20),
                    //                  child:Image.network(
                    //                    "https://service-manager.digiatto.online/${controller.banner.value[index].toString()}",
                    //                    fit: BoxFit.fill,
                    //
                    //                    // width: double.infinity,
                    //                  ),
                    //                ),
                    //              );
                    //            },
                    //            options: CarouselOptions(
                    //              enlargeFactor: 0.0,
                    //              autoPlay: true,
                    //              autoPlayAnimationDuration: Duration(seconds: 1),
                    //              height: 150,
                    //              // MediaQuery
                    //              // .of(context)
                    //              // .size
                    //              // .height *0.305,
                    //              enlargeCenterPage: true,
                    //              viewportFraction: 0.98,
                    //              onPageChanged: (index, reason) {
                    //                controller.activeSlide.value = index;
                    //              },
                    //            ),
                    //          ),
                    //          Positioned(
                    //              bottom: 0,
                    //              left: MediaQuery.of(context).size.width / 2.5,
                    //              child: Obx(() => DotsIndicator(
                    //                dotsCount: controller.banner.length,
                    //                position: controller.activeSlide.value,
                    //                decorator: DotsDecorator(
                    //                  color: Constants.pimaryColor, // Inactive color
                    //                  activeColor: Color(0xFFAC1013),
                    //                ),
                    //              ))),
                    //        ],
                    //      );
                    // },) ,
                    //     Stack(
                    //        children: [
                    //          CarouselSlider.builder(
                    //            itemCount: homeController.banner.length,
                    //            itemBuilder: (context, index, realIndex) {
                    //              return Container(
                    //                width: MediaQuery.of(context).size.width,
                    //                margin: EdgeInsets.symmetric(
                    //                    horizontal: 5.0, vertical: 5),
                    //                decoration: BoxDecoration(
                    //                  borderRadius: BorderRadius.circular(20),
                    //                  boxShadow: [
                    //                    BoxShadow(
                    //                      color: Colors.black26,
                    //                      blurRadius: 4,
                    //                      offset: Offset(2, 2),
                    //                    ),
                    //                  ],
                    //                ),
                    //                child: ClipRRect(
                    //                  borderRadius: BorderRadius.circular(20),
                    //                  child: cached_network_image(
                    //                    image:"https://service-manager.digiatto.online/${controller.banner.value[index].toString()}",
                    //                    fit: BoxFit.fill,
                    //                  ),
                    //                ),
                    //              );
                    //            },
                    //            options: CarouselOptions(
                    //              enlargeFactor: 0.0,
                    //              autoPlay: true,
                    //              autoPlayAnimationDuration: Duration(seconds: 1),
                    //              height: 150,
                    //              enlargeCenterPage: true,
                    //              viewportFraction: 0.98,
                    //              onPageChanged: (index, reason) {
                    //                controller.activeSlide.value = index;
                    //              },
                    //            ),
                    //          ),
                    //          Positioned(
                    //            bottom: 0,
                    //            left: MediaQuery.of(context).size.width / 2.5,
                    //            child: DotsIndicator(
                    //                dotsCount: homeController.banner.length,
                    //                position: controller.activeSlide.value,
                    //                decorator: DotsDecorator(
                    //                  color: Constants.pimaryColor,
                    //                  activeColor: Color(0xFFAC1013),
                    //                ),
                    //              ),
                    //            ),
                    //        ],
                    //      ),
                    homeController.isLoading.value
                        ? Center(child: CircularProgressIndicator())
                        : Stack(
                            children: [
                              homeController.banner.value.isEmpty
                                  ? Text("Not Found")
                                  : CarouselSlider.builder(
                                      itemCount: homeController.banner.length,
                                      itemBuilder: (context, index, realIndex) {
                                        return Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black26,
                                                blurRadius: 4,
                                                offset: Offset(2, 2),
                                              ),
                                            ],
                                          ),
                                          child: InkWell(
                                            onTap: () {
                                              if (homeController.banner
                                                              .value[index]
                                                          ['link'] ==
                                                      null ||
                                                  homeController.banner
                                                              .value[index]
                                                          ['link'] ==
                                                      '') {
                                                return null;
                                              } else {
                                                Get.to(WebViewApp(
                                                    link: homeController.banner
                                                        .value[index]['link']));
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Obx(
                                                  () => cached_network_image(
                                                        image:
                                                            "https://service-manager.digiatto.online/${homeController.banner.value[index]['file']}",
                                                        fit: BoxFit.fill,
                                                      )),
                                            ),
                                          ),
                                        );
                                      },
                                      options: CarouselOptions(
                                        autoPlay: true,
                                        autoPlayAnimationDuration:
                                            Duration(seconds: 1),
                                        height: 150,
                                        enlargeCenterPage: true,
                                        viewportFraction: 0.98,
                                        onPageChanged: (index, reason) {
                                          controller.activeSlide.value = index;
                                        },
                                      ),
                                    ),
                              Positioned(
                                bottom: 0,
                                left: MediaQuery.of(context).size.width / 2.5,
                                child: homeController.isLoading.value
                                    ? Center(child: CircularProgressIndicator())
                                    : Obx(() => DotsIndicator(
                                          dotsCount: controller.banner.length,
                                          position:
                                              controller.activeSlide.value,
                                          decorator: DotsDecorator(
                                            color: Constants.pimaryColor,
                                            activeColor: Color(0xFFAC1013),
                                          ),
                                        )),
                              ),
                            ],
                          ),
                    SizedBox(
                      height: 38,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 90,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        // padding: EdgeInsets.all(20),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: homeController.ItemList.length - 1,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 12,
                            // crossAxisSpacing: 15,
                            childAspectRatio: 0.7,
                          ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                if (index == 0) {
                                  Get.toNamed(Routes.ROASTER);
                                } else if (index == 1) {
                                  Get.toNamed(Routes.WORKING_HISTORY);
                                } else if (index == 2) {
                                  Get.toNamed(Routes.DUTY_RECORDS);
                                }
                                // else if (index == 3) {
                                //   Get.toNamed(Routes.CONTACTS);
                                // }
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 2),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black38,
                                              blurRadius: 4,
                                              offset: Offset(3, 3))
                                        ]),
                                    child:
                                        homeController.ItemList[index + 1].img,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    homeController.ItemList[index + 1].title,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: 0.1,
                                        wordSpacing: 0.1,
                                        height: 0.98),
                                  ),
                                  (index == 0 &&
                                          rosterController
                                                  .updatedString.value !=
                                              '')
                                      ? Obx(() => Text(
                                            "${rosterController.updatedString.value}",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.green,
                                              fontWeight: FontWeight.w400,
                                              letterSpacing: 0.1,
                                              wordSpacing: 0.1,
                                            ),
                                          ))
                                      : SizedBox(),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //
                    //       Expanded(
                    //         flex: 2,
                    //         child: InkWell(
                    //           onTap: () => Get.toNamed(Routes.CALCULATORS),
                    //           child: Container(
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 boxShadow: [
                    //                   BoxShadow(
                    //                       color: Colors.black38,
                    //                       blurRadius: 4,
                    //                       offset: Offset(3, 3))
                    //                 ]),
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(13.0),
                    //               child: Column(
                    //                 children: [
                    //                   Container(
                    //                     margin: EdgeInsets.only(top: 2),
                    //                     padding: EdgeInsets.all(4),
                    //                     decoration: BoxDecoration(
                    //                       color: Colors.white,
                    //                     ),
                    //                     child: homeController.ItemList2[0].img,
                    //                   ),
                    //                   SizedBox(
                    //                     height: 10,
                    //                   ),
                    //                   Text(
                    //                     homeController.ItemList2[0].title,
                    //                     textAlign: TextAlign.center,
                    //                     style: TextStyle(
                    //                         fontSize: 11,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w500,
                    //                         letterSpacing: 0.1,
                    //                         wordSpacing: 0.1,
                    //                         height: 0.98),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //       SizedBox(width: 10),
                    //       Expanded(
                    //         flex: 2,
                    //         child: InkWell(
                    //           onTap: () => Get.toNamed(Routes.CONTACTS),
                    //           child: Container(
                    //             decoration: BoxDecoration(
                    //                 color: Colors.white,
                    //                 borderRadius: BorderRadius.circular(10),
                    //                 boxShadow: [
                    //                   BoxShadow(
                    //                       color: Colors.black38,
                    //                       blurRadius: 4,
                    //                       offset: Offset(3, 3))
                    //                 ]),
                    //             child: Padding(
                    //               padding: const EdgeInsets.all(13.0),
                    //               child: Column(
                    //                 children: [
                    //                   Container(
                    //                     margin: EdgeInsets.only(top: 2),
                    //                     padding: EdgeInsets.all(4),
                    //                     decoration: BoxDecoration(
                    //                       color: Colors.white,
                    //                     ),
                    //                     child: homeController.ItemList[0].img,
                    //                   ),
                    //                   SizedBox(
                    //                     height: 10,
                    //                   ),
                    //                   Text(
                    //                     homeController.ItemList[0].title,
                    //                     textAlign: TextAlign.center,
                    //                     style: TextStyle(
                    //                         fontSize: 11,
                    //                         color: Colors.black,
                    //                         fontWeight: FontWeight.w500,
                    //                         letterSpacing: 0.1,
                    //                         wordSpacing: 0.1,
                    //                         height: 0.98),
                    //                   ),
                    //                 ],
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NEWS",
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See All",
                              textScaler: TextScaler.linear(1),
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 110,
                      // color: Colors.red,
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.only(
                        left: 18,
                      ),
                      child: homeController.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: controller.news.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      // createAccountController.setDropValue(createAccountController.UserGroup[index].toString());
                                    },
                                    child: Obx(() => Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 50,
                                          padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black38,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 3)
                                              ]),
                                          child: InkWell(
                                            onTap: () {
                                              if (homeController
                                                              .news.value[index]
                                                          ['link'] ==
                                                      null ||
                                                  homeController
                                                              .news.value[index]
                                                          ['link'] ==
                                                      '') {
                                                return null;
                                              } else {
                                                Get.to(WebViewApp(
                                                    link: homeController.news
                                                        .value[index]['link']));
                                              }
                                            },
                                            child: cached_network_image(
                                              image:
                                                  "https://service-manager.digiatto.online/${homeController.news.value[index]['file']}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )));
                              },
                            ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Divider(
                      color: Colors.grey.withOpacity(0.3),
                      thickness: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Recents",
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "See All",
                              textScaler: TextScaler.linear(1),
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.black,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 110,
                      // color: Colors.red,
                      margin: EdgeInsets.only(bottom: 5),
                      padding: EdgeInsets.only(
                        left: 18,
                      ),
                      child: homeController.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : ListView.builder(
                              itemCount: controller.news.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return InkWell(
                                    onTap: () {
                                      // createAccountController.setDropValue(createAccountController.UserGroup[index].toString());
                                    },
                                    child: Obx(() => Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: 50,
                                          padding: EdgeInsets.all(5),
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black38,
                                                    offset: Offset(2, 2),
                                                    blurRadius: 3)
                                              ]),
                                          child: InkWell(
                                            onTap: () {
                                              if (homeController
                                                              .news.value[index]
                                                          ['link'] ==
                                                      null ||
                                                  homeController
                                                              .news.value[index]
                                                          ['link'] ==
                                                      '') {
                                                return null;
                                              } else {
                                                Get.to(WebViewApp(
                                                    link: homeController.news
                                                        .value[index]['link']));
                                              }
                                            },
                                            child: cached_network_image(
                                              image:
                                                  "https://service-manager.digiatto.online/${homeController.news.value[index]['file']}",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        )));
                              },
                            ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          )),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Constants.pimaryColor,
          onPressed: () {
            controller.showModal(context);
          },
          child: Icon(Icons.dashboard, color: Colors.white)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class WebViewApp extends StatefulWidget {
  var link;
  WebViewApp({super.key, required this.link});

  @override
  _WebViewAppState createState() => _WebViewAppState();
}

class _WebViewAppState extends State<WebViewApp> {
  WebViewController _webViewController = WebViewController();
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
        Uri.parse(widget.link.toString()),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: WebViewWidget(controller: _webViewController),
      ),
    );
  }

  @override
  void onClose() {
    super.dispose();
  }
}
