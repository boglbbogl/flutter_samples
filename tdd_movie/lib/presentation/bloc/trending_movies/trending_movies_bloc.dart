import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_movie/domain/usecases/get_trending_movies.dart';
import 'package:tdd_movie/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:tdd_movie/presentation/bloc/trending_movies/trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendningMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;
  TrendingMoviesBloc(this.getTrendingMovies) : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>(_fetch);
  }
  Future<void> _fetch(
    FetchTrendingMovies event,
    Emitter<TrendingMoviesState> emit,
  ) async {
    emit(TrendingMoviesLoading());
    final failureOrMovies = await getTrendingMovies();
    failureOrMovies.fold(
      (failure) async => emit(TrendingMoviesError(failure.toString())),
      (movies) async => emit(TrendingMoviesLoaded(movies)),
    );
  }
}
