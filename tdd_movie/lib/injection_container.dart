import 'package:get_it/get_it.dart';
import 'package:tdd_movie/data/datasources/movie_remote_data_source.dart';
import 'package:tdd_movie/data/datasources/remote/movie_remote_data_source_impl.dart';
import 'package:tdd_movie/data/repositories/movie_repository_impl.dart';
import 'package:tdd_movie/domain/repositories/movie_repository.dart';
import 'package:tdd_movie/domain/usecases/get_popular_movies.dart';
import 'package:tdd_movie/domain/usecases/get_trending_movies.dart';
import 'package:tdd_movie/domain/usecases/search_movies.dart';
import 'package:tdd_movie/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:tdd_movie/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'package:tdd_movie/presentation/bloc/trending_movies/trending_movies_bloc.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

void init() {
  // Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(getIt()));

  // Use case
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));

  // Data source
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: getIt()));

  // Http servies
  getIt.registerLazySingleton(() => http.Client());
}
