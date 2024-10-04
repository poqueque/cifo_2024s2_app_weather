import 'package:app_weather/services/weather_service.dart';
import 'package:app_weather/widgets/forecast_widget.dart';
import 'package:flutter/material.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherService = WeatherService();
    var future = weatherService.fetchWeatherData();

    return Scaffold(
        appBar: AppBar(
          title: const Text("Weather App"),
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(
                child: Text(
                  "Error obtenint dades",
                  style: TextStyle(color: Colors.red),
                ),
              );
            } else {
              return ListView(
                children: [
                  for (var data in snapshot.data!.dataseries)
                    ForecastWidget(
                      dataSerie: data,
                      initDateTime: snapshot.data!.initDateTime,
                    ),
                ],
              );
            }
          },
        ));
  }
}
