import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class trainerDetailsScreen extends StatelessWidget {
  const trainerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: RawMaterialButton(
            onPressed: () => Get.back(),
            elevation: 0,
            fillColor: lightGreyColor,
            padding: const EdgeInsets.all(10),
            shape: const CircleBorder(),
            child: const Icon(Icons.arrow_back_ios_new_rounded,
                color: Colors.white, size: 20),
          ),
        ) ,
      ),
    );
  }
}
