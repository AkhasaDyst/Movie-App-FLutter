import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/movie_usecases.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMovies getPopularMovies;
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetTopRatedMovies getTopRatedMovies;

  MovieBloc({
    required this.getPopularMovies,
    required this.getNowPlayingMovies,
    required this.getTopRatedMovies,
  }) : super(MovieEmpty()) {
    on<GetPopularMoviesEvent>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await getPopularMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError('Failed to load popular movies'));
      }
    });

    on<GetNowPlayingMoviesEvent>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await getNowPlayingMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError('Failed to load now playing movies'));
      }
    });

    on<GetTopRatedMoviesEvent>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await getTopRatedMovies();
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError('Failed to load top-rated movies'));
      }
    });
  }
}


class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;

  MovieDetailBloc(this.getMovieDetail) : super(MovieDetailEmpty()) {
    on<GetMovieDetailEvent>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        final detail = await getMovieDetail(event.movieId);
        emit(MovieDetailLoaded(detail));
      } catch (e) {
        emit(MovieDetailError('Failed to load movie details'));
      }
    });
  }
}
