import 'dart:convert';
import 'package:weatherapp/model/weather_data_current.dart';
import 'package:weatherapp/model/weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_data_daily.dart';
import 'package:weatherapp/model/weather_data_hourly.dart';
import 'package:weatherapp/utils/api_url.dart';

class FetchWeather {
  WeatherData? weatherData;

  Future<WeatherData> processData(lat, long) async {
    var response = await http.get(Uri.parse(apiURL(lat, long)));
    var jsonString = jsonDecode(response.body);
    weatherData = WeatherData(WeatherDataCurrent.fromJson(jsonString),
        WeatherDataHourly.fromJson(jsonString), WeatherDataDaily.fromJson(jsonString));
    return weatherData!;
  }
}
