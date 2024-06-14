import 'package:dartz/dartz.dart';
import 'package:tdd_movie/core/errors/server_failure.dart';
import 'package:tdd_movie/domain/entities/movie.dart';
import 'package:tdd_movie/domain/repositories/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository movieRepository;

  const GetPopularMovies(this.movieRepository);

  Future<Either<ServerFailure, List<Movie>>> call() async {
    return movieRepository.getPopularMovies();
  }
}
