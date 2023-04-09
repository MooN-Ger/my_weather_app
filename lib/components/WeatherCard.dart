import 'package:flutter/cupertino.dart';

class WeatherCard extends StatelessWidget {
  final String title;
  final int temperature;
  final String iconCode;
  final double temperatureFontSize;
  final double iconScale;

  const WeatherCard({Key? key, required this.title, required this.temperature, required this.iconCode, this.temperatureFontSize = 32, this.iconScale = 2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title),
              Image.network("https://www.culture.ru/s/samaya-krasivaya-strana/images/tild3563-3464-4937-b337-653933383961__---.jpg", scale: iconScale),
              Text(
                '$temperature°',
                style: TextStyle(
                  fontSize: temperatureFontSize, fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}