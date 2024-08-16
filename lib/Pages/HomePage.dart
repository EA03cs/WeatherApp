import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Pages/SearchPage.dart';
import 'package:weather_app/Cubits/weatherCubit.dart';
import 'package:weather_app/Cubits/weatherStates.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return SearchPage();
              }));
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: BlocBuilder<weatherCubit, weatherStates>(
        builder: (context, state) {
          if (state is weatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is weatherSuccessState) {
            final weatherData = BlocProvider.of<weatherCubit>(context).weatherData;
            if (weatherData == null) {
              return const Center(
                child: Text(
                  'Weather data is not available',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              );
            }
            return Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    weatherData.getThemeColor(),
                    weatherData.getThemeColor(),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    BlocProvider.of<weatherCubit>(context).cityName ?? 'Unknown city',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Updated: ${weatherData.date}',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData.getImage()),
                      Text(
                        '${weatherData.temp.toInt()}°C',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text(
                            'Max: ${weatherData.maxTemp.toInt()}°C',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Min: ${weatherData.minTemp.toInt()}°C',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    weatherData.weatherStateName,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          } else if (state is weatherErrorState) {
            return const Center(
              child: Text(
                'Something went wrong, try again',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            );
          } else {
            return const Center(
              child: Text(
                'There\'s no weather, start searching now',
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            );
          }
        },
      ),
    );
  }
}
