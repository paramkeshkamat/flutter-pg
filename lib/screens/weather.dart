import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:first/widgets/weather_main_card.dart';
import 'package:first/widgets/weather_forcast.dart';
import 'package:first/widgets/additional_info.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  Future fetchWeatherData() async {
    try {
      var response = await http.get(
        Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=Mumbai&appid=538ccefa66607c6591a1b1958fffda40",
        ),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            'Failed to load weather data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Weather App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: FutureBuilder(
          future: fetchWeatherData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.white70,
                ),
              );
            }

            if (snapshot.hasError) {
              return const Text("Something went wrong!");
            }

            final List listData = snapshot.data["list"];
            final double temperature = listData[0]["main"]["temp"];
            final String description = listData[0]["weather"][0]["main"];

            final int humidity = listData[0]["main"]["humidity"];
            final double windSpeed = listData[0]["wind"]["speed"];
            final int pressure = listData[0]["main"]["pressure"];

            return Column(
              children: [
                WeatherMainCard(
                  temperature: temperature - 273.15,
                  description: description,
                ),
                const SizedBox(height: 20),
                WeatherForecast(
                  forecastData: listData.sublist(0, 5),
                ),
                const SizedBox(height: 20),
                AdditionalInfo(
                  humidity: humidity,
                  windSpeed: windSpeed,
                  pressure: pressure,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
