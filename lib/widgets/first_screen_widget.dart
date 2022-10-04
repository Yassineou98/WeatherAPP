import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/screens/home_screen.dart';

// ignore: must_be_immutable
class FirstScreenWidget extends StatelessWidget {
  final WeatherDataCurrent weatherDataCurrent;

  FirstScreenWidget({Key? key, required this.weatherDataCurrent})
      : super(key: key);

  String date = DateFormat.yMd().add_jm().format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Column(children: [
      
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          margin: const EdgeInsets.all(15),
          padding: const EdgeInsets.only(top: 270),
          child: Image.asset(
            "assets/weather/${weatherDataCurrent.current.weather![0].icon}.png",
          ),
        ),
        Container(
            padding: const EdgeInsets.only(top: 270),
            child: Text("${weatherDataCurrent.current.temp!}°C ",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 60,
                  color: Colors.black,
                ))),
      ]),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 14,
                color: Colors.white60,
                height: 1.5,
              ))
        ],
      ),
      const SizedBox(
        height: 30,
      ),
      Column(children: [
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.blue.withOpacity(0.04);
                }
                if (states.contains(MaterialState.focused) ||
                    states.contains(MaterialState.pressed)) {
                  return Colors.blue.withOpacity(0.12);
                }
                return null; // Defer to the widget's default.
              },
            ),
          ),
          onPressed: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.scale,
                    alignment: Alignment.bottomCenter,
                    child: const HomeScreen()));
          },
          child: const Text('Learn more...'),
        )
      ])
    ]);
  }
}
