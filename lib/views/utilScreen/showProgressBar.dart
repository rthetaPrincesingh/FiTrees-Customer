import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';

Future showProgressBar(context){
  return showDialog(context: context, builder: (context){
    return Center(
      child: CircularProgressIndicator(
        color: primaryColor,
      ),
    );
  });
}