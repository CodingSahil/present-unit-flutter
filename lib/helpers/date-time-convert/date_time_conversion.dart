import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeConversion {
  static final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
  static final DateFormat timeFormat = DateFormat('hh:mm a');

  static String convertDateIntoString(DateTime date) {
    return dateFormat.format(date);
  }

  static DateTime convertStringToDate(String formattedDateString) {
    return dateFormat.parse(formattedDateString);
  }

  static String convertTimeIntoString(TimeOfDay time) {
    final now = DateTime.now();
    final DateTime dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return timeFormat.format(dateTime);
  }

  static TimeOfDay convertStringToTime(String timeString) {
    final DateTime dateTime = timeFormat.parse(timeString);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }

  static String convertDateTimeIntoString(DateTime time) {
    final now = DateTime.now();
    final DateTime dateTime = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return timeFormat.format(dateTime);
  }

  static DateTime convertStringToDateTime(String timeString) {
    return timeFormat.parse(timeString);
  }

  static String convertMinutesToHours(int minutes) {
    int hours = minutes ~/ 60; // Integer division to get hours
    int remainingMinutes = minutes % 60; // Modulus to get remaining minutes
    return "${hours > 9 ? hours : '0$hours'} : ${remainingMinutes > 9 ? remainingMinutes : '0$remainingMinutes'}";
  }

}
