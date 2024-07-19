import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/Constant.dart';

class Leave extends StatelessWidget {
  const Leave({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 8),
          // margin: EdgeInsets.symmetric(horizontal: 8),
          decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color:Colors.black38,
                    blurRadius: 4,
                    offset: Offset(2, 2))
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      "Leave",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: Colors.black
                      )
                  ),
                  Text.rich(
                    TextSpan(
                        children: [
                          TextSpan(
                              text: "Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.black
                              )
                          ),
                          TextSpan(
                              text: ":",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                  color: Colors.black
                              )
                          ),
                          TextSpan(
                              text: "13-05-2021",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: Colors.black
                              )
                          )
                        ]
                    ),
                  )
                ],
              ),
              Divider(color: Color(0xFFF2F2F2),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                        child: Text(
                            "APL",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: Constants.blackColor
                            )
                        )
                    ),
                    MaterialButton(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                              color: Constants.secondaryColor
                          )
                      ),
                      onPressed: () {

                      },
                      height: 32,
                      minWidth: 50,
                      color: Constants.secondaryColor,
                      child: Center(
                          child:Icon(Icons.cancel,color: Constants.whiteColor,)
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
