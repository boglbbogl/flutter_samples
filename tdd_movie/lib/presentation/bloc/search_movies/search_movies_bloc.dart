import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_movie/domain/usecases/search_movies.dart';
import 'package:tdd_movie/presentation/bloc/search_movies/search_movies_event.dart';
import 'package:tdd_movie/presentation/bloc/search_movies/search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesBloc(this.searchMovies) : super(SearchMoviesInitial()) {
    on<FetchSearchMovies>(_fetch);
  }
  Future<void> _fetch(
    FetchSearchMovies event,
    Emitter<SearchMoviesState> emit,
  ) async {
    emit(SearchMoviesLoading());
    final failureOrMovies = await searchMovies(event.query);
    failureOrMovies.fold(
      (failure) async => emit(SearchMoviesError(failure.toString())),
      (movies) async => emit(SearchMoviesLoaded(movies)),
    );
  }
}
