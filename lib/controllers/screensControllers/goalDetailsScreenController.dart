import 'package:get/get.dart';

class goalDetailsScreenController extends GetxController{
  List<String> goalList = [
    "Gain Weight",
    "Lose Weight",
    "Get Fitter",
    "Gain more flexible",
    "Learn the basic"
  ];
  RxInt selectedGoalListIndex = 2.obs;
}