import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  final String title = "Bài Tập CarouselSlider";
  @override
  // State<MyHomePage> createState() => _MyHomePageState();
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  List <String> imagelist = [
    'asset/img/carousels/crip.jpg',
    'asset/img/carousels/clock420.jpg',
    'asset/img/carousels/dc420_2.jpg',
    'asset/img/carousels/freedom420.jpg',
    'asset/img/carousels/dc420.jpg',
    'asset/img/carousels/go420.jpg'
  ];
  int current = 0;
  void leftpicture(){
    setState(() {
      current--;
      if(current < 0) {
        current = imagelist.length - 1;
      }
    });
  }

  void rightpicture()
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FloatingActionButton(onPressed: leftpicture,child: const Icon(Icons.arrow_left)),
                    FloatingActionButton(onPressed: rightpicture,child: const Icon(Icons.arrow_right),),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}