import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGird extends StatefulWidget {
  const MyGird({Key? key}) : super(key: key);
  final String title = "test girdview";
  @override
  State<MyGird> createState() => _MyGirdState();
}

class _MyGirdState extends State<MyGird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: GridView.extent(
        maxCrossAxisExtent:150,
        padding: EdgeInsets.all(5),
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        children: List.generate(100,
                (index) => Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue)
              ),
              child: Center(
                child: Text("${index+1}", style:TextStyle(fontSize: 20),),
              ),
            )
        ),
      ),
    );
  }
}
