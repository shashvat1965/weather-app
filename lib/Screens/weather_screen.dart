import 'package:flutter/material.dart';
import 'package:weather_app/Data/weather.dart';

const apiKey = "f96dba3b75e7751664320b04d829142b";

class WeatherScreen extends StatefulWidget {
  WeatherScreen({
    Key? key,
    required this.cityName,
    required this.temp,
  }) : super(key: key);
  String cityName;
  double temp;

  @override
  State<StatefulWidget> createState() {
    return WeatherScreenState();
  }
}

class WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String? newCityName;
    WeatherData weatherData = WeatherData();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    width: 500,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      onChanged: (text) {
                        newCityName = text;
                      },
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: "enter city name",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                  onPressed: () async {
                    if (newCityName != null) {
                      var temporary =
                          await weatherData.getCityWeather(newCityName!);
                      if (temporary.toString() == 404.toString()) {
                        var snackBar = const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("location not found"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                      if (newCityName == null || newCityName == "") {
                        var snackBar = const SnackBar(
                          duration: Duration(seconds: 2),
                          content: Text("Pls enter a location"),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      } else {
                        setState(() {
                          widget.cityName = newCityName!;
                          widget.temp = temporary["main"]["temp"];
                        });
                      }
                    }
                  },
                  child: const Text("enter"),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.cityName.toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 60,
                  color: Colors.tealAccent),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.temp.toInt().toString() + "°C",
              style: const TextStyle(fontSize: 40, color: Colors.pinkAccent),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
