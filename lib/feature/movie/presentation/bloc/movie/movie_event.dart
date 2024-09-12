import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}
class GetNowPlayingMoviesEvent extends MovieEvent {}

class GetTopRatedMoviesEvent extends MovieEvent {}

class GetPopularMoviesEvent extends MovieEvent {}

abstract class MovieDetailEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GetMovieDetailEvent extends MovieDetailEvent {
  final int movieId;

  GetMovieDetailEvent(this.movieId);

  @override
  List<Object> get props => [movieId];
}