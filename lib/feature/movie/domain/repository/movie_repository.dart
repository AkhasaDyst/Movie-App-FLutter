import '../entities/movie_detail_entities.dart';
import '../entities/movie_entities.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
  Future<MovieDetail> getMovieDetail(int movieId);
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getTopRatedMovies();
}
