class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });
}

class ProductionCompany {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });
}

class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final String releaseDate;
  final double voteAverage;
  final int voteCount;
  final int runtime;
  final String tagline;
  final String homepage;
  final List<Genre> genres;
  final List<ProductionCompany> productionCompanies;
  final String status;
  final String originalLanguage;
  final double popularity;
  final int budget;
  final int revenue;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.runtime,
    required this.tagline,
    required this.homepage,
    required this.genres,
    required this.productionCompanies,
    required this.status,
    required this.originalLanguage,
    required this.popularity,
    required this.budget,
    required this.revenue,
  });
}
