import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final int humidity;
  final double windSpeed;
  final int pressure;

  const AdditionalInfo({
    super.key,
    required this.humidity,
    required this.windSpeed,
    required this.pressure,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Additional Information",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AdditionalInfoCard(
              icon: Icons.water_drop,
              title: "Humidity",
              value: humidity,
            ),
            AdditionalInfoCard(
              icon: Icons.air,
              title: "Wind Speed",
              value: windSpeed,
            ),
            AdditionalInfoCard(
              icon: Icons.beach_access,
              title: "Pressure",
              value: pressure,
            ),
          ],
        )
      ],
    );
  }
}

class AdditionalInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final num value;

  const AdditionalInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 48,
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
