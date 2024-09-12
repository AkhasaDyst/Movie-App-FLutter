import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie_detail_entities.dart';
import '../../../domain/entities/movie_entities.dart';


abstract class MovieState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieEmpty extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  MovieLoaded(this.movies);

  @override
  List<Object> get props => [movies];
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);

  @override
  List<Object> get props => [message];
}

abstract class MovieDetailState extends Equatable {
  @override
  List<Object> get props => [];
}

class MovieDetailEmpty extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailLoaded extends MovieDetailState {
  final MovieDetail movieDetail;

  MovieDetailLoaded(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}

class MovieDetailError extends MovieDetailState {
  final String message;

  MovieDetailError(this.message);

  @override
  List<Object> get props => [message];
}