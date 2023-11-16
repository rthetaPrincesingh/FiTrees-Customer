import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fitrees_customer/themes.dart';
import 'package:fitrees_customer/views/splashScreen/splashScreen.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fitrees Customer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
      ),
      home: splashScreen(),
    );
  }
}