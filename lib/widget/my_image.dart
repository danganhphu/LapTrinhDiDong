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
      drawer: Drawer(

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
            // Container(
            //   height: 300,
            //   width: 300,
            //   child: Image.network("https://anh360.com/wp-content/uploads/2018/07/cach-de-chup-duoc-anh-dep-chi-bang-mot-chiec-may-anh-cu-05-440x295.jpg"),
            // ),
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