import 'package:dartz/dartz.dart';
import 'package:tdd_movie/core/errors/server_failure.dart';
import 'package:tdd_movie/data/datasources/movie_remote_data_source.dart';
import 'package:tdd_movie/data/models/movie_model.dart';
import 'package:tdd_movie/domain/entities/movie.dart';
import 'package:tdd_movie/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  const MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<ServerFailure, List<Movie>>> getPopularMovies() async {
    try {
      final List<MovieModel> movieModles =
          await remoteDataSource.getPopularMovies();
      final List<Movie> movies =
          movieModles.map((movie) => movie.toEntry()).toList();
      return Right(movies);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> getTrendingMovies() async {
    try {
      final List<MovieModel> movieModles =
          await remoteDataSource.getTrendingMovies();
      final List<Movie> movies =
          movieModles.map((movie) => movie.toEntry()).toList();
      return Right(movies);
    } catch (_) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<ServerFailure, List<Movie>>> searchMovies(String query) async {
    try {
      final List<MovieModel> movieModles =
          await remoteDataSource.searchMovies(query);
      final List<Movie> movies =
          movieModles.map((movie) => movie.toEntry()).toList();
      return Right(movies);
    } catch (_) {
      return Left(ServerFailure());
    }
  }
}
