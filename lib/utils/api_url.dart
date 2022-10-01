import 'package:weatherapp/api/api_key.dart';

String apiURL(var lat , var long){
  String url;
  url = "https://api.openweathermap.org/data/3.0/onecall?lat=$lat&appid=$apiKey&lon=$long&exclude=minutely&units=metric";
  return url;
}