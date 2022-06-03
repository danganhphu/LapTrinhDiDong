import 'package:flutter/material.dart';

class MyImg extends StatefulWidget {
  const MyImg({Key? key}) : super(key: key);

  @override
  State<MyImg> createState() => _MyImgState();
}

class _MyImgState extends State<MyImg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Image"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300,
              width: 300,
              child: Image.asset("asset/img/crip_blood.jpg"),
            ),
            Row(
              children: const [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
                Text("200 Đánh giá")

              ],
            )
          ],
        ),
      ),
    );
  }
}