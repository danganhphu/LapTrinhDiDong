// import 'package:flutter/material.dart';
//
// class HoursWeather extends StatefulWidget {
//   const  HoursWeather({Key? key}) : super(key: key);
//
//   @override
//   _HoursWeatherState createState() => _HoursWeatherState();
// }
//
// class _HoursWeatherState extends State<HoursWeather> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//         height: 190,
//         child: ListView.builder(
//         itemCount: 24,
//         scrollDirection: Axis.horizontal,
//         itemBuilder: (context, int index) {
//       var data = HoursWeatherData(
//           data: widget.detailedWeatherData['hourly'][index]);
//
//       return Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 8),
//         child: GestureDetector(
//           onTap: () {},
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius:
//               const BorderRadius.all(Radius.circular(30)),
//               //color: (index == 0) ? null : Colors.white,
//               color: (index == 0) ? null : Colors.grey[300],
//               image: index == 0 ? kBackgroundGradient : null,
//             ),
//             margin:
//             const EdgeInsets.only(right: 20, bottom: 10, top: 10),
//             width: 80,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 //'°C'
//                 Text(
//                   '${data.temp()}°C',
//                   style: TextStyle(
//                     color: index == 0 ? Colors.white : Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 // Image.asset(
//                 //   data.getWeatherIcon(),
//                 //   width: 50,
//                 // ),
//                 Image.network(
//                   data.getWeatherIconOfOpenWeather(),
//                   width: 80,
//                 ),
//                 Text(
//                   data.getHour() + ':00',
//                   style: TextStyle(
//                     color: index == 0 ? Colors.white : Colors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//     );
//   }
// }
