import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:tdd_weather/core/error/exception.dart';
import 'package:tdd_weather/core/error/failure.dart';
import 'package:tdd_weather/data/data_sources/remote_data_source.dart';
import 'package:tdd_weather/domain/entities/weather.dart';
import 'package:tdd_weather/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource weatherRemoteDataSource;

  const WeatherRepositoryImpl(this.weatherRemoteDataSource);
  @override
  Future<Either<Failure, WeatherEntity>> getCurrentWeather(
      String cityName) async {
    try {
      final result = await weatherRemoteDataSource.getCurrentWeather(cityName);
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure("An error has occured"));
    } on SocketException {
      return const Left(ServerFailure("Failed to connect to the network"));
    }
  }
}
