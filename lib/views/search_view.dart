import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search City', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        elevation: 20,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: TextFormField(
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 28),
              // border: OutlineInputBorder(
              //   borderSide: BorderSide(width: 2.5, color: Colors.blue),
              // ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3.0, color: Colors.blueAccent),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2.5, color: Colors.blueAccent),
              ),
              hintText: 'Enter City Name',
              labelText: 'search',
              labelStyle: TextStyle(color: Colors.blueAccent, fontSize: 22),
              suffixIcon: Icon(Icons.search),
            ),
            onFieldSubmitted: (value) {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              if (value.isEmpty) {
                BlocProvider.of<GetWeatherCubit>(context).weathermodel = null;
              }
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
