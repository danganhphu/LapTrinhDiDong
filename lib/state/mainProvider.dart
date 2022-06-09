import 'package:danganhphu_61134177/state/show_mathang_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_mathang_provider.dart';

class MyQuanLySanPham extends StatelessWidget {
  const MyQuanLySanPham({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => QuanLySanPham(),
            child: ProductPage(),
    );
  }
}
