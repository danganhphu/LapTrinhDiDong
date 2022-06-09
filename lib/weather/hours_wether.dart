import 'package:flutter/material.dart';

List <double> nhietDo = [20, 22, 27, 29.5, 20, 37, 35.4, 20, 22, 27, 29.5, 20, 37, 35.4, 20, 22, 27, 29.5, 20, 37, 35.4, 15,5, 18, 23,8];

class HoursWeather extends StatefulWidget {
  const  HoursWeather({Key? key}) : super(key: key);
  final String title = "HoursWeather";

  @override
  _HoursWeatherState createState() => _HoursWeatherState();
}

class _HoursWeatherState extends State<HoursWeather> {
  static const kBackgroundGradient = DecorationImage(
    image: AssetImage('asset/weather/gradient1.png'),
    fit: BoxFit.fill,
  );
  static const color1 = Color(0xFFB74093);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SizedBox(
        height: 190,
        child: ListView.builder(
          itemCount: 24,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(30)),
                  color: (index == 0) ? null: Colors.grey[300],
                  image: index == 0 ? kBackgroundGradient: null,
                ),
                margin:
                const EdgeInsets.only(right: 20, bottom: 10, top: 10),
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '${nhietDo[index].toString()}°C',
                      style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Image.asset(
                      'asset/weather/snow.png',
                      width: 80,
                    ),
                    Text(
                      '08:00',
                      style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
