import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:serviceman/app/modules/Contacts/controllers/contacts_controller.dart';

import '../../../../utils/Constant.dart';

class ListOfContacts extends StatelessWidget {
  ListOfContacts({super.key});
  ContactsController listContactController = Get.put(ContactsController());
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
            listContactController.selectedValue1.value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            textScaler: TextScaler.linear(1),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w400,
                fontSize: 22),
          ),
        ),
        body: Obx(() {
          if (listContactController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Container(
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
                                // inputFormatters: [LengthLimitingTextInputFormatter(6)],
                                keyboardType: TextInputType.text,
                                controller:
                                    listContactController.searchbyidController,
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
                                  listContactController
                                      .filterContactsbyDep(value);
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
                                  listContactController.filterContactsbyDep(
                                      listContactController
                                          .searchbyidController.text);
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
                      height: 25,
                    ),
                    Container(
                      child: (listContactController.isLoading.value)
                          ? Center(child: CircularProgressIndicator())
                          : (listContactController.contactsbyDep.value.isEmpty)
                              ? Container(
                                  child: Center(
                                      child: Text(
                                          textScaler: TextScaler.linear(1.0),
                                          "Contacts Not Found",
                                          style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.w500))))
                              : Obx(() => GridView.builder(
                                    itemCount: listContactController
                                        .filteredContactsbyDep.length,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var contactById = listContactController
                                          .filteredContactsbyDep[index];
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              width: double.infinity,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 15),
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 8, vertical: 5),
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
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Container(
                                                        height: 55,
                                                        width: 55,
                                                        decoration: BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: Constants
                                                                    .pimaryColor,
                                                                width: 3)),
                                                        child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Icon(
                                                              Icons
                                                                  .person_outline,
                                                              size: 30,
                                                              color:
                                                                  Colors.black,
                                                            )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        contactById['name']
                                                            .toString(),
                                                        softWrap: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            color: Constants
                                                                .blackColor,
                                                            fontSize: 16),
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        listContactController.selectValue(contactById['landline'].toString(),);
                                                        listContactController.selectedValue.value=='NA'?null: listContactController.setCallingNumber(listContactController.selectedValue.value);
                                                      },
                                                      child: Text.rich(
                                                        TextSpan(children: [
                                                          TextSpan(
                                                              text: "RLY",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  fontSize: 15,
                                                                  color: Constants
                                                                      .pimaryColor)),
                                                          TextSpan(
                                                              text: ":   ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black)),
                                                          TextSpan(
                                                              text: contactById[
                                                                      'landline']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black))
                                                        ]),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                   InkWell(
                                                     onTap: () {
                                                       listContactController.selectValue(contactById['mobile1'].toString());
                                                       listContactController.selectedValue.value=='NA'?null: listContactController.setCallingNumber(listContactController.selectedValue.value);
                                                     },
                                                     child: Text.rich(
                                                       maxLines: 1,
                                                       overflow: TextOverflow.ellipsis,
                                                       softWrap: true,
                                                        TextSpan(children: [
                                                          WidgetSpan(
                                                              child: Icon(
                                                            Icons
                                                                .store_mall_directory,
                                                            color: Constants
                                                                .pimaryColor,
                                                          )),
                                                          TextSpan(
                                                              text: ":  ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black)),
                                                         TextSpan(
                                                              text: contactById[
                                                                      'mobile1']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black))
                                                        ]),
                                                      ),
                                                   ),
                                                    InkWell(
                                                      onTap: () {
                                                        listContactController.selectValue(contactById['mobile2'].toString());
                                                        listContactController.selectedValue.value=='NA'?null: listContactController.setCallingNumber(listContactController.selectedValue.value);
                                                      },
                                                      child: Text.rich(
                                                        TextSpan(children: [
                                                          WidgetSpan(
                                                              child: Icon(
                                                            Icons.phone,
                                                            color: Constants
                                                                .pimaryColor,
                                                          )),
                                                          TextSpan(
                                                              text: ":  ",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black)),
                                                          TextSpan(
                                                              text: contactById[
                                                                      'mobile2']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black))
                                                        ]),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        softWrap: true,
                                                      ),
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        listContactController.selectValue(contactById['whatsapp'].toString());
                                                        listContactController.selectedValue.value=='NA'?null: listContactController.setCallingNumber(listContactController.selectedValue.value);
                                                      },
                                                      child: Text.rich(
                                                        TextSpan(children: [
                                                          TextSpan(
                                                              text: "Whatsapp",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 13,
                                                                  color: Constants
                                                                      .pimaryColor)),
                                                          TextSpan(
                                                              text: ":",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black)),
                                                          TextSpan(
                                                              text: contactById[
                                                                      'whatsapp']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                overflow: TextOverflow.ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  fontSize: 13,
                                                                  color: Colors
                                                                      .black))
                                                        ]),
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                        softWrap: true,
                                                      ),
                                                    ),
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
                                            crossAxisSpacing: 5,
                                            childAspectRatio: 0.8),
                                  )),

                      // ListView.builder(
                      //             itemCount: listContactController
                      //                 .filteredContactsbyDep.length,
                      //             shrinkWrap: true,
                      //             physics: NeverScrollableScrollPhysics(),
                      //             itemBuilder:
                      //                 (BuildContext context, int index) {
                      //               var contactById = listContactController
                      //                   .filteredContactsbyDep[index];
                      //               return Column(
                      //                 children: [
                      //                   Obx(
                      //                     () => Container(
                      //                       width: double.infinity,
                      //                       margin: EdgeInsets.symmetric(
                      //                           horizontal: 5, vertical: 5),
                      //                       decoration: BoxDecoration(
                      //                           color: Colors.white,
                      //                           borderRadius:
                      //                               BorderRadius.circular(5),
                      //                           boxShadow: [
                      //                             BoxShadow(
                      //                                 color: Colors.black38,
                      //                                 blurRadius: 4,
                      //                                 offset: Offset(2, 2))
                      //                           ]),
                      //                       child: ExpansionTile(
                      //                         leading: Icon(
                      //                         Icons.favorite,
                      //                           size: 30,
                      //                           color:
                      //                           ((listContactController.isExpanded.value==index)&&listContactController.isFavirate.value)
                      //                                   ? Constants
                      //                               .pimaryColor
                      //                                   : Colors.grey
                      //                         ),
                      //                         title: Text(
                      //                           contactById['name'].toString(),
                      //                           style: TextStyle(
                      //                             color:  ((listContactController.isExpanded.value==index)&&listContactController.isFavirate.value)
                      //                                 ? Colors.blue
                      //                                 : Constants.blackColor,
                      //                           ),
                      //                         ),
                      //                         trailing: ((listContactController.isExpanded.value==index)&&listContactController.isFavirate.value)
                      //                             ? Icon(
                      //                                 Icons.keyboard_arrow_up,
                      //                                 size: 30,
                      //                                 color: Colors.blue,
                      //                               )
                      //                             : Icon(
                      //                                 Icons
                      //                                     .keyboard_arrow_down,
                      //                                 size: 30,
                      //                                 color: Colors.grey,
                      //                               ),
                      //                         onExpansionChanged:
                      //                             (bool expanded) {
                      //                           listContactController.toggleExpanded(index);
                      //                         },
                      //                         shape: InputBorder.none,
                      //                         expandedAlignment:
                      //                             Alignment.topLeft,
                      //                         childrenPadding:
                      //                             EdgeInsets.symmetric(
                      //                                 horizontal: 20),
                      //                         children: <Widget>[
                      //                           Text.rich(
                      //                             TextSpan(children: [
                      //                               TextSpan(
                      //                                   text: "RLY",
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w700,
                      //                                       fontSize: 15,
                      //                                       color: Colors
                      //                                           .black)),
                      //                               TextSpan(
                      //                                   text: ":   ",
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w500,
                      //                                       fontSize: 13,
                      //                                       color: Colors
                      //                                           .black)),
                      //                               TextSpan(
                      //                                   text: contactById[
                      //                                           'landline']
                      //                                       .toString(),
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w400,
                      //                                       fontSize: 13,
                      //                                       color:
                      //                                           Colors.black))
                      //                             ]),
                      //                           ),
                      //                           Text.rich(
                      //                             TextSpan(children: [
                      //                               WidgetSpan(
                      //                                   child: Icon(
                      //                                 Icons
                      //                                     .store_mall_directory,
                      //                                 color: Colors.black,
                      //                               )),
                      //                               TextSpan(
                      //                                   text: ":  ",
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w500,
                      //                                       fontSize: 13,
                      //                                       color: Colors
                      //                                           .black)),
                      //                               TextSpan(
                      //                                   text:
                      //                                       contactById[
                      //                                               'mobile1']
                      //                                           .toString(),
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w400,
                      //                                       fontSize: 13,
                      //                                       color:
                      //                                           Colors.black))
                      //                             ]),
                      //                           ),
                      //                           Text.rich(
                      //                             TextSpan(children: [
                      //                               WidgetSpan(
                      //                                   child: Icon(
                      //                                 Icons.phone,
                      //                                 color: Colors.black,
                      //                               )),
                      //                               TextSpan(
                      //                                   text: ":  ",
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w500,
                      //                                       fontSize: 13,
                      //                                       color: Colors
                      //                                           .black)),
                      //                               TextSpan(
                      //                                   text:
                      //                                       contactById[
                      //                                               'mobile2']
                      //                                           .toString(),
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w400,
                      //                                       fontSize: 13,
                      //                                       color:
                      //                                           Colors.black))
                      //                             ]),
                      //                           ),
                      //                           Text.rich(
                      //                             TextSpan(children: [
                      //                               TextSpan(
                      //                                   text: "Whatsapp",
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w600,
                      //                                       fontSize: 13,
                      //                                       color: Colors
                      //                                           .black)),
                      //                               TextSpan(
                      //                                   text: ":",
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w500,
                      //                                       fontSize: 13,
                      //                                       color: Colors
                      //                                           .black)),
                      //                               TextSpan(
                      //                                   text: contactById[
                      //                                           'whatsapp']
                      //                                       .toString(),
                      //                                   style: TextStyle(
                      //                                       fontWeight:
                      //                                           FontWeight
                      //                                               .w400,
                      //                                       fontSize: 13,
                      //                                       color:
                      //                                           Colors.black))
                      //                             ]),
                      //                           ),
                      //                           SizedBox(
                      //                             height: 15,
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               );
                      //             },
                      //           )
                    )
                  ],
                ),
              ),
            );
          }
        }));
  }
}
