import 'package:danganhphu_61134177/navigation_routing/my_route.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

//test code
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) =>
      const MaterialApp(
        home: MyHomePage()
    );

}

