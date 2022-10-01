import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weatherapp/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = "";

  String date = DateFormat.yMMMMd('en_US').format(DateTime.now());

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getAddress(globalController.getLattitude().value,
        globalController.getLongitude().value);

    // TODO: implement initState
    super.initState();
  }

  getAddress(latitude, longitude) async {
    List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];
    setState(() {
      city = place.administrativeArea!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(right: 20, left: 20),
            alignment: Alignment.topLeft,
            child: Text(city,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 35,
                  color: Colors.grey[700],
                  height: 2,
                ))),
        Container(
            margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
            alignment: Alignment.topLeft,
            child: Text(date,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                  height: 1.5,
                )))
      ],
    );
  }
}
