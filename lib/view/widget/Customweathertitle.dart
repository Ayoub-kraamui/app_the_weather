import 'package:flutter/material.dart';

class CustomWeatherTitle extends StatelessWidget {
  final String areaName;
  const CustomWeatherTitle({super.key, required this.areaName});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '📍 $areaName',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'صباح الخير',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
