import 'dart:convert';
import 'package:tdd_weather/core/constants/constants.dart';
import 'package:tdd_weather/core/error/exception.dart';
import 'package:tdd_weather/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getCurrentWeather(String name);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final http.Client client;

  const WeatherRemoteDataSourceImpl({required this.client});

  @override
  Future<WeatherModel> getCurrentWeather(String name) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(name)));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
