import 'package:get/get.dart';

class ageDetailsScreenController extends GetxController {
  RxInt selectedDate = 0.obs;
  RxInt selectedMonth = 0.obs;
  RxInt selectedYear = 139.obs;

  DateTime dateOfBirth = DateTime(DateTime.now().year - 18, 1, 1);
  RxBool isValidAge = true.obs;

  List<String> monthList = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];

  List<int> maxDaysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

  int getMaxDaysInSelectedMonth() {
    int maxDays = maxDaysInMonth[selectedMonth.value];
    if (selectedMonth.value == 1 &&
        isLeapYear(selectedYear.value + (DateTime.now().year - 149))) {
      maxDays = 29;
    }
    return maxDays;
  }

  bool isLeapYear(int year) {
    return year % 4 == 0 && (year % 100 != 0 || year % 400 == 0);
  }

  checkAge() {
    dateOfBirth = DateTime(DateTime.now().year - 157 + selectedYear.value,
        1 + selectedMonth.value, 1 + selectedDate.value);

    Duration eightYearsOneDayAgo = const Duration(days: (8 * 365) + 3);

    if (dateOfBirth.isBefore(DateTime.now().subtract(eightYearsOneDayAgo))) {
      isValidAge.value = true;
    } else {
      isValidAge.value = false;
    }
  }
}
