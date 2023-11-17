import 'package:fitrees_customer/views/mainScreens/notificationScreen/notificationScreen.dart';
import 'package:fitrees_customer/views/mainScreens/insightScreen/insightScreen.dart';
import 'package:fitrees_customer/views/mainScreens/profileScreen/profileScreen.dart';
import 'package:fitrees_customer/views/mainScreens/homeScreen/homeScreen.dart';
import 'package:fitrees_customer/views/mainScreens/searchScreen/searchScreen.dart';
import 'package:get/get.dart';

class navigationBarController extends GetxController{
  List screensList = [
    const homeScreen(),
    const searchScreen(),
    const insightScreen(),
    const notificationScreen(),
    const profileScreen(),
  ];
  RxInt screenSelected = 0.obs;

  @override
  void onInit() {
    fetchUpdatedData();
    super.onInit();
  }

  fetchUpdatedData(){

  }
}