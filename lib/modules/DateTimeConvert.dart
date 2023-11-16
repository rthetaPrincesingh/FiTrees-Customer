List<String> WeeknameList = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
List<String> MonthnameList = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

String weekDayToWeekname(int weekday){
  return WeeknameList[weekday - 1];
}

String monthToMonthname(int month){
  return MonthnameList[month - 1];
}

String formatTime(DateTime dateTime) {
  int hour = dateTime.hour;
  int minute = dateTime.minute;
  String period = (hour < 12) ? 'AM' : 'PM';

  if (hour == 0) {
    hour = 12;
  } else if (hour > 12) {
    hour = hour - 12;
  }

  String hourStr = hour.toString().padLeft(2, '0');
  String minuteStr = minute.toString().padLeft(2, '0');

  return '$hourStr:$minuteStr $period';
}