

import '../../domain/entities/movie_detail_entities.dart';
import '../../domain/entities/movie_entities.dart';
import '../../domain/repository/movie_repository.dart';
import '../datasources/movie_datasources.dart';


class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movie>> getPopularMovies() async {
    final movieModels = await remoteDataSource.getPopularMovies();
    return movieModels.map((model) => Movie(
      id: model.id,
      title: model.title,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage,
    )).toList();
  }

  @override
  Future<MovieDetail> getMovieDetail(int movieId) async {
    final detailModel = await remoteDataSource.getMovieDetail(movieId);
    return MovieDetail(
      id: detailModel.id,
      title: detailModel.title,
      overview: detailModel.overview,
      posterPath: detailModel.posterPath,
      backdropPath: detailModel.backdropPath,
      releaseDate: detailModel.releaseDate,
      voteAverage: detailModel.voteAverage,
      voteCount: detailModel.voteCount,
      runtime: detailModel.runtime,
      tagline: detailModel.tagline,
      homepage: detailModel.homepage,
      genres: detailModel.genres.map((g) => Genre(id: g.id, name: g.name)).toList(),
      productionCompanies: detailModel.productionCompanies
          .map((p) => ProductionCompany(id: p.id, name: p.name, logoPath: p.logoPath, originCountry: p.originCountry))
          .toList(),
      status: detailModel.status,
      originalLanguage: detailModel.originalLanguage,
      popularity: detailModel.popularity,
      budget: detailModel.budget,
      revenue: detailModel.revenue,
    );
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final movieModels = await remoteDataSource.getNowPlayingMovies();
    return movieModels.map((model) => Movie(
      id: model.id,
      title: model.title,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage,
    )).toList();
  }

  @override
  Future<List<Movie>> getTopRatedMovies() async {
    final movieModels = await remoteDataSource.getTopRatedMovies();
    return movieModels.map((model) => Movie(
      id: model.id,
      title: model.title,
      posterPath: model.posterPath,
      voteAverage: model.voteAverage,
    )).toList();
  }

}

