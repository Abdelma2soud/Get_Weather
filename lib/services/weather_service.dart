import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'c11a43857a484149b57221609240108';

  WeatherService(this.dio);

  Future <WeatherModel> getCurrentWeather({required String city}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1&aqi=yes&alerts=no');
      WeatherModel weatherModel =WeatherModel.fromjson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage=e.response?.data['error']['message']?? 'there was an error while calling the API';
      throw Exception(errMessage);
    }
    catch (e)
    {
      log(e.toString());
      throw Exception('error after DioException');
    }
  }


  // Future <WeatherModel?> getForecastWeather({required String city}) async {
  //   try {
  //     Response response = await dio.get(
  //         '$baseUrl/forecast.json?key=$apiKey&q=$city&days=1');
  //     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  //     return weatherModel;
  //   } on Exception catch (e) {
  //     return null;
  //   }
  // }

}
