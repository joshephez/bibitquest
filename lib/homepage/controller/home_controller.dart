import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeController extends GetxController {
  late DateTime clockDateTime;
  var timeChanged;
  var timeToValidate;
  var timeSaved;

  @override
  void onInit() {
    clockDateTime = DateTime.now();
    super.onInit();
  }

  timeSavedAlarm(val) {
    timeSaved = val ?? '';
    debugPrint('checkValue  ==>' + timeSaved.toString());

    update();
  }

  setHour(int xy) {
    if (xy == 1) {
      clockDateTime = clockDateTime.subtract(const Duration(hours: -1));
    } else {
      clockDateTime = clockDateTime.subtract(const Duration(hours: 1));
    }
  }

  setMinute(int xy) {
    if (xy == 1) {
      clockDateTime = clockDateTime.subtract(const Duration(minutes: -1));
    } else {
      clockDateTime = clockDateTime.subtract(const Duration(minutes: 1));
    }
  }
}
