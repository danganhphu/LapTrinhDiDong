import 'package:danganhphu_61134177/girdview/fruit_girdview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../form/form_mathang.dart';
import '../widget/my_carousels.dart';
import '../listview/my_listview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Route'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            children:[
              SizedBox(height: 5),
              buildButton(context, title: 'ListView Demo', description: MyListview()),
              SizedBox(height: 10),
              buildButton(context, title: 'Slider', description: CarouselDemo()),
              SizedBox(height: 10),
              buildButton(context, title: 'Mặt hàng Form', description: MyFormMatHang()),
              SizedBox(height: 10),
              buildButton(context, title: 'Fruit Girdview', description: MyFruit())
            ],
          ),
      )
    );
  }

  Widget buildButton(BuildContext context, {required String title, required Widget description}) =>SizedBox(
      width: 250,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6.0),
              textStyle: const TextStyle(fontSize: 24),
              primary: Colors.teal
          ),
          onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => description,));
        }, child: Text(title))
  );
}
