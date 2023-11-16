import 'package:get/get.dart';

class notificationScreenController extends GetxController {
  RxInt selectedNotificationType = 0.obs;

  RxList<List<dynamic>> tempNotificationList = [
    [false, "Congratulations", "35% your daily challenge completed", "9:45 AM"],
    [false, "Attention", "Your subscription is going to expire very soon. Subscribe now.", "9:38 AM"],
    [true, "Daily Activity", "Time for your workout session", "8:25 AM"],
  ].obs;

  void removeFromList(int index) {
    tempNotificationList.removeAt(index);
  }

}
