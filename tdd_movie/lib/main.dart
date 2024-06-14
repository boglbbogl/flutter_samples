import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tdd_movie/injection_container.dart';
import 'package:tdd_movie/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:tdd_movie/presentation/bloc/popular_movies/popular_movies_event.dart';
import 'package:tdd_movie/presentation/pages/popular_movies_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) =>
            getIt<PopularMoviesBloc>()..add(FetchPopularMovies()),
        child: const PopularMoviesScreen(),
      ),
    );
  }
}
