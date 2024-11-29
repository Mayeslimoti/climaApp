import 'package:flutter/material.dart';

class WeatherByCityScreen extends StatelessWidget {
  final Function(String) onGetWeather;
  final TextEditingController cityController = TextEditingController();

  WeatherByCityScreen({required this.onGetWeather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar por Ciudad'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'Nombre de la Ciudad'),
            ),
            ElevatedButton(
              onPressed: () {
                onGetWeather(cityController.text);
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
