import 'dart:convert';
import 'package:my_weather_app/models/Weather.dart';
import 'package:http/http.dart' as http;

class WeatherService {
  static const String _apiKey = "76d188057f427084920b42ab46ac5fe2";

  //метод получения текущей погоды:
  static Future<Weather> fetchCurrentWeather({query, String lat = "", String lon = ""}) async {
    var url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$_apiKey';
    final response = await http.post(url as Uri);

    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  //Метод получения погоды по часам:
  static Future<List<Weather>> fetchHourlyWeather({query, String lat = "", String lon = ""}) async {
    var url = 'https://pro.openweathermap.org/data/2.5/forecast/hourly?lat=$lat&lon=$lon&appid=$_apiKey';
    final response = await http.post(url as Uri);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Weather> data = (jsonData['list'] as List<dynamic>)
          .map((item) {
            return Weather.fromJson(item);
      }).toList();
      return data;
    } else {
      throw Exception('Failed to load weather');
    }
  }
}