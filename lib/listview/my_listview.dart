import 'package:flutter/material.dart';

List <String> mh = ['mận', 'mơ', 'đào', 'chuối',
  'na', 'đào', 'chanh', 'bưởi', 'ổi', 'xoài', 'quất', 'nho'];

class MyListview extends StatefulWidget {
  const MyListview({Key? key}) : super(key: key);
  final String title = "Bài Tập Listview";
  @override
  State<MyListview> createState() => _MyListviewState();
}

class _MyListviewState extends State<MyListview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.card_giftcard),
              title: Text(mh[index]),
              subtitle: Text('trái cây'),

            );
          },
          separatorBuilder: (context, index) => const Divider(thickness: 2),
          itemCount: mh.length),
    );
  }
}
