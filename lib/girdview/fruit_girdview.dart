import 'package:flutter/material.dart';
import 'fruit_model.dart';

class MyFruit extends StatelessWidget{
  const MyFruit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giải cứu nông sản"),
        centerTitle: true,
      ),
      body: GridView.extent(
          padding: const EdgeInsets.only(top: 5, bottom: 5, left: 5, right:5),
          maxCrossAxisExtent: 250,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          childAspectRatio: 0.8,
          children: listSP.map((sp) => Card(
            elevation: 1,
            shadowColor: Colors.blue,
            child: Column(
              children: [
                Image.network(sp.url),
                Text(
                    "${sp.ten}",
                    style: const TextStyle(color: Colors.black, fontSize: 14)
                ),
                Text("Giá: ${sp.gia}/kg",
                  style: const TextStyle(color: Colors.red, fontSize: 15)),
              ],
            ),
          )).toList()
      ),

    );
  }
}
