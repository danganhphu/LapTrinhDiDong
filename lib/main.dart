import 'package:danganhphu_61134177/widget/my_carousels.dart';
import 'package:danganhphu_61134177/widget/my_counter.dart';
import 'package:danganhphu_61134177/widget/my_image.dart';
import 'package:danganhphu_61134177/widget/my_input.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: CarouselDemo()
    );
  }
}