import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie_entities.dart';
import '../../domain/repository/movie_repository.dart';
import '../../domain/usecases/movie_usecases.dart';

import '../bloc/movie/movie_bloc.dart';
import '../pages/movie_detail_screen.dart';
import 'package:sizer/sizer.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final movieRepository = RepositoryProvider.of<MovieRepository>(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (context) =>
                  MovieDetailBloc(GetMovieDetail(movieRepository)),
              child: MovieDetailScreen(movieId: movie.id),
            ),
          ),
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          Size screenSize = MediaQuery.of(context).size;
          bool isWideScreen = screenSize.width > 600;

          return Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF90cea1).withOpacity(0.7),
                  Color(0xFF01b4e4).withOpacity(0.7)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 3,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
            constraints: BoxConstraints(
              minHeight: 20.0.h,
            ),
            child: isWideScreen
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    height: 180,
                    width: 140,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  movie.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Rating: ${movie.voteAverage}',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ],
            )
                :Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    height: 140,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.title,
                        style:
                        Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        'Rating: ${movie.voteAverage}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
              ],
            )
          );
        },
      ),
    );
  }
}
