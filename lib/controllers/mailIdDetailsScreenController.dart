import 'package:flutter/material.dart';
import 'package:get/get.dart';

class mailIdDetailsScreenController extends GetxController{
  TextEditingController emailTextController = TextEditingController();

  RegExp emailRegExp = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");

  String? validateEmail(){
    if (emailTextController.text.isNotEmpty && !emailRegExp.hasMatch(emailTextController.text)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

}