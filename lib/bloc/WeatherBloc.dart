import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_weather_app/services/WeatherService.dart';
import '../events/WeatherEvent.dart';
import '../models/Weather.dart';
import '../states/WeatherState.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  final String cityName;

    WeatherBloc(this.cityName) : super(WeatherInitial()) {
      add(WeatherRequested(city: cityName));
    }

    //метод для обработки событий в «блоке»:
  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather = await WeatherService.fetchCurrentWeather(query: event.city);
        final List<Weather> hourlyWeather = await WeatherService.fetchHourlyWeather(query: event.city);
        yield WeatherLoadSuccess(weather: weather, hourlyWeather: hourlyWeather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}