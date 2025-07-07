import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen=Color.fromRGBO(33, 191, 115, 1);
const colorBlue=Color.fromRGBO(52, 152, 219,1.0);
const colorOrange=Color.fromRGBO(230, 126, 34,1.0);
const colorWhite=Color.fromRGBO(255, 255, 255,1.0);
const colorDarkBlue=Color.fromRGBO(44, 62, 80,1.0);
const colorLightGray=Color.fromRGBO(135, 142, 150, 1.0);
const colorLight=Color.fromRGBO(211, 211, 211, 1.0);


SvgPicture ScreenBackground(context){
  return SvgPicture.asset(
    "assets/images/screen-back.svg",
    alignment: Alignment.center,
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height,
    fit: BoxFit.cover,
  );
}


TextStyle head1Text(textColor){
  return TextStyle(
    color: textColor,
    fontSize: 28,
    fontFamily: 'poppins',
    fontWeight: FontWeight.w700,
  );
}

TextStyle head2Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 16,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}

TextStyle head3Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 15,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}

TextStyle head4Text(textColor){
  return TextStyle(
      color: textColor,
      fontSize: 9,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w500
  );
}

InputDecoration AppInputDecoration(label){
  return InputDecoration(
      focusedBorder:  const OutlineInputBorder(
        borderSide: const BorderSide(color: colorGreen, width: 1),
      ),
      fillColor: colorWhite,
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
      enabledBorder: const OutlineInputBorder(
        borderSide: const BorderSide(color: colorWhite, width: 0.0),
      ),
      border: OutlineInputBorder(),
      labelText: label
  );
}

DecoratedBox AppDropDownStyle(child){
  return DecoratedBox(
      decoration: BoxDecoration(color:Colors.white, border: Border.all(color: Colors.white, width:1), borderRadius: BorderRadius.circular(4),),
      child:Padding(
          padding: EdgeInsets.only(left:30, right:30),
          child:child
      )
  );
}

ButtonStyle AppButtonStyle(){
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      foregroundColor: colorWhite,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))
  );
}

ButtonStyle AppStatusButtonStyle(btnColor){
  return ElevatedButton.styleFrom(
    elevation: 1,
    padding: EdgeInsets.zero,
    backgroundColor: btnColor,
  );
}


TextStyle ButtonTextStyle(){
  return TextStyle(
      fontSize: 14,
      fontFamily: 'poppins',
      fontWeight: FontWeight.w400
  );
}

Ink SuccessButtonChild(String ButtonText){
  return  Ink(
    decoration: BoxDecoration(color: colorGreen, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child:Text(ButtonText,style: ButtonTextStyle(),),
    ),
  );
}

PinTheme AppOTPStyle () {
  return PinTheme(
    inactiveColor: colorGreen,
    inactiveFillColor: colorWhite,
    selectedColor: colorGreen,
    activeColor: colorWhite,
    selectedFillColor: colorWhite,
    borderRadius: BorderRadius.circular(5),
    fieldHeight: 50,
    fieldWidth: 45,
    activeFillColor: colorGreen,
    shape: PinCodeFieldShape.box,

  );
}

void successToast (String msg) {
  Fluttertoast.showToast(
      msg: msg,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorWhite,
    fontSize: 16,
    textColor: colorDark
  );
}

void errorToast (String msg) {
  Fluttertoast.showToast(msg: msg,
  gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    toastLength: Toast.LENGTH_SHORT,
    backgroundColor: colorWhite,
    textColor: colorDark,
    fontSize: 16
  );
}


SizedBox itemSizeBox (child) {
  return SizedBox(
    child: Container(
      child: child,
      padding: EdgeInsets.all(10),
    ),
  );
}