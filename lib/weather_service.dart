import 'dart:convert';
import 'package:http/http.dart' as http;

class WeatherService {
  final String apiKey = "f6e48b55f8cc13ace7e25bd53f696cd2";

  // Método para obtener el clima por ciudad
  Future<Map<String, dynamic>> fetchWeatherByCity(String city) async {
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric";

    return await _fetchWeather(url);
  }

  // Método para obtener el clima por coordenadas (latitud y longitud)
  Future<Map<String, dynamic>> fetchWeatherByCoordinates(
      double lat, double lon) async {
    final String url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";

    return await _fetchWeather(url);
  }

  // Método privado para realizar la solicitud HTTP y manejar la respuesta
  Future<Map<String, dynamic>> _fetchWeather(String url) async {
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decodificar la respuesta JSON
        return json.decode(response.body);
      } else {
        // Manejar errores
        throw Exception("Error al obtener los datos: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
