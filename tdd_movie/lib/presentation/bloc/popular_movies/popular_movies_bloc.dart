import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_movie/domain/usecases/get_popular_movies.dart';
import 'package:tdd_movie/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:tdd_movie/presentation/bloc/popular_movies/popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc(this.getPopularMovies) : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>(_fetch);
  }
  Future<void> _fetch(
    FetchPopularMovies event,
    Emitter<PopularMoviesState> emit,
  ) async {
    emit(PopularMoviesLoading());
    final failureOrMovies = await getPopularMovies();
    failureOrMovies.fold(
      (failure) async => emit(PopularMoviesError(failure.toString())),
      (movies) async => emit(PopularMoviesLoaded(movies)),
    );
  }
}
