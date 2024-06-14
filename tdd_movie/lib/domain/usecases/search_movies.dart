import 'package:dartz/dartz.dart';
import 'package:tdd_movie/core/errors/server_failure.dart';
import 'package:tdd_movie/domain/entities/movie.dart';
import 'package:tdd_movie/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository movieRepository;

  const SearchMovies(this.movieRepository);

  Future<Either<ServerFailure, List<Movie>>> call(String query) async {
    return await movieRepository.searchMovies(query);
  }
}
