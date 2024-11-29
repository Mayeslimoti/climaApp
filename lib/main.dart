import 'package:flutter/material.dart';
import 'weather_by_city_screen.dart';
import 'weather_by_coordinates_screen.dart';
import 'weather_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClimaApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _weatherInfo = '';
  WeatherService _weatherService = WeatherService();

  void _getWeatherByCity(String city) async {
    try {
      var weather = await _weatherService.fetchWeatherByCity(city);
      setState(() {
        _weatherInfo = "Temperatura: ${weather['main']['temp']}°C\n"
            "Clima: ${weather['weather'][0]['description']}";
      });
    } catch (e) {
      setState(() {
        _weatherInfo = "Error: $e";
      });
    }
  }

  void _getWeatherByCoordinates(double lat, double lon) async {
    try {
      var weather = await _weatherService.fetchWeatherByCoordinates(lat, lon);
      setState(() {
        _weatherInfo = "Temperatura: ${weather['main']['temp']}°C\n"
            "Clima: ${weather['weather'][0]['description']}";
      });
    } catch (e) {
      setState(() {
        _weatherInfo = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta del Clima"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherByCityScreen(
                      onGetWeather: _getWeatherByCity,
                    ),
                  ),
                );
              },
              child: Text("Consultar por Ciudad"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WeatherByCoordinatesScreen(
                      onGetWeather: _getWeatherByCoordinates,
                    ),
                  ),
                );
              },
              child: Text("Consultar por Coordenadas"),
            ),
            SizedBox(height: 20),
            if (_weatherInfo.isNotEmpty)
              Container(
                color: Colors.yellow,
                padding: EdgeInsets.all(16.0),
                child: Text(
                  _weatherInfo,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
