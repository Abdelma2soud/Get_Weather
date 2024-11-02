import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/weather_no_info_body.dart';
import '../widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchView()));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ))
        ],
        // backgroundColor: Colors.blueAccent,
        elevation: 20,
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherStates>(
          builder: (context, state) {
        if (state is NoWeatherState) {
          return const NoWeatherBody();
        } else if (state is WeatherloadedState) {
          return WeatherInfoBody(
              weatherModelVariable:
                  BlocProvider.of<GetWeatherCubit>(context).weathermodel!);
        } else {
          return const Text('opps! there was an error');
        }
      }),
    );
  }
}
