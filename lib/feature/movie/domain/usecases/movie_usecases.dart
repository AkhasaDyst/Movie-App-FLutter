
import '../entities/movie_detail_entities.dart';
import '../entities/movie_entities.dart';
import '../repository/movie_repository.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getPopularMovies();
  }
}

class GetNowPlayingMovies {
  final MovieRepository repository;

  GetNowPlayingMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getNowPlayingMovies();
  }
}

class GetTopRatedMovies {
  final MovieRepository repository;

  GetTopRatedMovies(this.repository);

  Future<List<Movie>> call() async {
    return await repository.getTopRatedMovies();
  }
}


class GetMovieDetail {
  final MovieRepository repository;

  GetMovieDetail(this.repository);

  Future<MovieDetail> call(int movieId) async {
    return await repository.getMovieDetail(movieId);
  }
}

