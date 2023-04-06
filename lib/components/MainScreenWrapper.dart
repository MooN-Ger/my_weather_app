import 'package:flutter/cupertino.dart';
import 'package:my_weather_app/components/WeatherHours.dart';
import '../models/Weather.dart';
import 'WeatherCard.dart';

class MainScreenWrapper extends StatelessWidget {
  final Weather weather;
  final List<Weather> hourlyWeather;

  const MainScreenWrapper({Key? key, required this.weather, required this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            weather.cityName,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            )
          ),
          Text(
            '${weather.description}'
          ),
          const Spacer(),
          WeatherCard(
            title: "Now",
            temperature: weather.temperature,
            iconCode: weather.iconCode,
            temperatureFontSize: 64,
            iconScale: 1,
          ),
          const Spacer(),
          HourlyWeather(hourlyWeather: hourlyWeather)
        ],
      ),
    );
  }
}