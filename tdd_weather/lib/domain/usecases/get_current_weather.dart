import 'package:dartz/dartz.dart';
import 'package:tdd_weather/core/error/failure.dart';
import 'package:tdd_weather/domain/entities/weather.dart';
import 'package:tdd_weather/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;

  const GetCurrentWeatherUseCase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(String cityName) async {
    return weatherRepository.getCurrentWeather(cityName);
  }
}
