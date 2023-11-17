import 'package:get/get.dart';

class activityLevelDetailsScreenController extends GetxController {
  RxList<String> activityList = [
    "Rookie",
    "Beginner",
    "Intermediate",
    "Advance",
    "True Beast",
  ].obs;
  RxInt selectedActivityListIndex = 2.obs;

}
