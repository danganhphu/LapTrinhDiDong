import 'package:danganhphu_61134177/navigation_routing/my_route.dart';
import 'package:danganhphu_61134177/weather/hours_weatherDemo.dart';
import 'package:danganhphu_61134177/weather/hours_wether.dart';
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

//test code
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

