import 'package:flutter/material.dart';
class MyInput extends StatefulWidget {
  const MyInput({Key? key}) : super(key: key);

  @override
  State<MyInput> createState() => MyInputState();
}

class MyInputState extends State<MyInput> {
  TextEditingController txtNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Input Page"),
      ),
      body: Column(
        children: [
          const Text("Nhập tên:"),
          TextFormField(
            controller: txtNameController,
            decoration: const InputDecoration(
              labelText: "Tên",
              hintText: "Nhập tên vào đây:",
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //Button go back
              ElevatedButton(onPressed: () => Navigator.pop(context), child: Text("Go back")),
              const SizedBox(width: 15,),
              //Button input
              ElevatedButton(onPressed: () {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Chào bạn, ${txtNameController.text}"),
                  duration: const Duration(seconds: 5),
                ));
              }, child: const Text("Click me!")),
            ],
          ),
          const SizedBox(width: 10,),
        ],
      ),


    );
  }
}