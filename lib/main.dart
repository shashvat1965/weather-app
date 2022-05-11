import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/Screens/weather_screen.dart';
import 'Screens/loading_screen.dart';

const apiKey = "f96dba3b75e7751664320b04d829142b";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Weather';
    return MaterialApp(
      theme: ThemeData.dark(),
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: LoadingScreen("Kanpur"),
      ),
    );
  }
}













