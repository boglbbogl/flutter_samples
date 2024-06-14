import 'dart:convert';

import 'package:tdd_movie/core/errors/server_exception.dart';
import 'package:tdd_movie/data/datasources/movie_remote_data_source.dart';
import 'package:tdd_movie/data/models/movie_model.dart';
import 'package:http/http.dart' as http;

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  const MovieRemoteDataSourceImpl({required this.client});

  static const BASE_URL = "https://api.themoviedb.org/3";
  static const API_KEY = "ba1dd6b0b9b6879f0eb57840acb565d4";

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<MovieModel> movies = (body["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client
        .get(Uri.parse("$BASE_URL/trending/movie/day?api_key=$API_KEY"));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<MovieModel> movies = (body["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw const ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client
        .get(Uri.parse("$BASE_URL/search/movie?query=$query&api_key=$API_KEY"));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<MovieModel> movies = (body["results"] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw const ServerException();
    }
  }
}
