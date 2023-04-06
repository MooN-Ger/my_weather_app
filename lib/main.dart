import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_weather_app/components/MainScreenWrapper.dart';
import 'package:my_weather_app/events/WeatherEvent.dart';
import 'package:my_weather_app/states/WeatherState.dart';
import 'bloc/WeatherBloc.dart';
import 'delegates/SearchDelegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorDark: Colors.white,
        primaryColor: Colors.white,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => WeatherBloc('Berlin'),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadSuccess) {
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: const Color.fromRGBO(0, 0, 0, 0),
                actions: [
                  IconButton(
                      onPressed: () {
                        showSearch(
                            context: context, delegate: MySearchDelegate((query) {
                              BlocProvider.of<WeatherBloc>(context).add(WeatherRequested(city: query));
                        })
                        );
                      },
                      icon: const Icon(Icons.search),
                  ),
                ],
              ),
              body: Padding(
                padding: const EdgeInsets.only(top: 64),
                child: MainScreenWrapper(
                  weather: state.weather, hourlyWeather: state.hourlyWeather
                ),
              ),
            );
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      ),
    );
  }
}
