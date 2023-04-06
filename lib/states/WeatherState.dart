import 'package:my_weather_app/models/Weather.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {} //Состояние, когда ничего не проиходит

class WeatherLoadInProgress extends WeatherState {} //Состояние, когда мы загружаем данные о погоде

//Состояние, когда данные загружены успешно:
class WeatherLoadSuccess extends WeatherState {
  final Weather weather;
  final List<Weather> hourlyWeather;

  const WeatherLoadSuccess(
    {required this.weather, required this.hourlyWeather});

  @override
  List<Object> get props => [weather];
}

class WeatherLoadFailure extends WeatherState {} //Состояние, когда произошла какая-то ошибка