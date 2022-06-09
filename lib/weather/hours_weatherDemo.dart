import 'package:flutter/material.dart';
import 'data-weather.dart';

class HoursWeatherDemo extends StatefulWidget {
  const  HoursWeatherDemo({Key? key}) : super(key: key);
  final String title = "HoursWeatherDemo";

  @override
  _HoursWeatherDemoState createState() => _HoursWeatherDemoState();
}

class _HoursWeatherDemoState extends State<HoursWeatherDemo> {
  static const kBackgroundGradient = DecorationImage(
    image: AssetImage('asset/weather/gradient1.png'),
    fit: BoxFit.fill,
  );
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
          itemCount: listThoiTiet.length,
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
                      '${listThoiTiet[index].nhietDo.toString()}°C',
                      style: TextStyle(
                        color: index == 0 ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Image.asset(
                      listThoiTiet[index].anh,
                      width: 80,
                    ),
                    Text(
                      '${listThoiTiet[index].gio.toString()}:00',
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
