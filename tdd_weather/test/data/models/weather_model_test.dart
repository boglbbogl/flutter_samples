import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd_weather/data/models/weather_model.dart';
import 'package:tdd_weather/domain/entities/weather.dart';

import '../../helpers/json_reader.dart';

void main() {
  const WeatherModel testWeatherModel = WeatherModel(
    cityName: "New York",
    main: "Clouds",
    description: "broken clouds",
    iconCode: "04d",
    temperature: 298.49,
    pressure: 1003,
    humidity: 50,
  );
  test("should be a subclass of weather entity", () async {
    expect(testWeatherModel, isA<WeatherEntity>());
  });

  test("should return a vaild model from json", () async {
    final Map<String, dynamic> jsonMap =
        json.decode(readJson("helpers/dummy_data/dummy_weather_response.json"));
    final result = WeatherModel.fromJson(jsonMap);
    expect(result, equals(testWeatherModel));
  });

  test("should return a json map contating proper data", () async {
    //
    final result = testWeatherModel.toJson();

    final excpectedJsonMap = {
      "weather": [
        {
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d",
        }
      ],
      "main": [
        {
          "temp": 298.49,
          "pressure": 1003,
          "humidity": 50,
        }
      ],
      "name": "New York",
    };
    expect(result, equals(excpectedJsonMap));
  });
}
