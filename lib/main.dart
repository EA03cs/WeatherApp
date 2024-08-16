import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Cubits/weatherCubit.dart';
import 'package:weather_app/Pages/HomePage.dart';
import 'package:weather_app/Providers/weatherProvider.dart';

import 'Services/weatherServices.dart';

void main() {
  runApp(BlocProvider(
      create: (context) {
        return weatherCubit(weatherServices());
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Provider.of<weatherProvider>(context).weatherData == null
      //       ? Colors.blue
      //       : Provider.of<weatherProvider>(context)
      //           .weatherData!
      //           .getThemeColor(),
      // ),
      home: HomePage(),
    );
  }
}
