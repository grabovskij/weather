import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather/configuration/theme/extensions/context_theme_extensions.dart';
import 'package:weather/domain/enums/weather_type.dart';
import 'package:weather/domain/models/weather_response.dart';

class HomeLoadedView extends StatelessWidget {
  final WeatherResponse response;

  const HomeLoadedView({
    required this.response,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: WeatherTodayWidget(
              color1: context.colors.primary,
              color2: context.colors.secondary,
              cityName: response.city.name,
              weatherName: response.list.first.weather.first.description,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 44,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: response.list.length,
                            itemBuilder: (context, index) {
                              final weatherData = response.list[index];
                              final dateTime = weatherData.dateTime;
                              final time = '${dateTime.hour}:${dateTime.minute}:${dateTime.second}';

                              return A(
                                degreesCelsius: (weatherData.main.temp - 273).toInt(),
                                weatherType: WeatherType.rain,
                                time: time,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WeatherTodayWidget extends StatelessWidget {
  final String cityName;
  final String weatherName;
  final Color color1;
  final Color color2;

  const WeatherTodayWidget({
    required this.cityName,
    required this.weatherName,
    required this.color1,
    required this.color2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: color1,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 25,
          horizontal: 40,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Text(
                'Today',
                style: TextStyle(
                  color: color2,
                  fontSize: 24,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Icon(
                      Icons.cloud,
                      color: color2,
                      size: 95,
                    ),
                  ),
                  Text(
                    '25°',
                    style: TextStyle(
                      color: color2,
                      fontSize: 100,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              weatherName,
              style: TextStyle(
                color: color2,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                cityName,
                style: TextStyle(
                  color: color2,
                  fontSize: 15,
                ),
              ),
            ),
            Text(
              '21 Oct 2019',
              style: TextStyle(
                color: color2,
                fontSize: 15,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Feels like 28',
                    style: TextStyle(
                      color: color2,
                      fontSize: 15,
                    ),
                  ),
                  VerticalDivider(
                    color: color2,
                    width: 20,
                    thickness: 1,
                  ),
                  Text(
                    'Sunset 18:20',
                    style: TextStyle(
                      color: color2,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class A extends StatelessWidget {
  final String time;
  final int degreesCelsius;
  final WeatherType weatherType;

  const A({
    required this.degreesCelsius,
    required this.weatherType,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(time),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.cloud),
              Text('$degreesCelsius'),
            ],
          ),
        ],
      ),
    );
  }
}
