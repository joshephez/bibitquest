import 'dart:async';
import 'package:bibitquest/homepage/controller/home_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:get/get.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.grey,
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onVerticalDragEnd: (details) {
                    if (details.primaryVelocity!.isNegative) {
                      controller.setHour(1);
                    } else {
                      controller.setHour(0);
                    }
                    setState(() {});
                  },
                  onPanUpdate: (details) {
                    if (details.delta.dy > 0) {
                      controller.setMinute(1);
                    } else if (details.delta.dy < 0) {
                      controller.setMinute(0);
                    }
                    setState(() {});
                  },
                  child: Center(
                    child: Container(
                        width: 300,
                        height: 300,
                        child: FlutterAnalogClock(
                          dateTime: controller.clockDateTime,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                DateTimePicker(
                  type: DateTimePickerType.time,
                  timePickerEntryModeInput: true,

                  initialValue: '', //_initialValue,
                  icon: const Icon(Icons.access_time),
                  timeLabelText: "Alarm",
                  use24HourFormat: true,

                  onChanged: (val) {
                    controller.timeSavedAlarm(val);
                    setState(() {});
                  },
                ),
                // ClockWidget(dateTime: controller.dateTime, c: controller)
              ],
            ),
          ));
    });
  }
}
