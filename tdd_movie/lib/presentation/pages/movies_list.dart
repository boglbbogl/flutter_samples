import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tdd_movie/domain/entities/movie.dart';

class MoviesList extends StatelessWidget {
  final List<Movie> movies;
  const MoviesList({
    super.key,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.network(
            "https://image.tmdb.org/t/p/w500/${movies[index].posterPath}",
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text(movies[index].title),
          subtitle: Text(movies[index].overview),
          onTap: () {},
        );
      },
    );
  }
}
