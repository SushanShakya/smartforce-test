import 'dart:math';

import 'package:flutter/material.dart';

class MatchGenerator {
  static int generateMatch() {
    return Random().nextInt(49) + 50;
  }
}

class DateConverter {
  static Map<int, String> _months = {
    1: "Jan.",
    2: "Feb.",
    3: "Mar.",
    4: "Apr.",
    5: "May",
    6: "Jun.",
    7: "Jul.",
    8: "Aug.",
    9: "Sep.",
    10: "Oct.",
    11: "Nov.",
    12: "Dec.",
  };

  static Map<int, String> _weekDay = {
    1: 'Mon',
    2: 'Tue',
    3: 'Wed',
    4: 'Thu',
    5: 'Fri',
    6: 'Sat',
    7: 'Sun'
  };

  static String formatDate(DateTime date) {
    return "${_weekDay[date.weekday].toUpperCase()}, ${_months[date.month].toUpperCase()} ${date.day}";
  }

  static String convertTimeToString(TimeOfDay time) {
    if (time.hour > 12 || (time.hour == 12 && time.minute > 0)) {
      // PM
      var hr = time.hour == 12 ? 12 : time.hour - 12;
      return "$hr:${time.minute.toString().padLeft(2, '0')} PM";
    } else {
      //AM
      var hr = time.hour == 0 ? 12 : time.hour;
      return "$hr:${time.minute.toString().padLeft(2, '0')} AM";
    }
  }
}
