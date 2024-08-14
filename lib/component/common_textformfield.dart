import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';


class CommonTextFormField extends StatelessWidget {
  String labletext;
  TextInputType keyboardTypes;
  TextEditingController controller;
  int? maxline;
  TextInputFormatter? input;
  Widget? icons;
 final FormFieldValidator? validator;
  // final FormFieldValidator? validator;

  CommonTextFormField({required this.labletext, required this.keyboardTypes,
     required this.controller,this.maxline,this.input,this.icons,this.validator});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        style: TextStyle(
          color: Colors.black,
          fontSize: 14
        ),
        controller: controller,
        cursorColor: Colors.blue,
        textInputAction: TextInputAction.done,
        keyboardType: keyboardTypes,
        maxLines: maxline,
        onChanged:validator,
        inputFormatters: [
          if (input != null) input!,
        LengthLimitingTextInputFormatter(20),
        ],
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 10,top: 2),
          labelText: labletext,
          labelStyle:TextStyle(
            color:Colors.blue,
            fontSize:14,
            fontWeight:FontWeight.w400,
          ),
          suffix: icons,
          floatingLabelStyle: TextStyle(
            color:Colors.blue,
            fontSize:14,
            fontWeight:FontWeight.w400,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red,width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey,width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
            BorderSide(color: Colors.blue, width: 2.0),
          ),
        ),
      ),
    );
  }
}
