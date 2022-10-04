import 'package:flutter/material.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp/widgets/current_weather_widget.dart';
import 'package:weatherapp/widgets/daily_weather_widget.dart';
import 'package:weatherapp/widgets/header_widget.dart';
import 'package:weatherapp/widgets/hourly_weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Container(
              height: size.height * 0.5,
              width: size.width,

              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                colors:[ Color.fromARGB(255, 2, 240, 248),
                         Color(0xff3fa2fa),
                    ],
                    begin: Alignment.bottomCenter ,
                    end: Alignment.topCenter,
                    stops: [0.05,0.55]
          ),
              ),
       child: Column(
                  children: [

                    const SizedBox(height: 20),
                    const HeaderWidget(),
                    CurrentWeatherWidget(
                      weatherDataCurrent: globalController
                          .getWeatherData()
                          .getCurrentWeather(),
            ),
                    ]  )),
                    HourlyWeatherWidget(
                      weatherDataHourly:
                          globalController.getWeatherData().getHourlyWeather(),
                    ),
                    DailyWeatherWidget(
                        weatherDataDaily: globalController
                            .getWeatherData()
                            .getDailyWeather()),
                 ],
                ),
              )),
      ),
    );
  }
}
