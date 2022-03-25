import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  final String title = "Bài Tập CarouselSlider";
  @override
  // State<MyHomePage> createState() => _MyHomePageState();
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final controller = CarouselController();

  List <String> imagelist = [
    'asset/img/carousels/crip.jpg',
    'asset/img/carousels/clock420.jpg',
    'asset/img/carousels/dc420_2.jpg',
    'asset/img/carousels/freedom420.jpg',
    'asset/img/carousels/dc420.jpg',
    'asset/img/carousels/go420.jpg'
  ];
  int current = 0;
  void goToPrevious(){
    setState(() {
      current--;
      if(current < 0) {
        current = imagelist.length - 1;
      }
    });
  }

  void goToNext()
  {
    setState(() {
      current++;
      if (current >= imagelist.length) {
        current = 0;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(imagelist[current]),
              const Padding(
                padding: EdgeInsets.all(15.0),
              ),
              buildButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildButton({bool check = false}) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6.0),
            primary: Colors.teal
        ),
        child: const Icon(Icons.arrow_back, size:32),
        onPressed: goToPrevious
      ),
      check ? const Spacer() : const SizedBox(width: 30),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6.0),
              primary: Colors.teal
          ),
          child: const Icon(Icons.arrow_forward, size:32),
          onPressed: goToNext
      ),
    ],
  );
}