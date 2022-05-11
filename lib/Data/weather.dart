import 'dart:convert';

import 'networking.dart';
const apiKey = "f96dba3b75e7751664320b04d829142b";

class WeatherData{

  getCityWeather(String cityName) async {
    var x = cityName.toUpperCase();
    Networking networking = Networking("https://api.openweathermap.org/data/2.5/weather?q=$x&appid=$apiKey&units=metric");
    var weather = await networking.getData();
    return weather;
  }
}
