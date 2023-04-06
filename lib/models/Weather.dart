class Weather {
  String cityName;
  int temperature;
  String iconCode;
  String description;
  DateTime? time;

  Weather({
    this.cityName = '',
    this.temperature = 0,
    this.iconCode = '',
    this.description = '',
    this.time
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: double.parse(json['main']['temp'].toString()).toInt(),
      iconCode: json['weather'][0]['icon'],
      description: json['weather'][0]['main'],
      time: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000)
    );
  }
}