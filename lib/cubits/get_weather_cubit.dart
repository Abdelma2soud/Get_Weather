import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherStates> {
  WeatherModel? weathermodel;
  GetWeatherCubit(
    super.NoWeatherState,
  );
  getWeather({required String cityName}) async {
    try {
      weathermodel =
          await WeatherService(Dio()).getCurrentWeather(city: cityName);
      print('in get weather function');
      emit(WeatherloadedState(weatherModel: weathermodel!));
    } catch (e) {
      print(
          '********************************************************************************');
      print('error with GetWeather function:${e.toString()}');
      emit(WeatherFailureState());
    }
  }

  MaterialColor getThemeColor() {
    print(weathermodel?.weatherState);
    if (weathermodel?.weatherState == null) {
      return Colors.blue;
    }
    switch (weathermodel?.weatherState) {
      case "Sunny":
      case "Patchy light rain":
      case "Light rain":
      case "Light rain shower":
      case "Light drizzle":
        return Colors.orange;

      case "Partly Cloudy":
      case "Cloudy":
      case "Overcast":
      case "Mist":
      case "Fog":
      case "Freezing fog":
        return Colors.blueGrey;

      case "Patchy rain possible":
      case "Moderate rain":
      case "Heavy rain":
      case "Heavy rain at times":
      case "Torrential rain shower":
      case "Moderate or heavy rain with thunder":
      case "Patchy light rain with thunder":
        return Colors.teal;

      case "Patchy snow possible":
      case "Light snow":
      case "Patchy light snow":
      case "Light snow showers":
      case "Moderate snow":
      case "Heavy snow":
      case "Blizzard":
      case "Patchy heavy snow":
      case "Patchy moderate snow":
      case "Moderate or heavy snow with thunder":
      case "Patchy light snow with thunder":
        return Colors.cyan;

      case "Patchy sleet possible":
      case "Light sleet":
      case "Moderate or heavy sleet":
      case "Light sleet showers":
      case "Moderate or heavy sleet showers":
      case "Light freezing rain":
      case "Moderate or heavy freezing rain":
      case "Freezing drizzle":
      case "Heavy freezing drizzle":
      case "Patchy freezing drizzle possible":
        return Colors.indigo;
      case "Thundery outbreaks possible":
      case "Ice pellets":
      case "Light showers of ice pellets":
      case "Moderate or heavy showers of ice pellets":
        return Colors.grey;

      default:
        return Colors.blue;
    }
  }
}
