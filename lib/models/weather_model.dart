// class WeatherModel {
//   final String cityName;
//   final String date;
//   final String img;
//   final String temp;
//   final String minTemp;
//   final String maxTemp;
//   final String text;
//
//   WeatherModel({
//     required this.cityName,
//     required this.date,
//     required this.img,
//     required this.temp,
//     required this.minTemp,
//     required this.maxTemp,
//     required this.text
//   });
//   factory WeatherModel.fromJson(json){
//     return WeatherModel(
//       cityName:json['location']['name'] ,
//       date:json['current']['last_updated'] ,
//       img:json['forecast']['forecastday'][0]['condition']['icon'] ,
//       temp:json['forecast']['forecastday'][0] ['avgtemp_c'],
//       maxTemp:json['forecast']['forecastday'][0] ['maxtemp_c'] ,
//       minTemp: json['forecast']['forecastday'][0] ['mintemp_c'],
//       text: json['forecast']['forecastday'][0] ['text'],
//     );
//   }
// }

class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String img;
  final String weatherState;
  WeatherModel(
      {required this.date,
      required this.temp,
      required this.maxtemp,
      required this.mintemp,
      required this.img,
      required this.weatherState,
      required this.cityName});
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
      date: DateTime.parse(json["current"]["last_updated"]),
      temp: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
      maxtemp: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintemp: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      weatherState: json["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      cityName: json["location"]["name"],
      img: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
    );
  }
}
