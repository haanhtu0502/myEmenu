import 'package:emenu/generated/l10n.dart';
import 'package:flutter/material.dart';

class GetTimeUtils {
  static String getGreetingByTime(BuildContext context) {
    final hour = DateTime.now().hour;

    if (hour >= 5 && hour < 11) {
      return S.of(context).goodMorning; // Sáng
    } else if (hour >= 11 && hour < 18) {
      return S.of(context).goodAfternoon; // Chiều
    } else if (hour >= 18 && hour < 22) {
      return S.of(context).goodEvening; // Tối
    } else {
      return S.of(context).goodNight; // Đêm
    }
  }
}
