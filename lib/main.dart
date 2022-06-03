import 'package:danganhphu_61134177/navigation_routing/my_route.dart';
import 'package:danganhphu_61134177/shared_preferences/my_counter.dart';
import 'package:danganhphu_61134177/sqlite/page_sqlite_app.dart';
import 'package:danganhphu_61134177/state/list_mathang_provider.dart';
import 'package:danganhphu_61134177/state/show_mathang_provider.dart';
import 'package:danganhphu_61134177/widget/my_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data_backend/firebase/my_login_page.dart';
import 'data_backend/firebase/page_firebase_app.dart';
import 'data_backend/json_serialization/rss/my_rss_vnexpress.dart';
import 'navigation_bar/my_navigation_bar.dart';

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

