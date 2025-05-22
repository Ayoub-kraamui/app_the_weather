import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomWeatherCondition extends StatelessWidget {
  final int temperature;
  final String weatherMain;
  final DateTime date;
  const CustomWeatherCondition({
    super.key,
    required this.temperature,
    required this.weatherMain,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            '$temperature °C',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 55,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Center(
          child: Text(
            weatherMain,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Center(
          child: Text(
            DateFormat('EEEE dd •').add_jm().format(date),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
