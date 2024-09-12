import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/movie_detail_model.dart';
import '../models/movie_model.dart';


abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDetailModel> getMovieDetail(int movieId);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;
  final String apiKey = "aa3769eab109a08b3e48e63babd5a700";

  MovieRemoteDataSourceImpl(this.client);

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await client.get(
      Uri.parse('https://api.themoviedb.org/3/movie/popular?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await client.get(
      Uri.parse('https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load now playing movies');
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await client.get(
      Uri.parse('https://api.themoviedb.org/3/movie/top_rated?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final List results = json.decode(response.body)['results'];
      return results.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }


  @override
  Future<MovieDetailModel> getMovieDetail(int movieId) async {
    final response = await client.get(
      Uri.parse('https://api.themoviedb.org/3/movie/$movieId?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      return MovieDetailModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load movie details');
    }
  }
}

