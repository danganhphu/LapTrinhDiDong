import 'package:flutter/material.dart';

class MyIput extends StatefulWidget {
  const MyIput({Key? key}) : super(key: key);

  @override
  State<MyIput> createState() => _MyInputState();
}

class _MyInputState extends State<MyIput> {
  TextEditingController  nameEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Input"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(

          )

        ),
      ),
    );
  }
}