import 'package:fitrees_customer/controllers/screensControllers/splashScreenController.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(splashScreenController());
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png", //todo Change image png to svg
              height: MediaQuery.of(context).size.width / 3.5,
              fit: BoxFit.fill,
            ),
            const SizedBox(height: 30),
            Image.asset(
              "assets/logo-full.png", //todo Change image png to svg
              width: MediaQuery.of(context).size.width / 2.5,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
