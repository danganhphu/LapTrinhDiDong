import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselDemo extends StatefulWidget {
  const CarouselDemo({Key? key}) : super(key: key);

  final String title = "Bài Tập CarouselSlider";

  @override
  State<CarouselDemo> createState() => _CarouselDemoState();
}

class _CarouselDemoState extends State<CarouselDemo> {
  final controller = CarouselController();

  int _current = 0;
  final imgLists = [
    'asset/img/carousels/crip.jpg',
    'asset/img/carousels/clock420.jpg',
    'asset/img/carousels/dc420_2.jpg',
    'asset/img/carousels/freedom420.jpg',
    'asset/img/carousels/dc420.jpg',
    'asset/img/carousels/go420.jpg'
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildImgSlider(),
            const SizedBox(height: 32),
            buildIndicator(),
            const SizedBox(height: 32),
            buildButton()
          ],
        ),
      ),
    );
  }

  Widget buildImg(String imgList, index) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 24),
    color: Colors.green,
    width:double.infinity,
    child: Image.asset(
      imgList,
      fit: BoxFit.cover,
    )
  );
  Widget buildImgSlider() => CarouselSlider.builder(
    carouselController: controller,
    options: CarouselOptions(
      height: 400.0,
      initialPage: 0,
      viewportFraction: 1,
      // autoPlay: true,
      enableInfiniteScroll: false,
      enlargeCenterPage: true,
      enlargeStrategy: CenterPageEnlargeStrategy.height,
      //reverse: true,
      autoPlayInterval: const Duration(seconds: 2),
        onPageChanged: (index, reason) =>
            setState(() => _current = index)
    ),
    itemCount: imgLists.length,
    itemBuilder: (context, index, realIndex) {
      final imgList = imgLists[index];

      return buildImg(imgList, index);
    },
  );

  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: _current,
    count: imgLists.length,
    onDotClicked: animateSlide,
    effect: const JumpingDotEffect(
      dotWidth: 20,
      dotHeight: 20,
      activeDotColor: Colors.pink,
      dotColor: Colors.black12,
    ),
  );

  Widget buildButton({bool check = false}) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 6.0),
              primary: Colors.teal
          ),
          child: const Icon(Icons.arrow_back, size:32),
          onPressed: goToPrevious,
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

  void animateSlide(int index) => controller.animateToPage(index);

  void goToPrevious() => controller.previousPage(duration: const Duration(milliseconds:300), curve: Curves.ease);

  void goToNext() => controller.nextPage(duration: const Duration(milliseconds:300), curve: Curves.ease);

}
