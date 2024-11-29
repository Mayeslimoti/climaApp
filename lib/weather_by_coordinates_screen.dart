import 'package:flutter/material.dart';

class WeatherByCoordinatesScreen extends StatelessWidget {
  final Function(double, double) onGetWeather;
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();

  WeatherByCoordinatesScreen({required this.onGetWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar por Coordenadas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: latController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Latitud'),
            ),
            TextField(
              controller: lonController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Longitud'),
            ),
            ElevatedButton(
              onPressed: () {
                double lat = double.tryParse(latController.text) ?? 0.0;
                double lon = double.tryParse(lonController.text) ?? 0.0;
                onGetWeather(lat, lon);
                Navigator.pop(context);
              },
              child: Text('Obtener Clima'),
            ),
          ],
        ),
      ),
    );
  }
}
