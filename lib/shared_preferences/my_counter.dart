import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:danganhphu_61134177/shared_preferences/change_notifier.dart';

class MyCount extends StatelessWidget {
  const MyCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Demo"),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add_circle, size: 50,),
        onPressed: () {
          var provider = context.read<Counter>();
          provider.increasement();
        },
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Số lần mày bấm vào button"),
            FutureBuilder(
              future: provider.value,
              builder: (context, snapshot) {
                return
                  Text("${snapshot.data}", style: const TextStyle(fontSize: 20, color: Colors.pink));
              }

            ),
          ],
        ),
      ),
    );
  }
}