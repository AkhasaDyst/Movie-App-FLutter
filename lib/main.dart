import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb/config/theme/theme.dart';
import 'feature/movie/data/datasources/movie_datasources.dart';
import 'feature/movie/data/repository/movie_repository_impl.dart';
import 'feature/movie/domain/repository/movie_repository.dart';
import 'feature/movie/domain/usecases/movie_usecases.dart';
import 'feature/movie/presentation/bloc/movie/movie_bloc.dart';
import 'feature/movie/presentation/pages/movie_home_screen.dart';

void main() {
  final remoteDataSource = MovieRemoteDataSourceImpl(http.Client());
  final repository = MovieRepositoryImpl(remoteDataSource);
  final getPopularMovies = GetPopularMovies(repository);
  final getNowPlayingMovies = GetNowPlayingMovies(repository);
  final getTopRatedMovies = GetTopRatedMovies(repository);
  runApp(
    RepositoryProvider<MovieRepository>(
      create: (context) => repository,
      child: MyApp(getPopularMovies: getPopularMovies, getNowPlayingMovies: getNowPlayingMovies, getTopRatedMovies: getTopRatedMovies, ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final GetPopularMovies getPopularMovies;
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetTopRatedMovies getTopRatedMovies;

  MyApp({
    required this.getPopularMovies,
    required this.getNowPlayingMovies,
    required this.getTopRatedMovies,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MovieTheme.themeData,
      debugShowCheckedModeBanner: false,
      title: 'TMDB',
      home: BlocProvider(
        create: (context) => MovieBloc(getPopularMovies: getPopularMovies, getNowPlayingMovies: getNowPlayingMovies, getTopRatedMovies: getTopRatedMovies, ),
        child: HomeScreen(),
      ),
    );
  }
}
