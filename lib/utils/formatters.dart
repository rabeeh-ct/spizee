import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

durationToMs(Duration duration) {
  int totalMinutes = duration.inMinutes;
  int totalSeconds = duration.inSeconds;

  int minutes = totalMinutes % 60;
  int seconds = totalSeconds % 60;

  return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}

String dateMonthYear(DateTime dateTime) {
  final convertedDate = DateFormat.yMMMMd().format(dateTime);
  return convertedDate;
}

String formatDuration(DateTime date) {
  Duration duration = DateTime.now().difference(date);
  int hours = duration.inHours;
  int days = duration.inDays;

  if (hours < 24) {
    return '${hours}h';
  } else {
    return '${days}d';
  }
}

String stringTimeFormat(String time, {String? local}) {
  return DateFormat.jm(local).format(DateFormat("hh:mm:ss").parse(time));
}

TimeOfDay convertToTimeOfDay(String timeString) {
  List<String> parts = timeString.split(':');
  int hour = int.parse(parts[0]);
  int minute = int.parse(parts[1]);
  return TimeOfDay(hour: hour, minute: minute);
}

String firstLetterCapital(String str){
  return str[0].toUpperCase()+str.replaceRange(0, 1, "").toLowerCase();
}
