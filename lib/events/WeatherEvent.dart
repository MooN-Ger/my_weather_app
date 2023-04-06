import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

//Событие для того, чтобы BLoC понимал что необходимо запрашивать данные о погоде по названию города:
class WeatherRequested extends WeatherEvent {
  final String city;
  final String lat;
  final String lon;

  const WeatherRequested({this.city = "", this.lat = "", this.lon = ""});

  @override
  List<Object> get props => [city];
}