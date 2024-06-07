import 'package:dartz/dartz.dart';
import 'package:tdd_weather/core/error/failure.dart';
import 'package:tdd_weather/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(String cityName);
}
