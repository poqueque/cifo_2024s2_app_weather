import 'package:app_weather/models/meteo.dart';
import 'package:app_weather/services/weather_service.dart';
import 'package:app_weather/widgets/forecast_widget.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  WeatherService weatherService = WeatherService();
  Meteo? meteo;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    meteo = await weatherService.fetchWeatherData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: (meteo == null)
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                for (var data in meteo!.dataseries)
                  ForecastWidget(dataSerie: data, initDateTime: meteo!.initDateTime,),
              ],
            ),
    );
  }
}
