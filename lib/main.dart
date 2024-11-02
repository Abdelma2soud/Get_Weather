import 'package:flutter/material.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const CustomMaterialApp();
  }
}

class CustomMaterialApp extends StatelessWidget {
  const CustomMaterialApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(NoWeatherState()),
      child: BlocBuilder<GetWeatherCubit, WeatherStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // primarySwatch:Colors.lime,
              // colorScheme: ColorScheme.fromSwatch(primarySwatch:getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weathermodel?.WeatherState), ),
              appBarTheme: AppBarTheme(
                  color: BlocProvider.of<GetWeatherCubit>(context)
                      .getThemeColor()),
              // primarySwatch:BlocProvider.of<GetWeatherCubit>(context).getThemeColor()
              // primaryColor: getThemeColor(BlocProvider.of<GetWeatherCubit>(context).weathermodel?.WeatherState),
            ),
            home: const HomeView(),
          );
        },
      ),
    );
  }
}


// MaterialColor getThemeColor(String? condition) {
// }
  // if(condition==null)
  //   {
  //     return Colors.blue;
  //   }
//   if ([
//     "Sunny",
//     "Patchy light rain",
//     "Light rain",
//     "Light rain shower",
//     "Light drizzle"
//   ].contains(condition)) {
//     return Colors.orange;
//   } else if ([
//     "Partly cloudy",
//     "Cloudy",
//     "Overcast",
//     "Mist",
//     "Fog",
//     "Freezing fog"
//   ].contains(condition)) {
//     return Colors.blueGrey;
//   } else if ([
//     "Patchy rain possible",
//     "Moderate rain",
//     "Heavy rain",
//     "Heavy rain at times",
//     "Torrential rain shower",
//     "Moderate or heavy rain with thunder",
//     "Patchy light rain with thunder"
//   ].contains(condition)) {
//     return Colors.teal;
//   } else if ([
//     "Patchy snow possible",
//     "Light snow",
//     "Patchy light snow",
//     "Light snow showers",
//     "Moderate snow",
//     "Heavy snow",
//     "Blizzard",
//     "Patchy heavy snow",
//     "Patchy moderate snow",
//     "Moderate or heavy snow with thunder",
//     "Patchy light snow with thunder"
//   ].contains(condition)) {
//     return Colors.cyan;
//   } else if ([
//     "Patchy sleet possible",
//     "Light sleet",
//     "Moderate or heavy sleet",
//     "Light sleet showers",
//     "Moderate or heavy sleet showers",
//     "Light freezing rain",
//     "Moderate or heavy freezing rain",
//     "Freezing drizzle",
//     "Heavy freezing drizzle",
//     "Patchy freezing drizzle possible"
//   ].contains(condition)) {
//     return Colors.indigo;
//   } else if ([
//     "Thundery outbreaks possible",
//     "Ice pellets",
//     "Light showers of ice pellets",
//     "Moderate or heavy showers of ice pellets"
//   ].contains(condition)) {
//     return Colors.grey;
//   } else {
//     return Colors.blue;
//   }
// }