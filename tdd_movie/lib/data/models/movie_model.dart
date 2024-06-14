import 'package:tdd_movie/domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  const MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        posterPath: json["poster_path"],
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "overview": overview,
      "poster_path": posterPath,
    };
  }

  Movie toEntry() =>
      Movie(id: id, title: title, overview: overview, posterPath: posterPath);
}
