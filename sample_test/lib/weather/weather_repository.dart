import 'dart:convert';

import 'package:sample_test/server_exception.dart';
import 'package:sample_test/weather/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String name);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  const WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String name) async {
    final response = await client.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=New York&appid=8879cf64d3a45f92840712e7edb75fc0"));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
