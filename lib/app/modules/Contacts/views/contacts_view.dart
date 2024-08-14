import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:serviceman/app/modules/Contacts/views/ListOfContacts.dart';
import 'package:serviceman/app/modules/Contacts/views/offlinecontact.dart';

import '../../../../utils/Constant.dart';
import '../controllers/contacts_controller.dart';

class ContactsView extends GetView<ContactsController> {
  ContactsView({Key? key}) : super(key: key);
  ContactsController contactsController = Get.put(ContactsController());
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
          "Contacts",
          textScaler: TextScaler.linear(1),
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontWeight: FontWeight.w400,
              fontSize: 22),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10.0),
        //     child: InkWell(
        //       onTap: () {
        //         Get.to(OfflineContact());
        //       },
        //       child: Row(
        //         children: [
        //           Icon(
        //             Icons.offline_pin_outlined,
        //             size: 25,
        //             color: Constants.whiteColor,
        //           ),
        //           SizedBox(width: 5,),
        //           Text("Offline",style: TextStyle(
        //             fontSize: 18,
        //             color: Constants.whiteColor,
        //           ),),
        //           Icon(
        //             Icons.arrow_forward_ios,
        //             size: 25,
        //             color: Constants.whiteColor,
        //           ),
        //         ],
        //       ),
        //     ),
        //   ),
        // ],
      ),
      body: Obx(() => contactsController.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFFF2F2F2),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(2, 2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.65,
                              child: TextFormField(
                                cursorColor: Color(0xFF242B42),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontFamily: 'Urbanist',
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF191A26),
                                ),
                                controller: contactsController.searchController,
                                // inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  hintText: "Search Contacts",
                                  labelText: "Search Contacts",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Constants.pimaryColor,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Constants.pimaryColor,
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Constants.pimaryColor,
                                        width: 1.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  contactsController.filterContacts(value);
                                },
                              ),
                            ),
                            Container(
                              height: 35,
                              width: 90,
                              // padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
                              // margin: EdgeInsets.only(right:8,top: 8),
                              decoration: BoxDecoration(
                                  color: Constants.pimaryColor,
                                  borderRadius: BorderRadius.circular(5)),
                              child: MaterialButton(
                                onPressed: () {
                                  contactsController.filterContacts(
                                      contactsController.searchController.text);
                                },
                                height: 35,
                                minWidth: 90,
                                child: Center(
                                  child: Text(
                                    "Search",
                                    textScaler: TextScaler.noScaling,
                                    style: TextStyle(
                                        color: Constants.whiteColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.76,
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black38,
                                blurRadius: 4,
                                offset: Offset(2, 2))
                          ]),
                      child: Obx(() => GridView.builder(
                            itemCount: contactsController
                                .filteredContacts.value.length,
                            itemBuilder: (context, index) {
                              var contact = contactsController
                                  .filteredContacts.value[index];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      contactsController.getContactById(
                                          contact['id'].toString());
                                      contactsController.selectValue1(
                                          contact['department'].toString());
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 15),
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black38,
                                                blurRadius: 4,
                                                offset: Offset(2, 2))
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 55,
                                              width: 55,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Constants
                                                          .pimaryColor,
                                                      width: 3)),
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: Icon(
                                                    Icons.person_outline,
                                                    size: 30,
                                                    color: Colors.black,
                                                  )),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              contact['department']
                                                  .toString(),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: TextStyle(
                                                  color: Constants.blackColor,
                                                  fontSize: 16),
                                            ),
                                            Text(
                                              "${contact['contact_count']} Contacts",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            )
                                          ],
                                        ),
                                        // Icon(Icons.arrow_circle_right_outlined,color: Constants.pimaryColor,size: 30,),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 1.1),
                          )),
                    )
                  ],
                ),
              ),
            )),
    );
  }
}
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
//
// import 'package:get/get.dart';
// import 'package:serviceman/app/modules/Contacts/views/ListOfContacts.dart';
// import 'package:serviceman/app/modules/Contacts/views/offlinecontact.dart';
//
// import '../../../../utils/Constant.dart';
// import '../controllers/contacts_controller.dart';
//
// class ContactsView extends GetView<ContactsController> {
//   ContactsView({Key? key}) : super(key: key);
//   ContactsController contactsController=Get.put(ContactsController());
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 60,
//         leading: GestureDetector(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(
//             Icons.arrow_back_ios_new,
//             color: Colors.white,
//             size: 25,
//           ),
//         ),
//         centerTitle:true,
//         backgroundColor: Constants.pimaryColor,
//         title: Text(
//           "Contacts",
//           textScaler: TextScaler.linear(1),
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: Color(0xFFFFFFFF),
//               fontWeight: FontWeight.w400,
//               fontSize: 22),
//         ),
//         // actions: [
//         //   Padding(
//         //     padding: const EdgeInsets.only(right: 10.0),
//         //     child: InkWell(
//         //       onTap: () {
//         //         Get.to(OfflineContact());
//         //       },
//         //       child: Row(
//         //         children: [
//         //           Icon(
//         //             Icons.offline_pin_outlined,
//         //             size: 25,
//         //             color: Constants.whiteColor,
//         //           ),
//         //           SizedBox(width: 5,),
//         //           Text("Offline",style: TextStyle(
//         //             fontSize: 18,
//         //             color: Constants.whiteColor,
//         //           ),),
//         //           Icon(
//         //             Icons.arrow_forward_ios,
//         //             size: 25,
//         //             color: Constants.whiteColor,
//         //           ),
//         //         ],
//         //       ),
//         //     ),
//         //   ),
//         // ],
//       ),
//       body:Obx(()=>contactsController.isLoading.value?Center(child: CircularProgressIndicator(),):Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         color: Color(0xFFF2F2F2),
//         child:SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: 10,),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 5),
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 decoration:BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                     boxShadow: [
//                       BoxShadow(color:Colors.black38,
//                           blurRadius: 4,
//                           offset: Offset(2, 2))
//                     ]
//                 ),
//                 child:  Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       SizedBox(width: MediaQuery.of(context).size.width/1.65,
//
//                         child: TextFormField(
//                           cursorColor: Color(0xFF242B42),
//                           style: TextStyle(fontSize: 13,
//                             fontFamily: 'Urbanist',
//                             fontWeight: FontWeight.w700,
//                             color: Color(0xFF191A26),
//                           ),
//                           controller: contactsController.searchController,
//                           // inputFormatters: [LengthLimitingTextInputFormatter(6)],
//                           keyboardType: TextInputType.text,
//                           decoration: InputDecoration(
//                             contentPadding: EdgeInsets.symmetric(horizontal: 10),
//                             hintText: "Search Contacts",
//                             labelText:"Search Contacts",
//                             hintStyle: TextStyle(fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                               color: Constants.pimaryColor,
//                             ),
//                             labelStyle: TextStyle(fontSize: 14,
//                               fontWeight: FontWeight.w400,
//                               color: Constants.pimaryColor,
//                             ),
//                             disabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey,width: 1.0),
//                             ),
//                             errorBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.red,width: 1.0),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.grey,width: 1.0),
//                             ),
//                             focusedBorder: OutlineInputBorder(
//                               borderSide:
//                               BorderSide(color: Constants.pimaryColor, width: 1.0),
//                             ),
//                           ),
//                           onChanged: (value) {
//                             contactsController.filterContacts(value);
//                           },
//                         ),
//                       ),
//                       Container(
//                         height: 35,
//                         width: 90,
//                         // padding: EdgeInsets.symmetric(horizontal: 15,vertical:6),
//                         // margin: EdgeInsets.only(right:8,top: 8),
//                         decoration: BoxDecoration(
//                             color:Constants.pimaryColor,
//                             borderRadius: BorderRadius.circular(5)
//                         ),
//                         child: MaterialButton(
//                           onPressed: () {
//                             contactsController.filterContacts(contactsController.searchController.text);
//                           },
//                           height: 35,
//                           minWidth: 90,
//                           child: Center(
//                             child: Text(
//                               "Search",textScaler: TextScaler.noScaling,style: TextStyle(
//                                 color: Constants.whiteColor,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w400
//                             ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 height: MediaQuery.of(context).size.height*0.76,
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(vertical: 5),
//                 margin: EdgeInsets.symmetric(horizontal: 5),
//                 decoration:BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                     boxShadow: [
//                       BoxShadow(color:Colors.black38,
//                           blurRadius: 4,
//                           offset: Offset(2, 2))
//                     ]
//                 ),
//                 child: contactsController.isLoading.value?ListView.builder(itemCount: contactsController.filteredContacts.value.length,itemBuilder:
//                     (context, index) {
//                   var contact=contactsController.filteredContacts.value[index];
//                   return Obx(()=> Column(children: [
//                     GestureDetector(
//                       onTap: () {
//                         contactsController.getContactById(contact['id'].toString());
//                         contactsController.selectValue1(contact['department'].toString());
//                       },
//                       child: Container(
//                         width: double.infinity,
//                         padding: EdgeInsets.symmetric(vertical: 15),
//                         margin: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
//                         decoration:BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(5),
//                             boxShadow: [
//                               BoxShadow(color:Colors.black38,
//                                   blurRadius: 4,
//                                   offset: Offset(2, 2))
//                             ]
//                         ),
//                         child:  Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               SizedBox(
//                                 width: MediaQuery.of(context).size.width/1.8,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(contact['department'].toString(),
//                                       softWrap: true,
//                                       overflow: TextOverflow.ellipsis,
//                                       maxLines: 2,
//                                       style: TextStyle(
//                                           color: Constants.blackColor,
//                                           fontSize: 18
//                                       ),),
//                                     Text("${contact['contact_count']} Contacts",
//                                       style: TextStyle(
//                                           color: Colors.grey,
//                                           fontSize: 12
//                                       ),)
//                                   ],
//                                 ),
//                               ),
//                               Icon(Icons.arrow_circle_right_outlined,color: Constants.pimaryColor,size: 30,),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],));
//                 },
//                 ),
//               )
//             ],
//           ),
//         ),
//       )),
//     );
//   }
// }
