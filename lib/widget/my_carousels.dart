import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselDemo extends StatefulWidget {
  const CarouselDemo({Key? key}) : super(key: key);

  final String title = "Bài Tập CarouselSlider";

  @override
  State<CarouselDemo> createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  final controller = CarouselController();

  int _current = 0;
  final imgLists = [
    'https://mcdn.wallpapersafari.com/medium/19/25/fITi1Q.jpg',
    'https://cdn.hipwallpaper.com/i/65/98/tm7YWx.jpg',
    'https://cdn.vectorstock.com/i/1000x1000/00/57/marijuana-leaf-symbol-420-hemp-text-vector-8180057.webp',
    'https://cdn.vectorstock.com/i/1000x1000/99/03/marijuana-leaf-symbol-and-420-hemp-text-vector-8179903.webp',
    'https://cdn.vectorstock.com/i/1000x1000/52/71/freedom-club-print-vector-23985271.webp',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/273229899_1004082827154776_1728217101764613993_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=UKKqKzaWeYoAX_ZgWdN&_nc_ht=scontent.fdad2-1.fna&oh=03_AVIAwAHhkTr0fUCIMaRaSZaDmcjvFmror0_58Rrjl0Vhgg&oe=6260F1D0',
    'https://scontent.fdad2-1.fna.fbcdn.net/v/t1.15752-9/234864394_415903813195028_1467182234323868529_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=ae9488&_nc_ohc=5ecGnQ7ssr8AX-n4Jp9&tn=c8oHxNWYAu9GJXzu&_nc_ht=scontent.fdad2-1.fna&oh=03_AVL5Sre2nz3aLbdD5_U69MODLbCREcYD18k1ZCSkysSATg&oe=626273E8'
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
    child: Image.network(
      imgList,
      fit: BoxFit.cover,
    )
  );
  Widget buildImgSlider() => CarouselSlider.builder(
    carouselController: controller,
    options: CarouselOptions(
      height: 400.0,
      initialPage: 0,
      // viewportFraction: 1,
      // autoPlay: true,
      enableInfiniteScroll: false,
      enlargeCenterPage: true,
      enlargeStrategy: CenterPageEnlargeStrategy.height,
      //reverse: true
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
