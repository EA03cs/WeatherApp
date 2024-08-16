import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weatherModels.dart';
import 'package:weather_app/Providers/weatherProvider.dart';
import 'package:weather_app/Services/weatherServices.dart';

import '../Cubits/weatherCubit.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search a City'),
          backgroundColor: Colors.orangeAccent,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
                onSubmitted: (data) async {
                  cityName = data;
                  BlocProvider.of<weatherCubit>(context).getWeather(
                      cityName: cityName!);
                  BlocProvider.of<weatherCubit>(context).cityName = cityName!;

                  Navigator.pop(context);
                },
                decoration: const InputDecoration(
                    label: Text('Search'),
                    suffix: Icon(Icons.search),
                border: OutlineInputBorder(),
                hintText: 'Enter a City'),
          ),
        )),);
  }
}