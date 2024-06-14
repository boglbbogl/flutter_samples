import 'package:dartz/dartz.dart';
import 'package:tdd_movie/core/errors/server_failure.dart';
import 'package:tdd_movie/domain/entities/movie.dart';

abstract class MovieRepository {
  Future<Either<ServerFailure, List<Movie>>> getTrendingMovies();
  Future<Either<ServerFailure, List<Movie>>> searchMovies(String query);
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies();
}
