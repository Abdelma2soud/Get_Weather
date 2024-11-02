import 'package:weather_app/models/weather_model.dart';

class WeatherStates{}

class NoWeatherState extends WeatherStates{}

class WeatherloadedState extends WeatherStates{
  final WeatherModel weatherModel;
  WeatherloadedState({required this.weatherModel});
}

class WeatherFailureState extends WeatherStates{}