import 'package:app_weather/models/meteo.dart';
import 'package:flutter/material.dart';

class ForecastWidget extends StatelessWidget {
  const ForecastWidget(
      {super.key, required this.dataSerie, required this.initDateTime});

  final DataSerie dataSerie;
  final DateTime initDateTime;

  @override
  Widget build(BuildContext context) {
    DateTime pointInTime =
        initDateTime.add(Duration(hours: dataSerie.timepoint));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text("Dia ${pointInTime.day}",
                style: const TextStyle(fontSize: 24)),
            Text(
                "${pointInTime.hour.toString().padLeft(2, "0")}:${pointInTime.minute.toString().padLeft(2, "0")}",
                style: const TextStyle(fontSize: 24)),
          ],
        ),
        Icon(
          dataSerie.icon,
          size: 32,
          color: Colors.deepPurple,
        ),
        Text(
          "${dataSerie.temp2M} ºC",
          style: const TextStyle(fontSize: 32),
        ),
      ],
    );
  }
}
