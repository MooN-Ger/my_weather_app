import 'package:flutter/cupertino.dart';
import 'package:my_weather_app/components/WeatherCard.dart';
import '../models/Weather.dart';

class HourlyWeather extends StatelessWidget {
  final List<Weather> hourlyWeather;

  const HourlyWeather({Key? key, required this.hourlyWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: hourlyWeather.length,
        itemBuilder: (context, i) {
          return WeatherCard(
            title:
              '${hourlyWeather[i].time.hour}:${hourlyWeather[i].time.minute}0',
            temperature: hourlyWeather[i].temperature.toInt(),
            iconCode: hourlyWeather[i].iconCode,
            temperatureFontSize: 20,
          );
        }
      )
    );
  }
}