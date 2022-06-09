import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../data_backend/firebase/my_login_page.dart';
import '../data_backend/firebase/page_firebase_app.dart';
import '../form/form_mathang.dart';
import '../state/mainProvider.dart';
import '../listview/my_listview.dart';
import '../weather/hours_weatherDemo.dart';
import '../widget/my_input.dart';
import '../widget/my_slider.dart';
import 'package:danganhphu_61134177/girdview/fruit_girdview.dart';
import 'package:danganhphu_61134177/sqlite/page_sqlite_app.dart';
import 'package:danganhphu_61134177/widget/my_image.dart';
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
              buildButton(context, title: 'Image', description: MyImg()),
              SizedBox(height: 10),
              buildButton(context, title: 'My Input', description: MyInput()),
              SizedBox(height: 10),
              buildButton(context, title: 'Slider', description: MySlider()),
              SizedBox(height: 10),
              buildButton(context, title: 'ListView Demo', description: MyListview()),
              SizedBox(height: 10),
              buildButton(context, title: 'Form Mặt Hàng', description: MyFormMatHang()),
              SizedBox(height: 10),
              buildButton(context, title: 'Fruit Girdview', description: MyFruit()),
              SizedBox(height: 10),
              buildButton(context, title: 'Mặt hàng Form', description: MyFormMatHang()),
              // SizedBox(height: 10),
              // buildButton(context, title: 'ChangeNotifier', description: MyQuanLySanPham()),
              SizedBox(height: 10),
              buildButton(context, title: 'SQLite demo', description: SQLiteApp()),
              SizedBox(height: 10),
              buildButton(context, title: 'FirebaseApp', description: FirebaseApp()),
              SizedBox(height: 10),
              buildButton(context, title: 'Login', description: LoginPage()),
              SizedBox(height: 10),
              buildButton(context, title: '24h Weather', description: const HoursWeatherDemo())
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
