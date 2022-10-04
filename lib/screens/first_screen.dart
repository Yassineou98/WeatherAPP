import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:weatherapp/widgets/first_screen_widget.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            Container(
              height: size.height * 0.5,
              width: size.width,
              margin : const EdgeInsets.only( top : 200 , right:10, left :10),

              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: const LinearGradient(
                colors:[ Color.fromARGB(255, 2, 240, 248),
                         Color(0xff3fa2fa),
                    ],
                    begin: Alignment.bottomCenter ,
                    end: Alignment.topCenter,
                    stops: [0.05,0.55]
          ),
              ),
            ),
          ],
        ),
        SafeArea(
            child: Obx(() => globalController.checkLoading().isTrue
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Center(
                    child: ListView(scrollDirection: Axis.vertical,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                        const SizedBox(height: 20),
                        FirstScreenWidget(
                            weatherDataCurrent: globalController
                                .getWeatherData()
                                .getCurrentWeather()),
                      ])))),
      ],
    ));
  }
}
