import 'package:flutter/material.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:weatherapp/model/weather_data_hourly.dart';
import 'package:weatherapp/widgets/current_weather_widget.dart';
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
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
              child: ListView(
                  scrollDirection: Axis.vertical,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const SizedBox(height: 20),
                    const HeaderWidget(),
                    CurrentWeatherWidget(
                      weatherDataCurrent: globalController.getwWeatherData().getCurrentWeather(),
                    ),

                     HourlyWeatherWidget(
                      weatherDataHourly: globalController.getwWeatherData().getHourlyWeather(),
                    ),
                  ],
                ),
            )),
      ),
    );
  }
}
