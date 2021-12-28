import 'package:bibitquest/homepage/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'homepage/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
  Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
