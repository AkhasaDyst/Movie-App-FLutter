class GenreModel {
  final int id;
  final String name;

  GenreModel({
    required this.id,
    required this.name,
  });

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompanyModel {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompanyModel({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) {
    return ProductionCompanyModel(
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
    );
  }
}

class MovieDetailModel {
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
  final List<GenreModel> genres;
  final List<ProductionCompanyModel> productionCompanies;
  final String status;
  final String originalLanguage;
  final double popularity;
  final int budget;
  final int revenue;

  MovieDetailModel({
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

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      runtime: json['runtime'],
      tagline: json['tagline'],
      homepage: json['homepage'],
      genres: (json['genres'] as List)
          .map((genre) => GenreModel.fromJson(genre))
          .toList(),
      productionCompanies: (json['production_companies'] as List)
          .map((company) => ProductionCompanyModel.fromJson(company))
          .toList(),
      status: json['status'],
      originalLanguage: json['original_language'],
      popularity: json['popularity'].toDouble(),
      budget: json['budget'],
      revenue: json['revenue'],
    );
  }
}
