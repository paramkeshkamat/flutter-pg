import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WeatherForecast extends StatelessWidget {
  final List forecastData;

  const WeatherForecast({
    super.key,
    required this.forecastData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(
          //     children: forecastData.map((data) {
          //       return WeatherForecastCard(
          //         time: "09:00",
          //         icon: Icons.cloud,
          //         temperature: data["main"]["temp"] - 273.15,
          //       );
          //     }).toList(),
          //   ),
          // )
          SizedBox(
            height: 140,
            child: ListView.builder(
                itemCount: forecastData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return WeatherForecastCard(
                    time: forecastData[index]["dt_txt"],
                    icon: Icons.cloud,
                    temperature: forecastData[index]["main"]["temp"] - 273.15,
                  );
                }),
          )
        ],
      ),
    );
  }
}

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final double temperature;

  const WeatherForecastCard({
    super.key,
    required this.time,
    required this.icon,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Text(
                DateFormat().add_Hm().format(DateTime.parse(time)),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 12),
              Icon(icon, size: 32),
              const SizedBox(height: 12),
              Text(
                "${temperature.toStringAsFixed(2)}°C",
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
