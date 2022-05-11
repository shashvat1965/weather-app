import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/Data/networking.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Data/weather.dart';
import 'package:weather_app/Screens/weather_screen.dart';

const apiKey = "f96dba3b75e7751664320b04d829142b";

class LoadingScreen extends StatefulWidget {
  LoadingScreen(this.cityName);
  final String cityName;

  @override
  State<StatefulWidget> createState() {
    return loadingScreenState();
  }
}

class loadingScreenState extends State<LoadingScreen> {
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    var weatherData = await WeatherData().getCityWeather(widget.cityName);
    double temp = weatherData["main"]["temp"];
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen(cityName: widget.cityName, temp: temp,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading Please Wait",
            style: TextStyle(fontWeight: FontWeight.w900, color: Colors.red)),
      ),
    );
  }
}
