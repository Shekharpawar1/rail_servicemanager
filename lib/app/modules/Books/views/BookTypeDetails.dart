// import 'dart:io';
// import 'package:device_info_plus/device_info_plus.dart';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:serviceman/app/modules/Books/controllers/books_controller.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// import '../../../../utils/Constant.dart';
// import '../../Forms/views/FormTypeDetails.dart';
// //
// // class BookTypeDetails extends StatelessWidget {
// //    BookTypeDetails({super.key});
// //    BooksController booktypeDetail=Get.put(BooksController());
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           toolbarHeight: 60,
// //           leading: GestureDetector(
// //             onTap: () {
// //               Get.back();
// //             },
// //             child: Icon(
// //               Icons.arrow_back_ios_new,
// //               color: Colors.white,
// //               size: 25,
// //             ),
// //           ),
// //           centerTitle: true,
// //           backgroundColor: Constants.pimaryColor,
// //           title: Text(
// //               booktypeDetail.selectedValue2.value.toString(),
// //             textScaler: TextScaler.linear(1),
// //             textAlign: TextAlign.center,
// //             style: TextStyle(
// //                 color: Color(0xFFFFFFFF),
// //                 fontWeight: FontWeight.w400,
// //                 fontSize: 22),
// //           ),
// //         ),
// //         body: Obx(() {
// //     if (booktypeDetail.isLoading.value) {
// //     return Center(child: CircularProgressIndicator());
// //     } else {
// //     return  Container(
// //           height: MediaQuery.of(context).size.height,
// //           width: MediaQuery.of(context).size.width,
// //           color: Color(0xFFF2F2F2),
// //           child:  SingleChildScrollView(
// //             child: Column(
// //               children: [
// //                 Container(
// //                   child:(booktypeDetail.isLoading.value)
// //                 ? Center(child: CircularProgressIndicator())
// //                 : (booktypeDetail
// //                 .booksbyIdDetial.value.isEmpty) ? Container(
// //                 child: Center(
// //                     child: Text(
// //                         textScaler: TextScaler.linear(1.0),
// //                         "Books Not Found",
// //                         style: TextStyle(
// //                             fontSize: 19,
// //                             fontWeight: FontWeight.w500))))
// //                 : ListView.builder(itemCount:booktypeDetail.booksbyIdDetial.value.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemBuilder:
// //                       (context, index) {
// //                     var bookDetails=booktypeDetail.booksbyIdDetial.value[index];
// //                     return Column(children: [
// //                       GestureDetector(
// //                         onTap: () {
// //
// //                         },
// //                         child: Container(
// //                           width: double.infinity,
// //                           padding: EdgeInsets.symmetric(vertical: 15),
// //                           margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
// //                           decoration:BoxDecoration(
// //                               color: Colors.white,
// //                               borderRadius: BorderRadius.circular(5),
// //                               boxShadow: [
// //                                 BoxShadow(color:Colors.black38,
// //                                     blurRadius: 4,
// //                                     offset: Offset(2, 2))
// //                               ]
// //                           ),
// //                           child:  Padding(
// //                             padding: const EdgeInsets.symmetric(horizontal: 5.0),
// //                             child: Row(
// //                               crossAxisAlignment: CrossAxisAlignment.center,
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Icon(Icons.file_copy,color: Colors.teal,size: 35,),
// //                                 SizedBox(
// //                                   width: MediaQuery.of(context).size.width/2,
// //                                   child: Column(
// //                                     mainAxisAlignment: MainAxisAlignment.center,
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     children: [
// //                                       Text(bookDetails['title'].toString(),
// //                                         style: TextStyle(
// //                                             color: Constants.blackColor,
// //                                             fontSize: 16,
// //                                             height: 0.98
// //                                         ),),
// //                                     ],
// //                                   ),
// //                                 ),
// //                                 Container(
// //                                     padding: EdgeInsets.all(10),
// //                                     decoration: BoxDecoration(
// //                                       color: Constants.pimaryColor
// //                                           .withOpacity(
// //                                           0.9),
// //                                       borderRadius: BorderRadius.circular(
// //                                           30),
// //                                     ),
// //                                     child: Row(
// //                                       children: [
// //                                         InkWell(
// //                                           onTap:() async {
// //                                             await _downloadFile(
// //                                               context,
// //                                               "https://service-manager.digiatto.online/${bookDetails['file'].toString()}",
// //                                               bookDetails['title'].toString(),
// //                                             );
// //                                           },
// //                                           child: Icon(Icons.download_for_offline,
// //                                             color: Constants.whiteColor,
// //                                             size: 25,),
// //                                         ),
// //                                         SizedBox(width: 20,),
// //                                         InkWell(
// //                                           onTap: () {
// //                                             Get.to(()=>PdfViewerPage(
// //                                               url: "https://service-manager.digiatto.online/${bookDetails['file'].toString()}",
// //                                               title:bookDetails['title'].toString(),
// //                                             ));
// //                                           },
// //                                           child: Icon(Icons.remove_red_eye,
// //                                             color: Constants.whiteColor,
// //                                             size: 25,),
// //                                         ),
// //                                       ],
// //                                     )),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],);
// //                       },
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //     );
// //     }
// //         }
// //         ));
// //   }
// //    // Future<void> _downloadFile(BuildContext context, String url, String fileName) async {
// //    //   Dio dio = Dio();
// //    //   try {
// //    //     if (await _requestPermission(Permission.storage)) {
// //    //       Directory? downloadsDir = await getExternalStorageDirectory();
// //    //       // String fullPath = "${dir.path}/$fileName.pdf";
// //    //       // String fullPath = "${downloadsDir!.path}/${fileName}.pdf";
// //    //       final fullPath = Directory('/storage/emulated/0/Download/${fileName}.pdf');
// //    //       await dio.download(url, fullPath);
// //    //       print("${fullPath}");
// //    //       // print("${downloadsDir.path}");
// //    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded $fullPath")));
// //    //     } else {
// //    //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Storage permission denied")));
// //    //     }
// //    //   } catch (e) {
// //    //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error downloading file: $e")));
// //    //   }
// //    // }
// //    Future<void> _downloadFile(BuildContext context, String url, String fileName) async {
// //      Dio dio = Dio();
// //      try {
// //        // Check and request storage permission
// //        if (await _requestPermission(Permission.storage)) {
// //          Directory? downloadsDir;
// //          String? fullPath;
// //
// //          // Get Android version information
// //          DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
// //          AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
// //          int sdkInt = androidInfo.version.sdkInt;
// //
// //          // Handle Android 10+ scoped storage
// //          if (sdkInt >= 29) {
// //            List<Directory>? directories = await getExternalStorageDirectories(type: StorageDirectory.documents);
// //            if (directories != null && directories.isNotEmpty) {
// //              downloadsDir = directories.first; // Use the first available downloads directory
// //            }
// //          } else {
// //            downloadsDir = Directory('/storage/emulated/0/Download');
// //          }
// //
// //          if (downloadsDir != null) {
// //            if (!downloadsDir.existsSync()) {
// //              downloadsDir.createSync(recursive: true);
// //            }
// //
// //            fullPath = "${downloadsDir.path}/$fileName.pdf";
// //
// //            if (File(fullPath).existsSync()) {
// //              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("File already exists at $fullPath")));
// //            } else {
// //              // Show progress indicator while downloading
// //              await dio.download(
// //                url,
// //                fullPath,
// //                onReceiveProgress: (received, total) {
// //                  if (total != -1) {
// //                    print("${(received / total * 100).toStringAsFixed(0)}%");
// //                  }
// //                },
// //              );
// //
// //              print("File downloaded to: $fullPath");
// //              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Downloaded $fullPath")),snackBarAnimationStyle: AnimationStyle(duration: Duration(seconds: 8)));
// //            }
// //          } else {
// //            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error accessing download directory")));
// //          }
// //        } else {
// //          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Storage permission denied")));
// //        }
// //      } catch (e) {
// //        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error downloading file: $e")));
// //      }
// //    }
// //
// //    Future<bool> _requestPermission(Permission permission) async {
// //      if (await permission.isGranted) {
// //        return true;
// //      } else {
// //        var result = await permission.request();
// //        return result == PermissionStatus.granted;
// //      }
// //    }
// // // Future<void> _requestStoragePermission() async {
// // //   var status = await Permission.storage.status;
// // //
// // //   if (!status.isGranted) {
// // //     // Request permission
// // //     await Permission.storage.request();
// // //     status = await Permission.storage.status;
// // //     if (status.isGranted) {
// // //       print('Storage permission granted.');
// // //     } else {
// // //       print('Storage permission denied.');
// // //     }
// // //   } else {
// // //     print('Storage permission already granted.');
// // //   }
// // // }
// // }
// //
// // // import 'package:flutter/material.dart';
// // // import 'package:webview_flutter/webview_flutter.dart';
// //
// //
// //
// // class PdfViewerPage extends StatefulWidget {
// //   final String url;
// //   final String title;
// //
// //   PdfViewerPage({required this.url, required this.title});
// //
// //   @override
// //   _PdfViewerPageState createState() => _PdfViewerPageState();
// // }
// //
// // class _PdfViewerPageState extends State<PdfViewerPage> {
// //   String? localPath;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadPdf();
// //   }
// //
// //   Future<void> _loadPdf() async {
// //     try {
// //       // Download the PDF
// //       var response = await http.get(Uri.parse(widget.url));
// //       var dir = await getApplicationDocumentsDirectory();
// //       File file = File("${dir.path}/temp.pdf");
// //
// //       // Write the downloaded PDF to a file
// //       await file.writeAsBytes(response.bodyBytes);
// //
// //       // Set the local path to the downloaded file
// //       setState(() {
// //         localPath = file.path;
// //       });
// //     } catch (e) {
// //       // Handle error if needed
// //       print(e);
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.title),
// //       ),
// //       body: localPath != null
// //           ? SfPdfViewer.file(File(localPath!))
// //           : Center(child: CircularProgressIndicator()),
// //     );
// //   }
// // }
// // // class PdfViewerPage extends StatelessWidget {
// // //   final String url;
// // //   final String title;
// // //
// // //   PdfViewerPage({required this.url, required this.title});
// // //
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(title.toString()),
// // //       ),
// // //       body: SfPdfViewer.network(url,),
// // //     );
// // //   }
// // // }
// //
// ///New Code
//
//
// class BookTypeDetails extends StatefulWidget {
//   const BookTypeDetails({super.key});
//
//   @override
//   _BookTypeDetailsState createState() => _BookTypeDetailsState();
// }
//
// class _BookTypeDetailsState extends State<BookTypeDetails> {
//   final BooksController booktypeDetail = Get.put(BooksController());
//   bool dowloading = false;
//   bool fileExists = false;
//   double progress = 0;
//   String fileName = "";
//   late String filePath;
//   late CancelToken cancelToken;
//   var getPathFile = DirectoryPath();
//
//
//
//   cancelDownload() {
//     cancelToken.cancel();
//     setState(() {
//       dowloading = false;
//     });
//   }
//
//   checkFileExit() async {
//     var storePath = await getPathFile.getPath();
//     filePath = '$storePath/$fileName';
//     bool fileExistCheck = await File(filePath).exists();
//     setState(() {
//       fileExists = fileExistCheck;
//     });
//   }
//
//   openfile() {
//     OpenFile.open(filePath);
//     print("fff $filePath");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 60,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: const Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.white,
//             size: 25,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Constants.pimaryColor,
//         title: Text(
//           booktypeDetail.selectedValue2.value.toString(),
//           textScaler: const TextScaler.linear(1),
//           textAlign: TextAlign.center,
//           style: const TextStyle(
//               color: Color(0xFFFFFFFF),
//               fontWeight: FontWeight.w400,
//               fontSize: 22),
//         ),
//       ),
//       body: Obx(() {
//         if (booktypeDetail.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             color: const Color(0xFFF2F2F2),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Container(
//                     child: (booktypeDetail.isLoading.value)
//                         ? const Center(child: CircularProgressIndicator())
//                         : (booktypeDetail.booksbyIdDetial.value.isEmpty)
//                         ? const Center(
//                         child: Text(
//                             textScaler: TextScaler.linear(1.0),
//                             "Books Not Found",
//                             style: TextStyle(
//                                 fontSize: 19,
//                                 fontWeight: FontWeight.w500)))
//                         : ListView.builder(
//                       itemCount: booktypeDetail
//                           .booksbyIdDetial.value.length,
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemBuilder: (context, index) {
//                         var bookDetails = booktypeDetail
//                             .booksbyIdDetial.value[index];
//                         return Column(
//                           children: [
//                             GestureDetector(
//                               onTap: () {},
//                               child: Container(
//                                 width: double.infinity,
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 15),
//                                 margin: const EdgeInsets.symmetric(
//                                     horizontal: 5, vertical: 5),
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius:
//                                     BorderRadius.circular(5),
//                                     boxShadow: const [
//                                       BoxShadow(
//                                           color: Colors.black38,
//                                           blurRadius: 4,
//                                           offset: Offset(2, 2))
//                                     ]),
//                                 child: Padding(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 5.0),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                     MainAxisAlignment
//                                         .spaceBetween,
//                                     children: [
//                                       const Icon(
//                                         Icons.file_copy,
//                                         color: Colors.teal,
//                                         size: 35,
//                                       ),
//                                       SizedBox(
//                                         width: MediaQuery.of(context)
//                                             .size
//                                             .width /
//                                             2,
//                                         child: Column(
//                                           mainAxisAlignment:
//                                           MainAxisAlignment
//                                               .center,
//                                           crossAxisAlignment:
//                                           CrossAxisAlignment
//                                               .start,
//                                           children: [
//                                             Text(
//                                               bookDetails['title']
//                                                   .toString(),
//                                               style: TextStyle(
//                                                   color: Constants
//                                                       .blackColor,
//                                                   fontSize: 16,
//                                                   height: 0.98),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Container(
//                                           padding:
//                                           const EdgeInsets.all(
//                                               10),
//                                           decoration: BoxDecoration(
//                                             color: Constants
//                                                 .pimaryColor
//                                                 .withOpacity(0.9),
//                                             borderRadius:
//                                             BorderRadius.circular(
//                                                 30),
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               IconButton(
//                                               onPressed: () {
//                                       fileExists && dowloading == false
//                                       ? openfile()
//                                           : startDownload("https://service-manager.digiatto.online/${bookDetails['file'].toString()}");
//                                       },
//                                           icon: fileExists
//                                               ? const Icon(
//                                             Icons.save,
//                                             color: Colors.green,
//                                           )
//                                               : dowloading
//                                               ? Stack(
//                                             alignment: Alignment.center,
//                                             children: [
//                                               CircularProgressIndicator(
//                                                 value: progress,
//                                                 strokeWidth: 3,
//                                                 backgroundColor: Colors.grey,
//                                                 valueColor: const AlwaysStoppedAnimation<Color>(
//                                                     Colors.blue),
//                                               ),
//                                               Text(
//                                                 "${(progress * 100).toStringAsFixed(2)}",
//                                                 style: TextStyle(fontSize: 12),
//                                               )
//                                             ],
//                                           )
//                                               : const Icon(Icons.download)),
//                                               // InkWell(
//                                               //   onTap: () async {
//                                               //     await _downloadFile(
//                                               //       context,
//                                               //       "https://service-manager.digiatto.online/${bookDetails['file'].toString()}",
//                                               //       bookDetails[
//                                               //       'title']
//                                               //           .toString(),
//                                               //     );
//                                               //   },
//                                               //   child: const Icon(
//                                               //     Icons
//                                               //         .download_for_offline,
//                                               //     color: Colors.white,
//                                               //     size: 25,
//                                               //   ),
//                                               // ),
//                                               const SizedBox(
//                                                 width: 20,
//                                               ),
//                                               InkWell(
//                                                 onTap: () {
//                                                   Get.to(() =>
//                                                       PdfViewerPage(
//                                                         url:
//                                                         "https://service-manager.digiatto.online/${bookDetails['file'].toString()}",
//                                                         title: bookDetails[
//                                                         'title']
//                                                             .toString(),
//                                                       ));
//                                                 },
//                                                 child: const Icon(
//                                                   Icons
//                                                       .remove_red_eye,
//                                                   color: Colors.white,
//                                                   size: 25,
//                                                 ),
//                                               ),
//                                             ],
//                                           )),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       }),
//     );
//   }
//   //
//   startDownload(String fileUrl) async {
//     try {
//       // Check and request storage permission
//       if (await _requestPermission(Permission.storage)) {
//
//           cancelToken = CancelToken();
//           var storePath = await getPathFile.getPath();
//           filePath = '$storePath/$fileName';
//           setState(() {
//             dowloading = true;
//             progress = 0;
//           });
//
//           try {
//             await Dio().download(fileUrl, filePath,
//                 onReceiveProgress: (count, total) {
//                   setState(() {
//                     progress = (count / total);
//                   });
//                 }, cancelToken: cancelToken);
//             setState(() {
//               dowloading = false;
//               fileExists = true;
//             });
//           } catch (e) {
//             print(e);
//             setState(() {
//               dowloading = false;
//             });
//           }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//             const SnackBar(content: Text("Storage permission denied")));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error downloading file: $e")));
//     }
//   }
//
//   Future<bool> _requestPermission(Permission permission) async {
//     if (await permission.isGranted) {
//       return true;
//     } else {
//       var result = await permission.request();
//       return result == PermissionStatus.granted;
//     }
//   }
// }
// class DirectoryPath {
//   getPath() async {
//     final Directory? tempDir = await getExternalStorageDirectory();
//     final filePath = Directory("${tempDir!.path}/files");
//     if (await filePath.exists()) {
//       return filePath.path;
//     } else {
//       await filePath.create(recursive: true);
//       return filePath.path;
//     }
//   }
// }


import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../utils/Constant.dart';
import '../../Books/controllers/books_controller.dart';

class BookTypeDetails extends StatefulWidget {
  const BookTypeDetails({super.key});

  @override
  _BookTypeDetailsState createState() => _BookTypeDetailsState();
}

class _BookTypeDetailsState extends State<BookTypeDetails> {
  final BooksController booktypeDetail = Get.find<BooksController>();
  List<bool> isDownloading = [];
  List<double> downloadProgress = [];
  late String filePath;
  late CancelToken cancelToken;
  final DirectoryPath getPathFile = DirectoryPath();

  @override
  void initState() {
    super.initState();
    isDownloading = List<bool>.filled(booktypeDetail.booksbyIdDetial.value.length, false);
    downloadProgress = List<double>.filled(booktypeDetail.booksbyIdDetial.value.length, 0.0);
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
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
            size: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Constants.pimaryColor,
        title: Text(
          booktypeDetail.selectedValue2.value,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
      ),
      body: Obx(() {
        if (booktypeDetail.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Container(
            // Container details
            child: SingleChildScrollView(
              child: Column(
                children: [
                  booktypeDetail.booksbyIdDetial.value.isEmpty
                      ? const Center(child: Text("Books Not Found"))
                      : ListView.builder(
                    itemCount: booktypeDetail.booksbyIdDetial.value.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      var bookDetails = booktypeDetail.booksbyIdDetial.value[index];
                      String fileName = "${bookDetails['title'].toString()}.pdf";
                      return FutureBuilder<bool>(
                        future: fileExists(fileName),
                        builder: (context, snapshot) {
                          bool exists = snapshot.data ?? false;
                          return BookItemWidget(
                            bookDetails: bookDetails,
                            startDownload: () => startDownload(index, fileName),
                            openFile: () => openFile(fileName),
                            fileExists: exists,
                            downloading: isDownloading[index],
                            progress: downloadProgress[index],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> startDownload(int index, String fileName) async {
    var bookDetails = booktypeDetail.booksbyIdDetial.value[index];
    var fileUrl = "https://service-manager.digiatto.online/${bookDetails['file'].toString()}";
    filePath = '${await getPathFile.getPath()}/$fileName';

    try {
      if (await _requestPermission(Permission.storage)) {
        cancelToken = CancelToken();
        setState(() {
          isDownloading[index] = true;
          downloadProgress[index] = 0;
        });

        try {
          await Dio().download(fileUrl, filePath,
              onReceiveProgress: (count, total) {
                setState(() {
                  downloadProgress[index] = (count / total);
                });
              }, cancelToken: cancelToken);
          setState(() {
            isDownloading[index] = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Downloaded $filePath"),
            duration: Duration(seconds: 8),
          ));
          Get.snackbar(
            "Info",
            "Please click File to Open pdf!",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Constants.pimaryColor,
            colorText: Colors.white,
            duration: Duration(seconds: 5),
          );
        } catch (e) {
          setState(() {
            isDownloading[index] = false;
          });
          print(e);
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Storage permission denied")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error downloading file: $e")));
    }
  }

  Future<void> openFile(String fileName) async {
    final result = await OpenFile.open('${await getPathFile.getPath()}/$fileName');
    if (result.type == ResultType.error) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error opening file: ${result.message}")));
    }
    print("File path: ${await getPathFile.getPath()}/$fileName");
  }

  Future<bool> fileExists(String fileName) async {
    final filePath = '${await getPathFile.getPath()}/$fileName';
    return File(filePath).exists();
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      return result == PermissionStatus.granted;
    }
  }
}


class PdfViewerPage extends StatelessWidget {
  final String url;
  final String title;

  PdfViewerPage({required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SfPdfViewer.network(url),
    );
  }
}

class BookItemWidget extends StatelessWidget {
  final Map<String, dynamic> bookDetails;
  final void Function() startDownload;
  final void Function() openFile;
  final bool fileExists;
  final bool downloading;
  final double progress;

  const BookItemWidget({
    Key? key,
    required this.bookDetails,
    required this.startDownload,
    required this.openFile,
    required this.fileExists,
    required this.downloading,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(color: Colors.black38, blurRadius: 4, offset: Offset(2, 2))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.file_copy,
                color: Colors.teal,
                size: 35,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bookDetails['title'].toString(),
                      style: TextStyle(
                        color: Constants.blackColor,
                        fontSize: 16,
                        height: 0.98,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: Constants.pimaryColor.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    fileExists && !downloading
                        ? IconButton(
                      onPressed: openFile,
                      icon: const Icon(Icons.file_copy_sharp, color: Colors.green),
                    )
                        : downloading
                        ? Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: progress,
                          strokeWidth: 3,
                          backgroundColor: Colors.grey,
                          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                        Text(
                          "${(progress * 100).toStringAsFixed(2)}%",
                          style: TextStyle(fontSize: 12,color: Colors.white),
                        )
                      ],
                    )
                        : IconButton(
                      onPressed: startDownload,
                      icon: const Icon(Icons.download,color: Colors.white,),
                    ),
                    const SizedBox(width: 5),
                    IconButton(
                      onPressed: () {
                        Get.to(() => PdfViewerPage(
                          url: "https://service-manager.digiatto.online/${bookDetails['file'].toString()}",
                          title: bookDetails['title'].toString(),
                        ));
                      },
                      icon: const Icon(Icons.remove_red_eye, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DirectoryPath {
  Future<String> getPath() async {
    final Directory? tempDir = await getExternalStorageDirectory();
    final filePath = Directory("${tempDir!.path}/downloads");
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(recursive: true);
      return filePath.path;
    }
  }
}

